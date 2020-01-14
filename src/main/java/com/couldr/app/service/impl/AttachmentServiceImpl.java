package com.couldr.app.service.impl;

import com.couldr.app.model.dto.QiNiuPutSet;
import com.couldr.app.model.dto.UploadResult;
import com.couldr.app.model.entity.Attachment;
import com.couldr.app.model.enums.AttachLocationEnum;
import com.couldr.app.repository.AttachmentRepository;
import com.couldr.app.service.AttachmentService;
import com.couldr.app.service.base.AbstractCrudService;
import com.couldr.app.utils.CouldrUtil;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.text.StrBuilder;
import cn.hutool.core.util.StrUtil;
import com.couldr.app.utils.FilenameUtils;
import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;
import com.qiniu.common.QiniuException;
import com.qiniu.common.Zone;
import com.qiniu.http.Response;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.UploadManager;
import com.qiniu.storage.persistent.FileRecorder;
import com.qiniu.util.Auth;
import com.qiniu.util.StringMap;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;
import java.util.Random;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import net.coobird.thumbnailator.Thumbnails;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import org.springframework.web.multipart.MultipartFile;

/**
 * 上传转发
 *
 * @author iksen
 * @date 2019-07-15 14:22
 */
@Service
public class AttachmentServiceImpl extends AbstractCrudService<Attachment, Long> implements AttachmentService {

  private final static Logger logger = LoggerFactory.getLogger(AttachmentServiceImpl.class);

  private final AttachmentRepository attachmentRepository;

  public AttachmentServiceImpl(AttachmentRepository attachmentRepository) {
    super(attachmentRepository);
    this.attachmentRepository = attachmentRepository;
  }


  /**
   * 上传的子目录。
   */
  private final static String UPLOAD_SUB_DIR = "upload/";

  private final String workDir = System.getProperties().getProperty("user.home") + "/couldr/";

  /**
   * 路径分隔符
   */
  /*public static final String FILE_SEPARATOR = File.separator;*/
  private static final String FILE_SEPARATOR = "/";

  @Value("${qiniu.qiniu_access_key}")
  private String qiniuAccessKey;
  @Value("${qiniu.qiniu_secret_key}")
  private String qiniuSecretKey;
  @Value("${qiniu.qiniu_domain}")
  private String qiniuDomain;
  @Value("${qiniu.qiniu_bucket}")
  private String qiniuBucket;
  @Value("${qiniu.qiniu_small_url}")
  private String qiniuSmallUrl;

  @Value("${admin.attachLoc}")
  private String attachLoc = "";


  @Override
  public Map<String, String> upload(MultipartFile file, HttpServletRequest request) {
    Map<String, String> resultMap;
    switch (attachLoc) {
      case "server":
        resultMap = this.attachUpload(file, request);
        break;
      case "qiniu":
        resultMap = this.attachQiNiuUpload(file, request);
        break;
      /*case "upyun":
        resultMap = this.attachUpYunUpload(file, request);
        break;*/
      default:
        resultMap = this.attachUpload(file, request);
        break;
    }
    return resultMap;
  }

  /**
   * 原生服务器上传
   *
   * @param file    file
   * @param request request
   * @return Map
   */
  @Override
  public Map<String, String> attachUpload(MultipartFile file, HttpServletRequest request) {
    Assert.notNull(file, "Multipart file must not be null");
    final Map<String, String> resultMap = new HashMap<>(6);

    // 获取当前时间
    Calendar current = Calendar.getInstance();
    // 获得月份和日期
    int year = current.get(Calendar.YEAR);
    int month = current.get(Calendar.MONTH) + 1;


    // 构建目录
    String subDir = UPLOAD_SUB_DIR + year + FILE_SEPARATOR + month + FILE_SEPARATOR;

    String originalBasename = FilenameUtils.getBasename(file.getOriginalFilename());
    //去除url多余目录
    originalBasename = originalBasename.lastIndexOf("/") == -1 ? originalBasename : originalBasename.substring(originalBasename.lastIndexOf("/"),originalBasename.length());

    // Get basename
    String basename = originalBasename + '-' + CouldrUtil.randomUUIDWithoutDash();

    // Get extension
    String extension = FilenameUtils.getExtension(file.getOriginalFilename());

    logger.debug("Base name: [{}], extension: [{}] of original filename: [{}]", basename, extension, file.getOriginalFilename());

    // Build sub file path
    String subFilePath = subDir + basename + '.' + extension;

    // Get upload path
    Path uploadPath = Paths.get(workDir, subFilePath);

    logger.info("Uploading to directory: [{}]", uploadPath.toString());

    try {
      // TODO Synchronize here
      // Create directory
      Files.createDirectories(uploadPath.getParent());
      Files.createFile(uploadPath);

      // Upload this file
      file.transferTo(uploadPath);

      // Build upload result
      UploadResult uploadResult = new UploadResult();
      uploadResult.setFilename(originalBasename);
      uploadResult.setFilePath(subFilePath);
      uploadResult.setKey(subFilePath);
      uploadResult.setSuffix(extension);
      /*uploadResult.setMediaType(MediaType.valueOf(Objects.requireNonNull(file.getContentType())));*/
      uploadResult.setSize(file.getSize());

      // Check file type
      if (uploadResult.getMediaType() != null && MediaType.valueOf("image/*").includes(uploadResult.getMediaType())) {

        // Read as image
        BufferedImage image = ImageIO.read(Files.newInputStream(uploadPath));

        // Set width and height
        uploadResult.setWidth(image.getWidth());
        uploadResult.setHeight(image.getHeight());

      }
      resultMap.put("fileName", uploadResult.getFilename());
      resultMap.put("filePath", uploadResult.getFilePath());
      resultMap.put("smallPath", uploadResult.getThumbPath());
      resultMap.put("suffix", uploadResult.getSuffix());
      resultMap.put("size", CouldrUtil.parseSize(file.getSize()));
      resultMap.put("wh", uploadResult.getWidth() + "x" + uploadResult.getHeight());
      resultMap.put("location", AttachLocationEnum.SERVER.getDesc());
      return resultMap;
    } catch (IOException e) {
      logger.error("Failed to upload file to local: " + uploadPath, e);
    }
  return resultMap;
  }


