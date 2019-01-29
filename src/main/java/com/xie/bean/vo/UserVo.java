package com.xie.bean.vo;

import com.xie.bean.User;
import org.springframework.stereotype.Component;

/**
 * @author xieyongjing
 */
public class UserVo {
  private String validateInfo;
  private String username;

  public String getValidateInfo() {
    return validateInfo;
  }

  public void setValidateInfo(String validateInfo) {
    this.validateInfo = validateInfo;
  }

  public String getUsername() {
    return username;
  }

  public void setUsername(String username) {
    this.username = username;
  }
}
