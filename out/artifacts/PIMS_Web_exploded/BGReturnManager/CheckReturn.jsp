<%@ page import="java.util.ArrayList" %>

<%@ page import="BGReturnManager.ReturnBean" %>
<%@ page import="BGOrderManager.OrderBean" %>
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
<!-- 退货商品信息开始 -->
<div id="app">
    <el-card  class="box-card" style="margin-top: 5px;">
        <div slot="header" class="clearfix">
            <span>退货商品</span>
        </div>
        <div>
            <el-table :data="Returnbook" style="width: 100%" border>
                <el-table-column label="序号" width="100" align="center" type="index" ></el-table-column>
                <el-table-column label="订单编号" prop="OrderId" sortable width="120" align="center"></el-table-column>
                <el-table-column label="订单时间" prop="OrderDate" align="center"></el-table-column>
                <el-table-column label="书籍编号" prop="BookId" sortable width="120" align="center"></el-table-column>
                <el-table-column label="卖家账号" prop="BookSellerId" sortable width="120" align="center"></el-table-column>
                <el-table-column label="买家账号" prop="BookBuyerId" width="100" align="center"></el-table-column>
                <el-table-column label="书籍状态" prop="BookStatus" sortable width="120" align="center"></el-table-column>
                <el-table-column label="订单金额" prop="Ordermoney" width="100" align="center"></el-table-column>
            </el-table>
        </div>
    </el-card>
    <!-- 退货商品表单结束 -->
    <!-- 退货服务单信息开始 -->
    <el-card  class="box-card" style="margin-top: 5px;">
        <div slot="header" class="clearfix">
            <span>退货信息</span>
        </div>
        <div >
            <el-form :model="Returnvalue" label-width="120px" style="height:auto" size="small">
                <el-form-item label="服务单号：" prop="ServiceId">
                    <el-input v-model="Returnvalue.ServiceId" readonly></el-input>
                </el-form-item>
                <el-form-item label="订单编号：" prop="OrderId">
                    <el-input v-model="Returnvalue.OrderId" readonly></el-input>
                </el-form-item>
                <el-form-item label="申请时间：" prop="RequestDate">
                    <el-input v-model="Returnvalue.RequestDate" readonly></el-input>
                </el-form-item>
                <el-form-item label="用户账号：" prop="Username">
                    <el-input v-model="Returnvalue.Username" readonly></el-input>
                </el-form-item>
                <el-form-item label="退款金额：" prop="ReturnMoney">
                    <el-input style="width:80px;" v-model.number="Returnvalue.ReturnMoney" readonly></el-input>
                </el-form-item>
                <el-form-item label="申请状态：" prop="ServiceStatus">
                    <el-input v-model="Returnvalue.ServiceStatus" readonly></el-input>
                </el-form-item>
                <el-form-item label="处理时间：" prop="ServiceDate">
                    <el-input v-model="Returnvalue.ServiceDate" readonly></el-input>
                </el-form-item>
                <el-form-item label="退货原因描述：" prop="ReturnDescribe">
                    <el-input v-model="Returnvalue.ReturnDescribe" readonly></el-input>
                </el-form-item>
                <el-form-item label="处理备注：" prop="ServiceRemark">
                    <el-input v-model="Returnvalue.ServiceRemark" ></el-input>
                </el-form-item>
                </el-form-item>
                <el-button type="primary" size="medium" @click="Request" style="position: relative;left:44%;">通过审核</el-button>
                <el-button type="primary" size="medium" @click="ban" style="position: relative;left:44%;">驳回</el-button>
                </el-form-item>
            </el-form>
        </div>
    </el-card>
</div>
<!-- 退货服务单信息结束 -->
</body>
</html>

<script>
    var app=new Vue({
        el: '#app',
        data() {
            return {
                Returnvalue:{
                    <%
                        ArrayList checkreturn=(ArrayList)session.getAttribute("checkreturn");
                        if(checkreturn!=null){
                    %>
                    <%
                        ReturnBean ff=(ReturnBean)checkreturn.get(0);
                    %>
                    ServiceId:'<%=ff.getServiceId()%>',
                    OrderId:'<%=ff.getOrderId()%>',
                    RequestDate:'<%=ff.getRequestDate()%>',
                    Username:'<%=ff.getUsername()%>',
                    ReturnMoney:'<%=ff.getReturnMoney()%>',
                    ServiceStatus:'<%=ff.getServiceStatus()%>',
                    ServiceDate:'<%=ff.getServiceDate()%>',
                    ReturnDescribe:'<%=ff.getReturnDescribe()%>',
                    ServiceRemark:'<%=ff.getServiceRemark()%>',
                    <%
                        }
                    %>
                },
                Returnbook:[
                    <%
                        ArrayList returnbook=(ArrayList)session.getAttribute("returnbook");
                        if(returnbook!=null||returnbook.size()!=0){
                    %>
                    <%
                        OrderBean ff=(OrderBean)returnbook.get(0);
                    %>
                    {
                        OrderId: '<%=ff.getOrderId()%>',
                        OrderDate: '<%=ff.getOrderDate()%>',
                        BookId: '<%=ff.getBookId()%>',
                        BookSellerId: '<%=ff.getBookSellerid()%>',
                        BookBuyerId: '<%=ff.getBookBuyerid()%>',
                        BookStatus: '<%=ff.getBookStatus()%>',
                        Ordermoney: '<%=ff.getOrdermoney()%>',
                    }
                    <%
                        }
                    %>
                ]
            }
        },
        methods: {
            Request(){
                window.location.href="http://localhost:8080/PassReturnServlet?ServiceId="+this.Returnvalue.ServiceId+"&ServiceStatus="+"通过"+"&ServiceRemark="+this.Returnvalue.ServiceRemark;
            },
            ban(){
                window.location.href="http://localhost:8080/PassReturnServlet?ServiceId="+this.Returnvalue.ServiceId+"&ServiceStatus="+"不通过"+"&ServiceRemark="+this.Returnvalue.ServiceRemark;
            }
        }
    })
</script>

<style scoped>
    .avatar-uploader .el-upload {
        border: 1px dashed #d9d9d9;
        border-radius: 6px;
        cursor: pointer;
        position: relative;
        overflow: hidden;
    }
    .avatar-uploader .el-upload:hover {
        border-color: #409EFF;
    }
    .avatar-uploader-icon {
        font-size: 28px;
        color: #8c939d;
        width: 178px;
        height: 178px;
        line-height: 178px;
        text-align: center;
    }
    .avatar {
        width: 178px;
        height: 178px;
        display: block;
    }
    .el-input{
        width:250px;
    }
    .box-card{
        height: auto;
    }
</style>
