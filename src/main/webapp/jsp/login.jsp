<%--
  Created by IntelliJ IDEA.
  User: honeyxie
  Date: 2019/1/23
  Time: 10:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String contextPath = request.getContextPath();
%>
<link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/color.css">
<link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/demo/demo.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="https://www.jeasyui.com/easyui/jquery.easyui.min.js"></script>
<script src="<%=contextPath%>/static/js/login.js"></script>

<script type="text/javascript">
    var contextPath = '<%=contextPath%>';
</script>
<style type="text/css">
    .operForm{
        text-align:center; display: inline-block;width: 35%;
    }
</style>

<html>
<head>
    <title>Login</title>
</head>
<body style="background-image:url('<%=contextPath%>/static/images/loginBackgroud.png')">
    <div id="loginDiv" title="login" class="easyui-panel" style="width:400px;padding:30px 70px 20px 70px;">
        <form id="ff" class="easyui-form" method="post" data-options="novalidate:true">
            <div style="margin-bottom:10px">
                <input class="easyui-textbox" name="username" style="width:100%;height:40px;padding:12px" data-options="prompt:'Username',iconCls:'icon-man',iconWidth:38">
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="password" type="password" style="width:100%;height:40px;padding:12px" data-options="prompt:'Password',iconCls:'icon-lock',iconWidth:38">
            </div>
            <div class="operForm" style="margin-left: 0px">
                <a href="javascript:void(0)" onclick="submitF()" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" style="padding:2px 0px;width:100%;">
                    <span style="font-size:12px;">Login</span>
                </a>
            </div>
            <div class="operForm"  style="margin-left: 70px">
                <a href="javascript:void(0)"  onclick="register()" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" style="padding:2px 0px;width:100%;">
                    <span style="font-size:12px;">register</span>
                </a>
            </div>
            <div  style="margin-left: 140px;margin-top: 4px">
                <a href="javascript:void(0)"  onclick="findInfo()" class="" style="padding:50px 0px;width:100%;">
                    <span style="font-size:12px;">forgive password?</span>
                </a>
            </div>

        </form>

    </div>
    <div id="registerDlg" title="Basic Dialog" data-options="iconCls:'icon-save'" style="width:400px;height:200px;padding:10px">
        The dialog content.
    </div>
</body>
<script>

</script>
</html>
