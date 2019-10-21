package cn.hom1.app.service.impl;

import cn.hom1.app.model.dto.QiNiuPutSet;
import cn.hom1.app.model.entity.Attachment;
import cn.hom1.app.model.enums.AttachLocationEnum;
import cn.hom1.app.repository.AttachmentRepository;
import cn.hom1.app.service.AttachmentService;
import cn.hom1.app.service.base.AbstractCrudService;
import cn.hom1.app.utils.HomUtil;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.text.StrBuilder;
import cn.hutool.core.util.StrUtil;
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
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Random;
import javax.servlet.http.HttpServletRequest;
import net.coobird.thumbnailator.Thumbnails;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
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


  @Override
  public Map<String, String> upload(MultipartFile file, HttpServletRequest request) {
    Map<String, String> resultMap;
    String attachLoc = "";
    if (StrUtil.isEmpty(attachLoc)) {
      attachLoc = "qiniu";
    }
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
    final Map<String, String> resultMap = new HashMap<>(6);
    final String dateString = DateUtil.format(DateUtil.date(), "yyyyMMddHHmmss");
    try {
      //用户目录
      final StrBuilder uploadPath = new StrBuilder(System.getProperties().getProperty("user.home"));
      uploadPath.append("/hom1/");
      uploadPath.append("upload/");

      //获取当前年月以创建目录，如果没有该目录则创建
      /*uploadPath.append(DateUtil.thisYear()).append("/").append(DateUtil.thisMonth()).append("/");*/
      final File mediaPath = new File(uploadPath.toString());
      if (!mediaPath.exists()) {
        if (!mediaPath.mkdirs()) {
          resultMap.put("success", "0");
          return resultMap;
        }
      }

      //不带后缀
      final StrBuilder nameWithOutSuffix = new StrBuilder(file.getOriginalFilename().substring(0, file.getOriginalFilename().lastIndexOf('.')).replaceAll(" ", "_").replaceAll(",", ""));
      nameWithOutSuffix.append(dateString);
      nameWithOutSuffix.append(new Random().nextInt(1000));

      //文件后缀
      final String fileSuffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf('.') + 1);

      //带后缀
      final StrBuilder fileName = new StrBuilder(nameWithOutSuffix);
      fileName.append(".");
      fileName.append(fileSuffix);

      file.transferTo(new File(mediaPath.getAbsoluteFile(), fileName.toString()));

      //文件原路径
      final StrBuilder fullPath = new StrBuilder(mediaPath.getAbsolutePath());
      fullPath.append("/");
      fullPath.append(fileName);

      //压缩文件路径
      final StrBuilder fullSmallPath = new StrBuilder(mediaPath.getAbsolutePath());
      fullSmallPath.append("/");
      fullSmallPath.append(nameWithOutSuffix);
      fullSmallPath.append("_small.");
      fullSmallPath.append(fileSuffix);

      //映射路径
      final StrBuilder filePath = new StrBuilder("/upload/");
      filePath.append(fileName);

      //缩略图映射路径
      final StrBuilder fileSmallPath = new StrBuilder("/upload/");
      fileSmallPath.append(nameWithOutSuffix);
      fileSmallPath.append("_small.");
      fileSmallPath.append(fileSuffix);

      try {
        //压缩图片
        Thumbnails.of(fullPath.toString()).size(256, 256).keepAspectRatio(true).toFile(fullSmallPath.toString());

      } catch (Exception e){
        logger.error(e.getMessage());
      }

      final String size = String.valueOf(new File(fullPath.toString()).length());
      final String wh = "**";
      resultMap.put("fileName", fileName.toString());
      resultMap.put("filePath", filePath.toString());
      resultMap.put("smallPath", fileSmallPath.toString());
      resultMap.put("suffix", fileSuffix);
      resultMap.put("size", size);
      resultMap.put("wh", wh);
      resultMap.put("location", AttachLocationEnum.SERVER.getDesc());
    } catch (IOException e) {
      e.printStackTrace();
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
      final String key = "images/"+System.currentTimeMillis() + file.getOriginalFilename();
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
      resultMap.put("size", HomUtil.parseSize(file.getSize()));
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
