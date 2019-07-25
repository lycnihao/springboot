package cn.hom1.app.service;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

import cn.hom1.app.model.entity.Attachment;
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

  List<Attachment> listAll();

  void save(Attachment attachment);

  Attachment fetchById(long attachId);

}
