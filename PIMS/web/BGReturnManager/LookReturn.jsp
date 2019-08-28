<%@ page import="java.util.ArrayList" %>
<%@ page import="BGReturnManager.ReturnBean" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>退货信息</title>
    <script src="https://unpkg.com/vue/dist/vue.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>
</head>

<body>
<!-- 退货列表开始 -->
<div id="app">
    <el-card class="box-card" style="width:100%;margin-top: 5px;">
        <div slot="header" class="clearfix">
            <i class="el-icon-tickets"></i>
            <span>退货列表</span>
        </div>
        <div>
            <el-table :data="list" style="width: 100%" border>
                <el-table-column type="selection" align="center"></el-table-column>
                <el-table-column label="序号"  align="center" type="index"> </el-table-column>
                <el-table-column label="服务单号"  align="center" prop="ServiceId"></el-table-column>
                <el-table-column label="申请时间"  align="center" prop="RequestDate"></el-table-column>
                <el-table-column label="用户账号"  align="center" prop="Username"></el-table-column>
                <el-table-column label="退款金额"  align="center" prop="ReturnMoney"></el-table-column>
                <el-table-column label="申请状态"  align="center" prop="ServiceStatus"></el-table-column>
                <el-table-column label="处理时间"  align="center" prop="ServiceDate"></el-table-column>
                <el-table-column label="操作"  align="center">
                    <template slot-scope="scope">
                        <el-button size="mini" @click="handleEditProduct(scope.$index, scope.row)">审核
                        </el-button>
                        <el-button size="mini" type="danger" @click="handleDelete(scope.$index, scope.row)">删除
                        </el-button>
                    </template>
                </el-table-column>
            </el-table>
        </div>

    </el-card>
</div>
<!-- 退货列表结束 -->
</body>
</html>

<script>
    var app = new Vue({
        el: '#app',
        data() {
            return {
                hasEditCreated: false,
                list: [
                    <%
                      ArrayList returnlist=(ArrayList)session.getAttribute("returnlist");
                      if(returnlist!=null||returnlist.size()!=0){
                    %>
                    <%
                        for(int i=returnlist.size()-1;i>=0;i--){
                            ReturnBean ff=(ReturnBean)returnlist.get(i);
                    %>
                    {
                        ServiceId:'<%=ff.getServiceId()%>',
                        RequestDate:'<%=ff.getRequestDate()%>',
                        Username:'<%=ff.getUsername()%>',
                        ReturnMoney:'<%=ff.getReturnMoney()%>',
                        ServiceStatus:'<%=ff.getServiceStatus()%>',
                        ServiceDate:'<%=ff.getServiceDate()%>',
                    },
                    <%
                          }
                        }
                    %>
                ],
            }
        },
        methods: {
            handleEditProduct(index,row){
                window.location.href="http://localhost:8080/CheckReturnServlet?ServiceId="+row.ServiceId;
            },
            handleDelete(index, row) {
                this.$confirm('是否要进行删除操作?', '提示', {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning'
                }).then(() => {
                    window.location.href="http://localhost:8080/DeleteReturnServlet?ServiceId="+row.ServiceId;
                });
            },
        }
    })
</script>

<style scoped>
</style>