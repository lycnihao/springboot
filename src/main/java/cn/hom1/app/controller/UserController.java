package cn.hom1.app.controller;

import cn.hom1.app.model.dto.JsonResult;
import cn.hom1.app.model.entity.User;
import cn.hom1.app.service.UserService;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/admin/user")
public class UserController {

    private UserService userService;

    public UserController(UserService userService) {
      this.userService = userService;
    }

  @RequestMapping()
    public String links(ModelMap modelMap) {
        List<User> userList = userService.listAll();
        modelMap.addAttribute("users", userList);
        return "user";
    }

    @RequestMapping("updateData/{userId}")
    @ResponseBody
    public User getUser(@PathVariable Long userId) {
        return userService.getById(userId);
    }

    @RequestMapping("save")
    @ResponseBody
    public JsonResult add(@ModelAttribute User user) {

        User uUser = userService.findByName(user.getUsername());
        if (uUser != null){
          return new JsonResult(0,"用户名已存在");
        }

        String password = new BCryptPasswordEncoder().encode(user.getPassword());
        user.setPassword(password);
        user.setCreateTime(new Date());
        user.setStatus(1);
        userService.create(user);
        return new JsonResult(1,"用户添加成功");
    }

    @RequestMapping("update")
    @ResponseBody
    public JsonResult update(@ModelAttribute User user) {

      User uUser = userService.findByName(user.getUsername());
      if (uUser != null && !uUser.getUserId().equals(user.getUserId())){
        return new JsonResult(0,"用户名已存在");
      }

      user.setStatus(user.getStatus());
      userService.create(user);
      return new JsonResult(1,"用户修改成功");
    }

    @RequestMapping("delete/{userId}")
    @ResponseBody
    public JsonResult delete(@PathVariable Long userId) {
        userService.removeById(userId);
        return new JsonResult(200,"");
    }

  @RequestMapping("repeat")
  @ResponseBody
  public JsonResult repeat(@RequestParam(value = "username") String username,@RequestParam(value = "userId",required = false) Long userId) {
    User user = userService.findByName(username);
    if (user == null){
      return new JsonResult(1,"可用");
    }
    if (user.getUserId().equals(userId)){
      return new JsonResult(1,"可用");
    }
    return new JsonResult(0,"当前用户名已注册，换一个试试吧");
  }


}
