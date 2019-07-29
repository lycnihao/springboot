package cn.hom1.app.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 后台管理
 *
 * @author iksen
 * @date 2019-07-29 15:00
 */
@Controller
@RequestMapping("admin")
public class AdminController {

  private final static Logger logger = LoggerFactory.getLogger(AdminController.class);

  @RequestMapping
  public String admin() {
    return "index";
  }

}
