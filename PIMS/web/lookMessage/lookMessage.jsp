<%-- 
    Document   : lookMessage
    Created on : 2012-3-20, 23:13:38
    Author     : Administrator
--%>


<%@page import="java.util.ArrayList"%>
<%@ page import="LookServlet.LookMessageBean" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    ArrayList wordlist=(ArrayList)session.getAttribute("wordlist");
    LookMessageBean mm= (LookMessageBean) wordlist.get(0);

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>个人信息管理系统--查看个人信息</title>
    </head>
        <body>

                <div class="lookinform">
                    用户名：<%=mm.getUsername() %>
                </div>
                <hr>
                <div class="lookinform">
                    学校中央认证账号：<%=mm.getStudentId() %>
                </div>
                <hr>
                <div class="lookinform">
                    电话号码：<%=mm.getTelphone()%>
                </div>
                <hr>
                <div class="lookinform">
                    院系名称：<%=mm.getDepartment() %>
                </div>
                <hr>
                <div class="lookinform">
                    年级：<%=mm.getGradeyear()%>
                </div>
                <hr>
                <div class="lookinform">
                    校区：<%=mm.getSchoolzone() %>
                </div>
                <hr>
                <div class="lookinform">
                    备注（其他信息  ）：<%=mm.getRemarks() %>
                </div>

        </body>
</html>
<style>
    .lookinform{
        color:gray;
        margin: 20px;
        font-size: 20px;

    }

</style>