  /**
   * 七牛云上传
   *
   * @param file    file
   * @param request request
   * @return Map
   */
  @Override
  public Map<String, String> attachQiNiuUpload(MultipartFile file, HttpServletRequest request) {
    final Map<String, String> resultMap = new HashMap<>(6);
    try {
      final Configuration cfg = new Configuration(Zone.zone2());
      final String key = "website/"+System.currentTimeMillis() + file.getOriginalFilename();
      final String accessKey = qiniuAccessKey;
      final String secretKey = qiniuSecretKey;
      final String domain = qiniuDomain;
      final String bucket = qiniuBucket;
      final String smallUrl = qiniuSmallUrl;

      if (StrUtil.isEmpty(accessKey) || StrUtil.isEmpty(secretKey) || StrUtil.isEmpty(domain) || StrUtil.isEmpty(bucket)) {
        return resultMap;
      }

      final Auth auth = Auth.create(accessKey, secretKey);
      final StringMap putPolicy = new StringMap();
      putPolicy.put("returnBody", "{\"size\":$(fsize),\"w\":$(imageInfo.width),\"h\":$(imageInfo.height)}");
      final String upToken = auth.uploadToken(bucket, null, 3600, putPolicy);
      final String localTempDir = Paths.get(System.getenv("java.io.tmpdir"), bucket).toString();
      QiNiuPutSet putSet = new QiNiuPutSet();
      try {
        final FileRecorder fileRecorder = new FileRecorder(localTempDir);
        final UploadManager uploadManager = new UploadManager(cfg, fileRecorder);
        final Response response = uploadManager.put(file.getInputStream(), key, upToken, null, null);
        //解析上传成功的结果
        putSet = new Gson().fromJson(response.bodyString(), QiNiuPutSet.class);
      } catch (QiniuException e) {
        final Response r = e.response;
        System.err.println(r.toString());
        try {
          System.err.println(r.bodyString());
        } catch (QiniuException ex2) {
          //ignore
        }
      } catch (JsonSyntaxException e) {
        e.printStackTrace();
      } catch (IOException e) {
        e.printStackTrace();
      }
      final String filePath = domain.trim() + "/" + key;
      resultMap.put("fileName", file.getOriginalFilename());
      resultMap.put("filePath", filePath.trim());
      resultMap.put("smallPath", smallUrl == null ? filePath.trim() : (filePath + smallUrl).trim());
      resultMap.put("suffix", file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf('.')));
      resultMap.put("size", CouldrUtil.parseSize(file.getSize()));
      resultMap.put("wh", putSet.getW() + "x" + putSet.getH());
      resultMap.put("location", AttachLocationEnum.QINIU.getDesc());
    } catch (Exception e) {
      e.printStackTrace();
    }
    return resultMap;
  }


  /**
   * 获取所有附件信息
   *
   * @return List
   */
  @Override
  public List<Attachment> listAll() {
    return super.listAll();
  }

  /**
   * 获取所有附件信息 分页
   *
   * @param pageable pageable
   * @return Page
   */
  @Override
  public Page<Attachment> listAll(Pageable pageable) {
    return attachmentRepository.findAll(pageable);
  }

  /**
   * 根据附件id查询附件
   *
   * @param attachId attachId
   * @return Optional
   */
  @Override
  public Optional<Attachment> fetchById(Long attachId) {
    return attachmentRepository.findById(attachId);
  }
}
