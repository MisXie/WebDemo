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
    String acount = request.getParameter("acount");
    acount = acount == null ? "" : acount;
%>
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/static/js/jquery-easyui-1.7.2/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/static/js/jquery-easyui-1.7.2/themes/icon.css">
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/static/js/jquery-easyui-1.7.2/themes/color.css">
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/static/js/jquery-easyui-1.7.2/demo/demo.css">
<link rel="stylesheet" type="text/css" href="<%=contextPath%>/css/login.css"/>
<script type="text/javascript" src="<%=contextPath%>/static/js/jquery-easyui-1.7.2/jquery.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/static/js/jquery-easyui-1.7.2/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=contextPath%>/static/js/jquery-easyui-1.7.2/locale/easyui-lang-zh_CN.js"></script>
<script src="<%=contextPath%>/static/js/login.js"></script>

<script type="text/javascript">
    var contextPath = '<%=contextPath%>';
    var acount = '<%=acount%>';
</script>

<html>
<head>
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
</head>
<body style="">
<div id="loginDiv" title="login" class="easyui-panel" style="width:30%;padding:30px 70px 20px 70px;">
    <div style="margin-bottom:10px">
        <input class="easyui-textbox" name="username" required="true" style="width:100%;height:40px;padding:12px" value="<%=acount%>"
               data-options="prompt:'邮箱或者名称',iconCls:'icon-man',iconWidth:38">
    </div>
    <div style="margin-bottom:20px">
        <input class="easyui-passwordbox" required="true" name="password" type="password" style="width:100%;height:40px;padding:12px"
               data-options="prompt:'密码',iconWidth:38">
    </div>
    <div class="operForm">
        <a href="javascript:void(0)" onclick="submitF()" class="easyui-linkbutton" data-options="iconCls:'icon-ok'"
           style="padding:2px 0px;width:100%;">
            <span style="font-size:12px;">Login</span>
        </a>
    </div>
    <div class="operForm" style="margin-left: 27%">
        <a href="javascript:void(0)" onclick="register()" class="easyui-linkbutton" data-options="iconCls:'icon-edit'"
           style="padding:2px 0px;width:100%;">
            <span style="font-size:12px;">register</span>
        </a>
    </div>
    <div style="margin-left: 140px;margin-top: 4px">
        <a href="javascript:void(0)" onclick="findInfo()" class="" style="text-decoration: none;padding:20px 0px;width:100%;">
            <span style="font-size:12px;">forgive password?</span>
        </a>
    </div>

    <div id="registerDlg" title="注册">
            <div style="margin-bottom:10px;margin-top: 10px">
                <label for="user">帐号:</label>
                <input type="text" name="rUsername" required="true" class="easyui-textbox" id="user"
                       data-options="prompt:'不小于2位',iconCls:'icon-man',iconWidth:38"
                       style="width:50%;height:34px;padding:10px"/>
            </div>
            <div style="margin-bottom:10px">
                <label for="password">密码:</label>
                <input id="password" class="easyui-passwordbox" required="true" iconWidth="28"
                       style="width:50%;height:34px;padding:10px;">
            </div>
            <div style="margin-bottom:10px;">
                <label for="pass2" style="margin-left: -28px">确认密码:</label>
                <input id="pass2" class="easyui-passwordbox" required="true" iconWidth="28" validType="confirmPass['#password']"
                       style="width:50%;height:34px;padding:10px;">
            </div>
            <div style="margin-bottom:10px;">
                <label for="email">邮箱:</label>
                <input type="text" name="email" class="easyui-textbox" id="email"
                       data-options="required:'true',validType:'email'"
                       style="width:50%;height:34px;padding:10px"/>
            </div>
            <div>
                <label>性别：</label>
                <input type="radio" name="sex" id="male" checked="checked"><label
                    for="male">男</label></input><input type="radio" name="sex" id="female"><label
                    for="female">女</label></input>
            </div>
    </div>
</div>

</body>
<script>

</script>
</html>
