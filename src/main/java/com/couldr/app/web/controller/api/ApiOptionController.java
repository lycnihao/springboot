package com.couldr.app.web.controller.api;

import com.couldr.app.model.dto.JsonResult;
import com.couldr.app.service.AttachmentService;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

/**
 * 描述
 *
 * @author iksen
 * @date 2019-12-19 14:23
 */
@Controller
@RequestMapping("/api/option")
public class ApiOptionController {

  private AttachmentService attachmentService;

  public ApiOptionController(AttachmentService attachmentService) {
    this.attachmentService = attachmentService;
  }

  @RequestMapping("/skinUpload")
  @ResponseBody
  private JsonResult skinUpload(@RequestParam("file") MultipartFile file,
      HttpServletRequest request){
    Map<String, String> resultMap = null;
    if (!file.isEmpty()) {
      resultMap = attachmentService.attachUpload(file, request);
    }
    return new JsonResult(1,resultMap);
  }

}
