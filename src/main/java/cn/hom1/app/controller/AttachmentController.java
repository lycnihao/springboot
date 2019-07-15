package cn.hom1.app.controller;

import cn.hom1.app.model.dto.JsonResult;
import cn.hom1.app.service.AttachmentService;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("attachments")
public class AttachmentController {

    @Autowired
    private AttachmentService attachmentService;

    @RequestMapping("uploadModal")
    public String uploadModal(){
        return "attachment-upload";
    }


    @PostMapping("upload")
    @ResponseBody
    public JsonResult upload(@RequestParam("file") MultipartFile file,
        HttpServletRequest request){
      if (!file.isEmpty()) {
        Map<String, String> resultMap = attachmentService.upload(file,request);
        for (String key : resultMap.keySet()) {
          System.out.println(key+"-->"+resultMap.get("key"));
        }
      }
      return new JsonResult();
    }
}
