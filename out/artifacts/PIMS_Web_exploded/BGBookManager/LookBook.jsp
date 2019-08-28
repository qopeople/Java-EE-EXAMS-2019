<%@ page import="java.util.ArrayList" %>
<%@ page import="BookServlet.BookBean" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>书籍信息</title>
  <script src="https://unpkg.com/vue/dist/vue.js"></script>
  <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
  <script src="https://unpkg.com/element-ui/lib/index.js"></script>
</head>
<body>
<!-- 待上架图书列表开始 -->
<div id="app">
  <el-card  class="box-card" style="width:100%;margin-top: 5px;">
    <div slot="header" class="clearfix">
      <i class="el-icon-tickets"></i>
      <span>待上架图书列表</span>
    </div>
    <div>
      <el-table ref="productTable"
                :data="list"
                style="width: 100%"
                @selection-change="handleSelectionChange"
                border>
        <el-table-column type="selection" width="60" align="center"></el-table-column>
        <el-table-column label="序号" width="100" align="center" type="index" >
        </el-table-column>
        <el-table-column label="书籍图片" width="120" align="center">
          <template slot-scope="scope">
            <img style="height: 80px" :src="scope.row.BookImage">
          </template>
        </el-table-column>
        <el-table-column label="书籍编号" prop="BookId" sortable width="120" align="center"></el-table-column>
        <el-table-column label="书籍名称" prop="BookName" align="center"></el-table-column>
        <el-table-column label="ISBN号" prop="BookISBN" sortable width="120" align="center"></el-table-column>
        <el-table-column label="书籍售价" prop="BookPrice" sortable width="120" align="center"></el-table-column>
        <el-table-column label="学院分类" prop="BookDepartment" width="120" align="center"></el-table-column>
        <el-table-column label="年级分类" prop="BookGrade" width="120" align="center"></el-table-column>
        <el-table-column label="卖家" prop="StudentId" width="120" align="center"></el-table-column>
        <el-table-column label="审核状态" prop="BookStatus" width="100" align="center"></el-table-column>
        <el-table-column label="操作" width="160" align="center">
          <template slot-scope="scope">
            <el-button
                    size="mini"
                    @click="handleEditProduct(scope.$index, scope.row)">审核
            </el-button>
            <el-button
                    size="mini"
                    type="danger"
                    @click="handleDelete(scope.$index, scope.row)">删除
            </el-button>
          </template>
        </el-table-column>
      </el-table>
    </div>
  </el-card>
</div>
<!-- 待上架图书列表结束 -->

</body>
</html>

<script>
  var app=new Vue({
    el: '#app',
    data() {
      return {
        list:[
          <%
              ArrayList booklist=(ArrayList)session.getAttribute("booklist");
              if(booklist!=null||booklist.size()!=0){
          %>
          <%
              for(int i=booklist.size()-1;i>=0;i--){
                  BookBean ff=(BookBean)booklist.get(i);
          %>
          {
            BookImage:'<%=ff.getBookImage()%>',
            BookId:'<%=ff.getBookId()%>',
            BookISBN:'<%=ff.getBookISBN()%>',
            BookName:'<%=ff.getBookName()%>',
            BookISBN:'<%=ff.getBookISBN()%>',
            BookPrice:'<%=ff.getBookPrice()%>',
            BookDepartment:'<%=ff.getBookDepartment()%>',
            BookGrade:'<%=ff.getBookGrade()%>',
            StudentId:'<%=ff.getUsername()%>',
            BookStatus:'<%=ff.getBookStatus()%>',
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
        window.location.href="http://localhost:8080/CheckBookServlet?BookId="+row.BookId;
      },
      handleDelete(index, row){
        this.$confirm('是否要进行删除操作?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          window.location.href="http://localhost:8080/DeleteBookServlet?BookId="+row.BookId;
        });
      },

    }
  })
</script>

<style scoped>
</style>

