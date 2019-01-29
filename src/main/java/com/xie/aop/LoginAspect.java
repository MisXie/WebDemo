package com.xie.aop;

import com.xie.bean.User;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @author xieyongjing
 */
@Aspect
@Component
public class LoginAspect {

  @Around(value = "execution(* com.xie.admin.*.*(..))")
  public Object isLogin(ProceedingJoinPoint point) throws Throwable {
    HttpServletRequest httpServletRequest = httpServletRequest();
    HttpSession session = httpServletRequest.getSession();
    User user = (User) session.getAttribute("user");
    if(user == null){
      return "redirect:/jsp/login.jsp";
    }
    return point.proceed();
  }

  public static HttpServletRequest httpServletRequest() {
    HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder
            .getRequestAttributes()).getRequest();
    return request;
  }
}
