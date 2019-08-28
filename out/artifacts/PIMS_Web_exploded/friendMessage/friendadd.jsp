<%@ page import="FriendServlet.FriendBean" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: 齐佩
  Date: 2019/6/19
  Time: 18:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <meta charset="utf-8">
    <title>iview example</title>
    <!-- import CSS -->
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <link rel="stylesheet" href="../css/booklist.css">
</head>
<body>
<div  id="app">
    <el-row>
        <el-col :span="12">
            <el-card >
                <div slot="header" class="clearfix">
                    <span>查询通讯录好友</span>
                </div>
                <form  action="http://localhost:8080/FriendfindServlet" method="POST">
                    查询好友账号：<input type="text" name="fUsername"></input>
                    <input type="submit" value="开始查询" style="width:100px;margin-left:10px ">
                </form>

                <table border="2" cellspacing="0"cellpadding="0" width="60%"align="center">
                    <tr>
                        <th height="30">姓名</th>
                        <th height="30">院系名称</th>
                        <th height="30">校区</th>
                        <th height="30">年级</th>
                        <th height="30">电话号码</th>
                    </tr>
                    <%
                        ArrayList onefriend=(ArrayList)session.getAttribute("onefriend");
                        if(onefriend==null||onefriend.size()==0){
                    %>
                    <div align="center">
                        <h1>您还没有任何联系人！</h1>
                    </div>
                    <%
                    }else{
                        for(int i=onefriend.size()-1;i>=0;i--){
                            FriendBean ff=(FriendBean)onefriend.get(i);
                    %>
                    <tr>
                        <td><%=ff.getUsername()%></td>
                        <td><%=ff.getDepartment()%></td>
                        <td><%=ff.getSchoolzone()%></td>
                        <td><%=ff.getGradeyear()%></td>
                        <td><%=ff.getTelphone()%></td>

                    </tr>
                    <%
                            }
                        }
                    %>
                </table>
            </el-card>

        </el-col>
        <el-col :span="12">
            <el-card>
                <div slot="header" class="clearfix">
                    <span>添加通讯录好友</span>
                </div>
                <form action="http://localhost:8080/FriendaddServlet" method="POST" >
                    <div class="form-item">
                        用户名：<input type="text" name="fUsername"></input>
                    </div>

                    <div class="form-item">
                        电话号码: <input type="text" name="fTelphone"></input>
                    </div>
                    <div class="form-item">
                        院系名称: <select name="fDepartment">
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
                        年级：<select name="fGradeyear">
                        <option value ="大一">大一</option>
                        <option value ="大二">大二</option>
                        <option value="大三">大三</option>
                        <option value="大四">大四</option>
                    </select>
                    </div>

                    <div class="form-item">
                        校区：<select name="fSchoolzone">
                        <option value="莞城校区">莞城校区</option>
                        <option value="松山湖校区">松山湖校区</option>
                    </select>
                    </div>
                    <input type="submit" value="确定添加" style="width:100px;margin-left:10px ">
                </form>

            </el-card></el-col>
    </el-row>

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
    var app=new Vue({
        el: '#app',
        data() {
            return {
                tableData: [{

                }]
            }
        },
        methods: {

        },
    })
</script>
<style>
    .el-card{
        width:98%;
        margin:10px;
        height: 550px;
    }
    .form-item{
        color:gray;

        margin: 16px;
        font-size: 20px;
    }
</style>
