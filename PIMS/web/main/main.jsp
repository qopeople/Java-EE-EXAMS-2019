<%-- 
    Document   : main
    Created on : 2012-3-20, 22:12:50
    Author     : Administrator
--%>

<%@page import="loginRegister.LoginBean"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>个人信息管理系统--主页面</title>
    </head>
    <%
        String userName=null;
            //获取在LoginServlet.java中保存在session对象中的数据
            ArrayList login=(ArrayList)session.getAttribute("login");
            if(login==null||login.size()==0){
                   response.sendRedirect("http://localhost:8080/login.jsp");
            }else{
                for(int i=login.size()-1;i>=0;i--){
                    LoginBean nn=(LoginBean)login.get(i);
                    userName=nn.getUserName();

                }
            }
    %>
    <frameset rows="20%,80%" framespacing="0" border="no" frameborder="0">
        <frame src="./top.jsp" name="left" scrolling="no">

        <frameset cols="14%,86%" framespacing="0" border="no" frameborder="0">
            <frame src="./left.jsp">
            <frame src="http://localhost:8080/LookMessageServlet?userName=<%=userName%>" name="showframe">
        </frameset>
        <noframes>
            <body style="background-color:#f7f7f6">您的浏览器无法处理框架！</body>
        </noframes>

    </frameset>

</html>
