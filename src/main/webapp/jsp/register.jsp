<%--
  Created by IntelliJ IDEA.
  User: honeyxie
  Date: 2019/1/25
  Time: 16:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
</head>
<body>
<div id="loginDiv" title="Register" class="easyui-panel" style="width:40%;padding:30px 70px 20px 70px;">
    <form id="ff" class="easyui-form" method="post" data-options="novalidate:true">
        <div style="margin-bottom:10px">
            <label for="username" >username</label>
            <input id="username" class="easyui-textbox" name="username" style="width:100%;height:40px;padding:12px" data-options="prompt:'Username',iconCls:'icon-man',iconWidth:38">
        </div>
        <div style="margin-bottom:10px">
            <input class="easyui-textbox" name="password" type="password" style="width:100%;height:40px;padding:12px" data-options="prompt:'Password',iconCls:'icon-lock',iconWidth:38">
        </div>
    </form>

</div>
</body>
</html>
