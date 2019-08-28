<%@ page import="java.util.ArrayList" %>
<%@ page import="BGUserManager.UserBean" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="https://unpkg.com/vue/dist/vue.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>
    <title>Document</title>
</head>

<body>
<div id="app">
    <el-card class="box-card" style="width:100%;margin-top: 5px;">
        <div slot="header" class="clearfix">
            <i class="el-icon-tickets"></i>
            <span>用户列表</span>
        </div>
        <div>
            <el-table ref="Table" :data="list" style="width: 100%" @selection-change="" border>
                <el-table-column type="selection" width="60" align="center"></el-table-column>
                <el-table-column label="序号" type="index" width="50"> </el-table-column>
                <el-table-column label="学校账号" align="center" prop="StudentId"></el-table-column>
                <el-table-column label="姓名" width="150" align="center" prop="Username"></el-table-column>

                <el-table-column label="校区" width="100" align="center" prop="Schoolzone"></el-table-column>
                <el-table-column label="电话号码" width="150" align="center" prop="Telphone"></el-table-column>
                <el-table-column label="院系名称" width="150" align="center" prop="Department"></el-table-column>
                <el-table-column label="年级" width="100" align="center" prop="Gradeyear"></el-table-column>
                <el-table-column label="操作" width="160" align="center">
                    <template slot-scope="scope">
                        <el-button size="mini"
                                   @click="handleEditProduct(scope.$index, scope.row)">编辑
                        </el-button>
                        <el-button size="mini" type="danger"
                                   @click="handleDelete(scope.$index, scope.row)">删除
                        </el-button>
                    </template>
                </el-table-column>
            </el-table>
        </div>
    </el-card>
</div>
<script>
    var app = new Vue({
        el: '#app',
        data() {
            return {
                list:[
                    <%
                        ArrayList userlist=(ArrayList)session.getAttribute("userlist");
                        if(userlist!=null||userlist.size()!=0){
                    %>
                    <%
                        for(int i=userlist.size()-1;i>=0;i--){
                            UserBean ff=(UserBean)userlist.get(i);
                    %>
                    {
                        StudentId:'<%=ff.getStudentId()%>',
                        Username:'<%=ff.getUsername()%>',
                        Money:'<%=ff.getMoney()%>',
                        Schoolzone:'<%=ff.getSchoolzone()%>',
                        Telphone:'<%=ff.getTelphone()%>',
                        Department:'<%=ff.getDepartment()%>',
                        Gradeyear:'<%=ff.getGradeyear()%>',
                        remarks:'<%=ff.getRemarks()%>',
                    },
                    <%
                          }
                        }
                    %>
                ],
            }
        },
        methods: {
            handleSelectionChange(val) {
                this.multipleSelection = val;
            },
            handleEditProduct(index,row){
                window.location.href="http://localhost:8080/LookUpdateServlet?StudentId="+row.StudentId;
            },
            handleDelete(index, row){
                this.$confirm('是否要进行删除操作?', '提示', {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning'
                }).then(() => {
                    window.location.href="http://localhost:8080/DeleteUserServlet?StudentId="+row.StudentId;
                });
            },
        }
    })
</script>
</body>

</html>

    
