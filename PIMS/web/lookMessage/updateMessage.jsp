<%-- 
    Document   : updateMessage
    Created on : 2012-3-20, 23:30:55
    Author     : Administrator
--%>
<%@ page import="LookServlet.LookMessageBean" %>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>个人信息管理系统->查看</title>
        <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
        <link rel="stylesheet" href="../css/booklist.css">
    </head>
    <body bgcolor="#f7f7f6">
        <hr noshade>
        <br><br>

        <div  id="app">

            <el-container>

                <el-main >
                    <el-card class="box-card1">
                        <div slot="header" class="clearfix">
                            <span>修改基本信息</span>
                        </div>
                        <div class="avatar">
                            <form action="http://localhost:8080/UpdateMessageServlet" method="post">
                                <div class="form-item">
                                    用户名：<input type="text" name="Username" value=<%=session.getAttribute("userName")%>></input>
                                </div>
                                <div class="form-item">
                                    学校账号: <input type="text" name="StudentId"></input>
                                </div>
                                <div class="form-item">
                                    电话号码: <input type="text" name="Telphone"></input>
                                </div>
                                <div class="form-item">
                                    院系名称: <select name="Department">
                                    <option value ="网络空间安全学院">网络空间安全学院</option>
                                    <option value ="机械工程学院">机械工程学院</option>
                                    <option value ="电子工程与智能化学院">电子工程与智能化学院</option>
                                    <option value="计算机科学与技术学院">计算机科学与技术学院</option>
                                    <option value="生态环境与建筑工程学院i">生态环境与建筑工程学院</option>
                                    <option value ="经济与管理学院">经济与管理学院</option>
                                    <option value ="社会发展研究院">社会发展研究院</option>
                                    <option value="文学与传媒学院">文学与传媒学院</option>
                                    <option value="法律与社会工作学院">法律与社会工作学院</option>

                                    <option value ="教育学院">教育学院</option>
                                    <option value ="化学工程与能源技术学院">化学工程与能源技术学院</option>
                                    <option value="机器人学院">机器人学院</option>
                                    <option value="中法联合学院">中法联合学院</option>
                                    <option value ="智能制造学院">智能制造学院</option>

                                </select>
                                </div>

                                <div class="form-item">
                                    年级：<select name="Gradeyear">
                                    <option value ="大一">大一</option>
                                    <option value ="大二">大二</option>
                                    <option value="大三">大三</option>
                                    <option value="大四">大四</option>
                                </select>
                                </div>

                                <div class="form-item">
                                    校区：<select name="Schoolzone">
                                    <option value="莞城校区">莞城校区</option>
                                    <option value="松山湖校区">松山湖校区</option>
                                </select>
                                </div>
                                <div class="form-item">
                                    备注：<input type="textarea" style="height: 50px" name="remarks"></input>
                                </div>
                                <input type="submit" value="提交资料">
                            </form>
                        </div>
                    </el-card>
                    <el-card class="box-card1">
                        <div slot="header" class="clearfix">
                            <span>修改密码</span>
                        </div>
                        <form action="http://localhost:8080/UpdatePasswordServlet" method="POST">
                            <div class="uppw">
                                原密码：<input type="password" name="orailpassword"></input>
                            </div>
                            <div class="uppw">
                                新密码：<input type="password" name="newpassword"></input>
                            </div>
                            <input type="submit" value="确定修改">
                        </form>
                    </el-card>
                </el-main>
            </el-container>

        </div>
    </body>
</html>
<!-- import Vue before Element -->
<!-- 引入样式 -->
<!-- import Vue before Element -->
<script src="https://unpkg.com/vue/dist/vue.js"></script>
<!-- import JavaScript -->
<script src="https://unpkg.com/element-ui/lib/index.js"></script>
<script>
    new Vue({
        el: '#app',
        data: function() {
            return {
                value: new Date(),
            }
        }
    });
</script>
<style>
    .uppw{
        height: 30px;
        margin: 10px;
    }
    .box-card1{
        width: 500px;
        height: 450px;
        float: left;
        margin-right: 50px;
    }
</style>
