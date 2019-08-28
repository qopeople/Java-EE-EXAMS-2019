<%@ page import="java.util.ArrayList" %>
<%@ page import="BookServlet.BookBean" %><%--
  Created by IntelliJ IDEA.
  User: 齐佩
  Date: 2019/6/18
  Time: 18:21
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
<body style="margin: 0px">
<div  id="app">
    <!--表头导航栏-->
    <div class="tops">
        <ul>
            <li><a href="#news" class="money">充值金币</a></li>
            <li><a href="http://localhost:8080/login.jsp">退出系统</a></li>
            <li><a href="#news">帮助</a></li>

            <li><a href="http://localhost:8080/main/main.jsp">购物车</a></li>
            <li><a href="http://localhost:8080/main/main.jsp">卖家中心</a></li>
            <li><a href="http://localhost:8080/main/main.jsp">账号管理</a></li>
            <li><a href="http://localhost:8080/login.jsp">登录</a></li>
            <li ><a href="http://localhost:8080/register/register.jsp">注册</a></li>
            <li ><a href="http://localhost:8080/BookMessage/homepage.jsp">首页</a></li>

        </ul>
    </div>
    <!--表头导航栏结束-->

    <!--搜索框-->
    <div style="margin-top: 20px">
        <el-row>
            <el-col :span="8" >
                <img src="../image/logo.png" style="width: 80%; float: left; margin-right:130px ">
            </el-col>

        </el-row>
    </div>

    <!--筛选选择部分-->
    <div >
        <el-container>

            <el-main>
                <div class="selects">
                    <el-input
                            v-model="search"
                            size="mini"
                            type="search"
                            width="80%"
                            placeholder="输入关键字筛选"
                            icon="el-icon-search"></el-input>
                </div>
                <el-table
                        :data="tableData"
                        style="width: 100%">

    <el-table-column prop="BookImage" label=" 书籍图片"> 　
        　<template slot-scope="scope"> 　　
            　　<img :src="scope.row.BookImage" class="head_pic" width="60%"/> 　
            　</template>
    </el-table-column>
                    <el-table-column
                            width="200"
                            label="书籍编号"
                            prop="BookId">
                        <template slot-scope="scope">
                            <span  v-html="showDate(scope.row.BookId)">{{scope.row.BookId}}  </span>
                        </template>
                    </el-table-column>
    <el-table-column
            width="200"
            label="书籍名称"
            prop="BookName">
        <template slot-scope="scope">
            <span  v-html="showDate(scope.row.BookName)">{{scope.row.BookName}}  </span>
        </template>
    </el-table-column>
    <el-table-column
            label="价格"
            prop="BookPrice"
            sortable
            width="100"
    >
    </el-table-column>
    <el-table-column
            width="300"
            label="书籍描述"
            prop="BookDescribe">
        <template slot-scope="scope">
            <span  v-html="showDate(scope.row.BookDescribe)">{{scope.row.BookDescribe}}  </span>
        </template>
    </el-table-column>
                    <el-table-column
                            width="100"
                            label="书籍状态"
                            prop="BookStatus">
                    </el-table-column>

    <el-table-column
            prop="tag"
            label="标签筛选"
            width="100"
            :filters="[{ text: '大一', value: '大一' }, { text: '大二', value: '大二' },{ text: '大三', value: '大三' },{ text: '大四', value: '大四' }]"
            :filter-method="filterTag"
            filter-placement="bottom-end">
        <template slot-scope="scope">
            <el-tag
                    :type="scope.row.tag === '大一' ? 'primary' : 'success'"
                    disable-transitions>{{scope.row.tag}}</el-tag>
        </template>
    </el-table-column>
    <el-table-column label="操作">
        <template slot-scope="scope">
            <el-button
                    icon='el-icon-shopping-cart-1'
                    type="primary" plain
                    size='small'
                    width="100"
                    @click="handleEdit(scope.$index, scope.row)">加入购物车</el-button>

        </template>
    </el-table-column>
    </el-table>
    </el-main>
    </el-container>
</div>
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
                search:'',
                value: new Date(),
                tableData2: [
                        <%
             ArrayList  Booklists=(ArrayList)session.getAttribute("Booklists");
             if(Booklists==null||Booklists.size()==0){
                    response.sendRedirect("http://localhost:8080/main/bottom.jsp");
                }else{
               for(int i= Booklists.size()-1;i>=0;i--){
                  BookBean bb=(BookBean)Booklists.get(i);
             %>{
                        BookId: '<%=bb.getBookId()%>',
                        BookName:'<%=bb.getBookName()%>',
                        BookImage: '../image/img/'+'<%=bb.getBookImage()%>',
                        BookPrice: '<%=bb.getBookPrice()%>',
                        BookDescribe: '<%=bb.getBookDescribe()%>',
                        BookStatus:'<%=bb.getBookStatus()%>',
                        tag: '<%=bb.getBookGrade()%>',
                    },
                    <%
                    }
                        }
                    %>
                ],

            }
        },
        computed: {
            tableData: function() {
                const search = this.search
                console.log(search);
                if (search) {
                    return this.tableData2.filter(dataNews => {
                        return Object.keys(dataNews).some(key => {
                            return String(dataNews[key]).toLowerCase().indexOf(search) > -1
                        })
                    })
                }
                return this.tableData2
            },

        },
        methods:{
            showDate(val) {
                val = val + '';
                if (val.indexOf(this.search) !== -1 && this.search !== '') {
                    return val.replace(this.search, '<font color="#409EFF">' + this.search + '</font>')
                } else {
                    return val
                }
            },

            formatter(row, column) {
                return row.address;
            },
            filterTag(value, row) {
                return row.tag === value;
            },
            filterHandler(value, row, column) {
                const property = column['property'];
                return row[property] === value;
            },
            handleEdit(index, row) {
                console.log(index, row);
                console.log(row.BookId);
                window.location.href="http://localhost:8080/AddshopingServlet?BookId="+row.BookId;

            },

        }
    });
</script>
<style>
    .tops  ul {
        list-style-type: none;
        margin: 0;
        padding: 0;
        overflow: hidden;
        background-color: #8c222c;
    }

    .tops  li {

        float:right;

    }

    .tops   li a {
        display: block;
        color:beige;
        text-align: center;
        padding: 8px 10px;
        text-decoration: none;
        font-size: 14px;
        line-height: 35px;
    }

    /*鼠标移动到选项上修改背景颜色 */
    .tops  li a:hover {
        color: red;
        text-decoration:crimson;
        background-color: aliceblue;
    }
    .tops{
        height: 45px;
        background-color: #8c222c;
        margin: 0px;
    }
</style>