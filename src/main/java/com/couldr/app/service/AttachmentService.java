package com.couldr.app.service;

import com.couldr.app.service.base.CrudService;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;

import com.couldr.app.model.entity.Attachment;
import org.springframework.web.multipart.MultipartFile;

public interface AttachmentService extends CrudService<Attachment, Long> {
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

  /**
   * 七牛云上传
   *
   * @param file    file
   * @param request request
   * @return Map
   */
  Map<String, String> attachQiNiuUpload(MultipartFile file, HttpServletRequest request);

}
