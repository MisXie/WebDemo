package com.xie.controller;

import com.xie.bean.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

@Controller
public class Frist {

    @GetMapping("/frist")
    public String frist(HttpServletRequest request){
        String contextPath = request.getSession().getServletContext().getContextPath();
        System.out.println(request.getParameter("username"));
        return "/jsp/first";
    }


}
