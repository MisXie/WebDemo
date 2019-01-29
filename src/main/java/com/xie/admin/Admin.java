package com.xie.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author xieyongjing
 */
@Controller
public class Admin {

  @GetMapping("/admin")
  public String admin(){
    return "admin";
  }
}
