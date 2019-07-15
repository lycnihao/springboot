package cn.hom1.app.service.impl;

import cn.hom1.app.model.entity.AttachLocationEnum;
import cn.hom1.app.service.AttachmentService;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.text.StrBuilder;
import cn.hutool.core.util.StrUtil;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import javax.servlet.http.HttpServletRequest;
import net.coobird.thumbnailator.Thumbnails;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

/**
 * 上传转发
 *
 * @author iksen
 * @date 2019-07-15 14:22
 */
@Service
public class AttachmentServiceImpl implements AttachmentService {

  @Override
  public Map<String, String> upload(MultipartFile file, HttpServletRequest request) {
    Map<String, String> resultMap;
    String attachLoc = "";
    if (StrUtil.isEmpty(attachLoc)) {
      attachLoc = "server";
    }
    switch (attachLoc) {
      case "server":
        resultMap = this.attachUpload(file, request);
        break;
/*      case "qiniu":
        resultMap = this.attachQiNiuUpload(file, request);
        break;
      case "upyun":
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
      uploadPath.append(DateUtil.thisYear()).append("/").append(DateUtil.thisMonth()).append("/");
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

      //压缩图片
      Thumbnails.of(fullPath.toString()).size(256, 256).keepAspectRatio(false).toFile(fullSmallPath.toString());

      //映射路径
      final StrBuilder filePath = new StrBuilder("/upload/");
      filePath.append(DateUtil.thisYear());
      filePath.append("/");
      filePath.append(DateUtil.thisMonth());
      filePath.append("/");
      filePath.append(fileName);

      //缩略图映射路径
      final StrBuilder fileSmallPath = new StrBuilder("/upload/");
      fileSmallPath.append(DateUtil.thisYear());
      fileSmallPath.append("/");
      fileSmallPath.append(DateUtil.thisMonth());
      fileSmallPath.append("/");
      fileSmallPath.append(nameWithOutSuffix);
      fileSmallPath.append("_small.");
      fileSmallPath.append(fileSuffix);

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
}
