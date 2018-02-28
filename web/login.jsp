<%--
  Created by IntelliJ IDEA.
  User: bruce
  Date: 2018/2/28
  Time: 17:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ page import="com.bruce.model.User" %>
<%
    if(request.getAttribute("user")==null){
        String userName=null;
        String password=null;

        Cookie[] cookies=request.getCookies();
        for(int i=0;cookies!=null && i<cookies.length;i++){
            if(cookies[i].getName().equals("user")){
                userName=cookies[i].getValue().split("-")[0];
                password=cookies[i].getValue().split("-")[1];
            }
        }
        if(userName==null){
            userName="";
        }
        if(password==null){
            password="";
        }
        pageContext.setAttribute("user", new User(userName,password));
    }
%>
<html>
<head>
    <title>登录页面</title>
    <link href="${pageContext.request.contextPath}/style/login.css" rel="stylesheet">
    <!--引入bootstrap-->
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/bootstrap/js/jQuery.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript">
        function checkForm(){
            var userName=document.getElementById("username").value;
            var password=document.getElementById("password").value;
            if(userName==null || userName==""){
                document.getElementById("error").innerHTML="用户名不能为空";
                return false;
            }
            if(password==null || password==""){
                document.getElementById("error").innerHTML="密码不能为空";
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <div class="container">
        <form name="myForm" class="form-signin" action="login" method="post" onsubmit="checkForm()">
            <h2 class="form-signin-heading">我的日记本</h2>
            <input id="username" name="username" value="${user.userName}" type="text" class="input-block-level" placeholder="您的姓名...">
            <input id="password" name="password" value="${user.password }" type="password" class="input-block-level" placeholder="您的密码..." >
            <label class="checkbox">
                <input id="remember" name="remember" type="checkbox" value="remember-me">记住我&nbsp;&nbsp;&nbsp;&nbsp; <font id="error" color="red">${error }</font>
            </label>
            <button class="btn btn-large btn-primary" type="submit">登录</button>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <button class="btn btn-large btn-primary" type="button" >重置</button>
            <p align="center" style="padding-top: 15px;">版权所有  2018 bruce  <a href="http://www.baidu.com" target="_blank">http://www.baidu.com</a></p>
        </form>
    </div>
</body>
</html>
