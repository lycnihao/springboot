package cn.hom1.app.controller;

import cn.hom1.app.model.dto.JsonResult;
import cn.hom1.app.model.entity.User;
import cn.hom1.app.service.UserService;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/admin/user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping()
    public String links(ModelMap modelMap) {
        List<User> userList = userService.listAll();
        modelMap.addAttribute("users", userList);
        return "user";
    }
/*    @RequestMapping("updateData")
    @ResponseBody
    public Links getLinks(Long linkId) {
        return linksService.getById(linkId);
    }*/

    @RequestMapping("save")
    @ResponseBody
    public JsonResult add(@ModelAttribute User user) {
        user.setCreateTime(new Date());
        user.setStatus(1);
        userService.create(user);
        return new JsonResult(200,"用户添加成功");
    }

    /*@RequestMapping("delete/{linkId}")
    @ResponseBody
    public JsonResult delete(@PathVariable Integer linkId) {
        linksService.delete(linkId);
        return new JsonResult(200,"");
    }*/
}
