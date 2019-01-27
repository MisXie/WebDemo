<%--
  Created by IntelliJ IDEA.
  User: honeyxie
  Date: 2019/1/2
  Time: 14:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<script src="../static/js/jquery-easyui-1.5.3/jquery.min.js"></script>
<script src="../static/js/ajaxfileupload.js"></script>
<script>
    var contextPath= "${pageContext.servletContext.contextPath}";
    var localIp = "<%=request.getLocalAddr()%>";
    var serverPort = "<%=request.getServerPort()%>";
    var url = "http://"+localIp+":"+serverPort+contextPath+"/fileDown";
</script>
<style>
    .fileUpload{
        width: 100px;height: 25px;
        /*border: slateblue 1px solid;*/
        text-align: center;
        position: relative;
    }

    #upload{
        width: 100%;height: 100%;
        font-size: 10px;opacity: 0;
        position: absolute;
        margin-left: -10px;
    }
    #download{
        width: 100%;height: 100%;
        font-size: 15px
    }
</style>
<head>
    <title>Title</title>
</head>
<body>
<div class="fileUpload">
    <input type="file" id="upload" name="myfile" title=""/>
    <span class="chooseFile">请选择文件</span>
</div>
<div class="fileUpload">
    <button id="download" onclick="downloadFile(url)" value="">下载test.txt</button>
</div>

</body>
<script type="text/javascript">
    $("#upload").on("click",function(){
        $.ajaxFileUpload({
            url : contextPath+'/imgUpload',//后台请求地址
            type: 'post',//请求方式  当要提交自定义参数时，这个参数要设置成post
            secureuri : false,//是否启用安全提交，默认为false。
            fileElementId : 'upload',// 需要上传的文件域的ID，即<input type="file">的ID。
            dataType : 'json',//服务器返回的数据类型。可以为xml,script,json,html。如果不填写，jQuery会自动判断。如果json返回的带pre,这里修改为json即可解决。
            success : function (json, status) {//提交成功后自动执行的处理函数，参数data就是服务器返回的数据。
                alert(json);
            },
            error : function (json, status, e) {//提交失败自动执行的处理函数。
                alert(json);
            }
        });
    });


    //url表示请求路径,进入后台处理,后台返回一个文件流
    //例如:url为htpp://127.0.0.1/test
    function downloadFile(url){
        //定义一个form表单,通过form表单来发送请求
        var form=$("<form>");
        //设置表单状态为不显示
        form.attr("style","display:none");
        //method属性设置请求类型为get
        form.attr("method","get");
        //action属性设置请求路径,(如有需要,可直接在路径后面跟参数)
        //例如:htpp://127.0.0.1/test?id=123
        form.attr("action",url);
        //将表单放置在页面(body)中
        $("body").append(form);
        //表单提交
        form.submit();
    }
</script>
</html>
