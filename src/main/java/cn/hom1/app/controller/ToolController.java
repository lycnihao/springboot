package cn.hom1.app.controller;

import cn.hom1.app.utils.RequestWeb;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


/**
 * 工具接口
 *
 */
@Controller
@RequestMapping("admin/tool/links")
public class ToolController {

  @Autowired
  private RequestWeb requestWeb;

  @RequestMapping
  @ResponseBody
  public String admin() {
      requestWeb.pust();
    return "ok";
  }
}
