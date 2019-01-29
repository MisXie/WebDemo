package com.xie.controller;

import com.xie.bean.User;
import com.xie.bean.vo.UserVo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author xieyongjing
 */
@Controller
public class LoginController {

  @GetMapping("/")
  public String welcome(){
    return "/jsp/login";
  }

  @PostMapping("/login")
  @ResponseBody
  public Object login(HttpServletRequest request, User user){
    HttpSession session = request.getSession();
    session.setAttribute("user",user);
    return user;
  }

  @PostMapping("/register")
  @ResponseBody
  public Object register(HttpServletResponse response, User user){
    StringBuilder sb = new StringBuilder();
    UserVo userVo = new UserVo();
    if(user.getEmail().equals("")){
      sb.append("邮箱已经存在");
    }
    if(user.getUsername().equals("")){
      sb.append("\t 用户名已经存在");
    }
    userVo.setUsername(user.getUsername());
    userVo.setValidateInfo(sb.toString());
    return userVo;
  }

  @PostMapping("/validate")
  @ResponseBody
  public Object validate(HttpServletResponse response, User user){
    return user;
  }
}
