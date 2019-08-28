<%@ page import="java.util.ArrayList" %>
<%@ page import="BookServlet.BookBean" %><%--
  Created by IntelliJ IDEA.
  User: 齐佩
  Date: 2019/6/18
  Time: 21:32

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
<body  onload="reloadThisPage()">
<div  id="app">
    <el-main>
        <el-breadcrumb separator="/">
            <el-breadcrumb-item><a href="http://localhost:8080/BookMessage/homepage.jsp" target="_parent">首页</a></el-breadcrumb-item>
            <el-breadcrumb-item><a href="http://localhost:8080/main/main.jsp">账号管理</a></el-breadcrumb-item>
            <el-breadcrumb-item><a href="/">我是买家</a></el-breadcrumb-item>
            <el-breadcrumb-item>购物车</el-breadcrumb-item>
        </el-breadcrumb>
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
                style="width: 100%"
                @selection-change="handleSelectionChange">
            <el-table-column
                    type="selection"
                    width="55">
            </el-table-column>
            <el-table-column prop="BookImage" label=" 书籍图片"> 　
                　<template slot-scope="scope"> 　　
                    　　<img :src="scope.row.BookImage" class="head_pic" width="60%"/> 　
                    　</template>
            </el-table-column>
            <el-table-column
                    label="书籍编号"
                    prop="BookId">
                <template slot-scope="scope">
                    <span  v-html="showDate(scope.row.BookId)">{{scope.row.BookId}}  </span>
                </template>
            </el-table-column>
            <el-table-column
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
                    width="400"
                    label="书籍描述"
                    prop="BookDescribe">
            </el-table-column>

            <el-table-column label="操作">
                <template slot-scope="scope">
                    <el-button
                            icon='
                            el-icon-delete'
                            size='small'
                            width="100"
                            @click="deleteRow(scope.$index, scope.row)">删除</el-button>

                </template>
            </el-table-column>
        </el-table>
        <div class="foots">
            <el-row>
                <el-col :span="8"> <span>已选宝贝:</span><input class="computer"  type='text' name='number' style="width: 200px"  v-model="num" />件</el-col>
                <el-col :span="8"><span>合计（不含运费/元）：</span> <input class="computer" style="width: 210px"   type='text'v-model="allcost" type="text"></input></el-col>
                <el-col :span="8">  <el-button type='button' style='  height: 55px; width: 110px; background-color:  darkred;color: white '  @click='account()'>结算</el-button></el-col>
            </el-row>



        </div>
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
                num:0,
                allcost:"",
                value: new Date(),
                vartables:{},
                tableData2: [
                        <%
             ArrayList  shoplists=(ArrayList)session.getAttribute("shoplists");
               if(shoplists==null||shoplists.size()==0){
                    response.sendRedirect("http://localhost:8080/main/bottom.jsp");
                }else{
               for(int i= shoplists.size()-1;i>=0;i--){
                  BookBean bb=(BookBean)shoplists.get(i);
             %>{
                     BookId:'<%=bb.getBookId()%>',
                    BookName:   '<%=bb.getBookName()%>',
                    BookImage: '../image/img/'+'<%=bb.getBookImage()%>',
                    BookPrice: '<%=bb.getBookPrice()%>',
                    BookDescribe: '<%=bb.getBookDescribe()%>',
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
            handleSelectionChange(val) {
                // this.multipleSelection = val;
                let i=0;
                let that =this;
                that.vartables= val;
                let sum=0;
                for(i=0;i<val.length;i++)
                {
                    sum+=val[i].BookPrice;
                }
                that.allcost=sum;
                that.num= val.length;
                console.log(val)
            },
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
            },
            account()
            {
                let that =this;
               let i=0;
               console.log(that.vartables)
               for(i=0;that.vartables;i++)
               {
                  alert("結算成功！")
                   window.location.href="http://localhost:8080/AccountServlet?BookId="+that.vartables[i].BookId+"&Ordermoney="+this.vartables[i].BookPrice;

               }
            },

            deleteRow(index, rows) {//删除改行
                this.tableData2.splice(index, 1);

                window.location.href="http://localhost:8080/ShopdeleteServlet?BookId="+rows.BookId;

            },
        }
    });
    function reloadOnce(){
        var flag= '<%=request.getParameter("flag")%>';
        if(flag==null || flag=="" || flag=="null"){
            var strURL = window.location;
            strURL +="?flag=1";
            document.location.href = strURL;
        }else{
            return false;
        }
    }
    function reloadThisPage(){
        setTimeout("reloadOnce()",1);//0.001秒后刷新
    }

</script>
