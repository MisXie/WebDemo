package com.xie.controller;


import com.alibaba.fastjson.JSONObject;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
public class FileUpload {



    @PostMapping("imgUpload")
    public @ResponseBody
    //MultipartFile myfile 参数名要和界面input标签的name属性值一致
    Object imgUpload( @RequestParam MultipartFile myfile, HttpServletRequest request){
        Map<String,Object> map= new HashMap<String,Object>();
        if(myfile.isEmpty()){
            map.put( "result", "error");
            map.put( "msg", "上传文件不能为空" );
        } else{
            String originalFilename=myfile.getOriginalFilename();
            String fileBaseName= FilenameUtils.getBaseName(originalFilename);
            String floderName=fileBaseName+"_" +new Date().toString();
            try{
                String contextPath = request.getSession().getServletContext().getContextPath();
                String genePicPath=request.getSession().getServletContext().getRealPath("/upload");
                //把上传的图片放到服务器的文件夹下
                FileUtils. copyInputStreamToFile(myfile.getInputStream(), new File(genePicPath,originalFilename));
                //coding
                map.put( "result", "success");

            } catch (Exception e) {
                map.put( "result", "error");
                map.put( "msg",e.getMessage());

            }
        }
        System.out.println("enenenenen");
        //String result=String. valueOf(JSONObject.toJSONString (map));
        return map;
    }

    @GetMapping("/fileDown")
    public ResponseEntity<byte[]> fileDownload(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String contextPath = request.getSession().getServletContext().getContextPath();
        String genePicPath=request.getSession().getServletContext().getRealPath("/upload");
        File file = new File(genePicPath,"test.txt");
        response.setStatus(HttpStatus.OK.value());
        return buildResponseEntity(file);
    }

    /**
     * 构建下载类
     * @param file
     * @return
     * @throws IOException
     */
    public static ResponseEntity<byte[]> buildResponseEntity(File file) throws IOException {
        ResponseEntity<byte[]> entity;
        try( InputStream is = new FileInputStream(file)){
            byte[] body;
            //获取文件
            body = new byte[is.available()];
            is.read(body);
            HttpHeaders headers = new HttpHeaders();
            //设置文件类型
            headers.add("Content-Disposition", "attchement;filename=" + file.getName());
            //设置Http状态码
            HttpStatus statusCode = HttpStatus.OK;
            //返回数据
            entity = new ResponseEntity<>(body, headers, statusCode);
        }
        return entity;
    }
}
