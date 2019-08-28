<%@ page import="java.util.ArrayList" %>
<%@ page import="BGOrderManager.OrderBean" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>订单信息</title>
    <script src="https://unpkg.com/vue/dist/vue.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>
</head>

<body>
<!-- 订单列表开始 -->
<div id="app">
    <el-card class="box-card" style="width:100%;margin-top: 5px;">
        <div slot="header" class="clearfix">
            <i class="el-icon-tickets"></i>
            <span>购物信息</span>
        </div>
        <div>
            <el-table :data="list"   border>
                <el-table-column label="序号"  align="center" type="index"> </el-table-column>
                <el-table-column label="订单编号"  align="center" prop="OrderId"></el-table-column>
                <el-table-column label="书籍编号"  align="center" prop="BookId"></el-table-column>
                <el-table-column label="订单价格"  align="center" prop="orderprice"></el-table-column>
                <el-table-column label="订单时间"  align="center" prop="orderdate"></el-table-column>
                <el-table-column label="卖家账号"  align="center" prop="BuyerId"></el-table-column>
                <el-table-column label="书籍状态"  align="center" prop="BookStatus"></el-table-column>

                <el-table-column label="操作"  align="center" >
                    <template slot-scope="scope">
                        <el-button size="mini"  type="danger" @click="handleReturn(scope.$index, scope.row)">退货申请
                        </el-button>

                        <el-button size="mini" type="danger" @click="handleDelete(scope.$index, scope.row)">删除
                        </el-button>
                    </template>
                </el-table-column>
            </el-table>
        </div>

    </el-card>
</div>
<!-- 出售列表结束 -->

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
                      ArrayList orderlist=(ArrayList)session.getAttribute("myorderlist");
                      if(orderlist!=null||orderlist.size()!=0){
                    %>
                    <%
                        for(int i=orderlist.size()-1;i>=0;i--){
                            OrderBean ff=(OrderBean)orderlist.get(i);
                    %>
                    {
                        OrderId:'<%=ff.getOrderId()%>',
                        BookId:'<%=ff.getBookId()%>',
                        BookStatus:'<%=ff.getBookStatus()%>',
                        BuyerId:'<%=ff.getBookSellerid()%>',
                        SalerId:'<%=ff.getBookBuyerid()%>',
                        orderprice:'<%=ff.getOrdermoney()%>',
                        orderdate:'<%=ff.getOrderDate()%>'
                    },
                    <%
                          }
                        }
                    %>
                ],
            }
        },
        methods: {
            handleReturn(index, row) {
                if(row.BookStatus=='退货申请中') alert("不可发起重复申请，申请失败");
                else{
                    this.$confirm('是否要进行申请退货?', '提示', {
                        confirmButtonText: '确定',
                        cancelButtonText: '取消',
                        type: 'warning'
                    }).then(() => {
                        if(row.BookStatus!='退货申请中') {
                            window.location.href = "http://localhost:8080/LookReturnRequestServlet?OrderId=" + row.OrderId;
                        }
                    });
                }
            },
            handleDelete(index, row) {
                this.$confirm('是否要进行删除操作?', '提示', {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning'
                }).then(() => {
                    window.location.href="http://localhost:8080/DeleteOrderServlet?OrderId="+row.OrderId;
                });
            },
        }
    })
</script>

<style scoped>
    .el-button{
        margin-bottom: 10px;
    }
</style>