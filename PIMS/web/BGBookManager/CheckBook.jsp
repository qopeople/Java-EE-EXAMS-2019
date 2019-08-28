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
    <!-- 书籍表单开始 -->
    <div id="app">
        <el-card  class="box-card" style="width:45%;margin-top: 5px;margin-left: 50px;">
            <div slot="header" class="clearfix">  
                <span>书籍信息</span>
            </div>
            <div >
                <el-form :model="value"  ref="productInfoForm" label-width="120px" style="width: 600px" size="small">
                    <el-form-item label="学院分类：" prop="BookDepartment">
                        <el-input v-model="value.BookName" readonly></el-input>
                    </el-form-item>
                    <el-form-item label="年级分类：" prop="BookGrade">
                        <el-input v-model="value.BookName" readonly></el-input>
                        </el-form-item>
                    <el-form-item label="书籍名称：" prop="BookName">
                        <el-input v-model="value.BookName" readonly></el-input>
                    </el-form-item>
                    <el-form-item label="ISBN号：" prop="BookISBN">
                        <el-input v-model="value.BookISBN" readonly></el-input>
                    </el-form-item>
                    <el-form-item label="售价：" prop="BookPrice">
                        <el-input style="width:80px;" v-model.number="value.BookPrice" type="number" readonly></el-input>
                    </el-form-item>
                    <el-form-item label="书籍图片：">
                        <img v-if="imageUrl" :src="value.BookImage" class="avatar">
                    </el-form-item>
                    <el-form-item label="商品介绍：">
                        <el-input
                        :autoSize="true"
                        v-model="value.BookDescribe"
                        type="textarea"
                        prop="BookDescribe"
                        placeholder="1.使用时长：
2. 新旧程度描述：
3. 存在的问题：
                        " readonly></el-input>
                    </el-form-item>
                        <el-button type="primary" size="medium" @click="pass" style="position: relative;left:44%;">通过审核</el-button>
                        <el-button type="danger" size="medium" @click="ban" style="position: relative;left:44%;">驳回</el-button>
                    </el-form-item>
                </el-form>
            </div>
        </el-card>
    </div>  
    <!-- 书籍表单结束 -->
</body>
</html>

    <script>
        var app=new Vue({
            el: '#app',
            data() {
            return {
                hasEditCreated:false,
                value:{
                <%
                    ArrayList checkbook=(ArrayList)session.getAttribute("checkbook");
                    if(checkbook!=null){
                %>
                <%
                    BookBean ff=(BookBean)checkbook.get(0);
                %>
                    BookId:'<%=ff.getBookId()%>',
                    BookISBN:'<%=ff.getBookISBN()%>',
                    BookName:'<%=ff.getBookName()%>',
                    BookISBN:'<%=ff.getBookISBN()%>',
                    BookPrice:'<%=ff.getBookPrice()%>',
                    BookDescribe:'<%=ff.getBookDescribe()%>',
                    BookDepartment:'<%=ff.getBookDepartment()%>',
                    BookGrade:'<%=ff.getBookGrade()%>',
                    StudentId:'<%=ff.getUsername()%>',
                    BookStatus:'<%=ff.getBookStatus()%>',
                <%
                    }
                %>
                },
            }
            },
            methods: {
                pass(){
                    window.location.href="http://localhost:8080/PassBookServlet?BookId="+this.value.BookId+"&BookStatus="+"通过";
                },
                ban(){
                    window.location.href="http://localhost:8080/PassBookServlet?BookId="+this.value.BookId+"&BookStatus="+"不通过";
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
  </style>
