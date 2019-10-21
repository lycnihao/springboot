package cn.hom1.app.controller;

import cn.hom1.app.model.dto.JsonResult;
import cn.hom1.app.model.entity.Attachment;
import cn.hom1.app.service.AttachmentService;

import java.util.Map;
import java.util.Optional;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/admin/attachments")
public class AttachmentController {

    @Autowired
    private AttachmentService attachmentService;

    /**
     * 附件列表列表
     *
     * @param model model
     * @return 模板路径/admin_attachment
     */
    @RequestMapping
    public String attachment(Model model,
        @PageableDefault(size = 72, sort = "attachId", direction = Sort.Direction.DESC) Pageable pageable) {
        final Page<Attachment> attachments = attachmentService.listAll(pageable);
        model.addAttribute("attachments", attachments);
        return "attachment";
    }

    @PostMapping("upload")
    @ResponseBody
    public JsonResult upload(@RequestParam("file") MultipartFile file,
                             HttpServletRequest request) {
        Map<String, String> resultMap = null;
        if (!file.isEmpty()) {
            resultMap = attachmentService.upload(file, request);
        }

        //保存在数据库
        Attachment attachment = new Attachment();
        attachment.setAttachName(resultMap.get("fileName"));
        attachment.setAttachPath(resultMap.get("filePath"));
        attachment.setAttachSmallPath(resultMap.get("smallPath"));
        attachment.setAttachType(file.getContentType());
        attachment.setAttachSuffix(resultMap.get("suffix"));
        attachment.setAttachSize(resultMap.get("size"));
        attachment.setAttachWh(resultMap.get("wh"));
        attachment.setAttachLocation(resultMap.get("location"));
        attachmentService.create(attachment);

        return new JsonResult(200, resultMap);
    }

    /**
     * 处理获取附件详情的请求
     *
     * @param model    model
     * @param attachId 附件编号
     * @return 模板路径 widget/_attachment-detail
     */
    @GetMapping(value = "/attachment")
    public String attachmentDetail(Model model, @RequestParam("attachId") Long attachId) {
        final Optional<Attachment> attachment = attachmentService.fetchById(attachId);
        model.addAttribute("attachment", attachment.orElse(new Attachment()));
        return "widget/attachment-detail";
    }

    /**
     * 跳转选择附件页面
     *
     * @param model model
     * @return 模板路径admin/widget/_attachment-select
     */
    @GetMapping(value = "/select")
    public String selectAttachment(Model model,
        @PageableDefault(size = 18, sort = "attachId", direction = Sort.Direction.DESC) Pageable pageable,
        @RequestParam(value = "id", defaultValue = "none") String id,
        @RequestParam(value = "type", defaultValue = "normal") String type) {
        final Page<Attachment> attachments = attachmentService.listAll(pageable);
        model.addAttribute("id", id);
        model.addAttribute("attachments", attachments);
        return "widget/attachment-select";
    }

}
