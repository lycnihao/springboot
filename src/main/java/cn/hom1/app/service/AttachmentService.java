package cn.hom1.app.service;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.multipart.MultipartFile;

public interface AttachmentService {
  /**
   * 上传转发
   *
   * @param file    file
   * @param request request
   * @return Map
   */
  Map<String, String> upload(MultipartFile file, HttpServletRequest request);

  /**
   * 原生服务器上传
   *
   * @param file    file
   * @param request request
   * @return Map
   */
  Map<String, String> attachUpload(MultipartFile file, HttpServletRequest request);
}
