

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%


    String userName = (String) session.getAttribute("userName");
%>
<html>
<head>
    <title>Title</title>
    <meta charset="utf-8">
    <title>iview example</title>
    <!-- import CSS -->
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <link rel="stylesheet" href="../css/booklist.css">
</head>
<body style="margin: 0px">
<!--表头导航栏-->
<div class="tops">
    <ul>
        <li><a href="#news" class="money">充值金币</a></li>
        <li><a href="http://localhost:8080/login.jsp" target="_parent">退出系统</a></li>

        <li><a  href="http://localhost:8080/ShopingServlert?userName=<%=userName%>" target="showframe" >购物车</a></li>
        <li><a href="http://localhost:8080/main/main.jsp">卖家中心</a></li>
        <li><a href="http://localhost:8080/main/main.jsp">账号管理</a></li>
        <li><a href="http://localhost:8080/login.jsp" target="_top">登录</a></li>
        <li ><a href="http://localhost:8080/register/register.jsp" target="_top">注册</a></li>
        <li ><a href="http://localhost:8080/BookMessage/homepage.jsp" target="_top">首页</a></li>

    </ul>
</div>
<!--表头导航栏结束-->

<!--搜索框-->
<div style="margin-top: 20px">
    <el-row>
        <el-col :span="8" >
            <img src="../image/logo.png" style="width: 26%; float: left; margin-right:260px ">
        </el-col>

    </el-row>
</div>
</body>
</html>

