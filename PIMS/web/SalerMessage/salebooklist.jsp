<%@ page import="java.util.ArrayList" %>
<%@ page import="BookServlet.BookBean" %><%--
  Created by IntelliJ IDEA.
  User: 齐佩
  Date: 2019/6/18
  Time: 21:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArrayList salelist=(ArrayList)session.getAttribute("salelist");
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>书籍信息</title>
    <link rel="stylesheet" href="./css/index.css">
    <script src="https://unpkg.com/vue/dist/vue.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>
</head>
<body onload="reloadThisPage()">

<!-- 出售列表开始 -->
<div id="app" >

    <el-card  class="box-card" style="width:100%;margin-top: 5px;">
        <div slot="header" class="clearfix">
            <span>上架书籍列表</span>
        </div>
        <div>
            <el-table ref="Table"
                      :data="list"
                      style="width: 100%"
                      @selection-change=""
                      border>
                <el-table-column type="selection" width="60" align="center"></el-table-column>
                <el-table-column label="序号" type="index" width="50"> </el-table-column>
                <el-table-column label="书籍图片" width="120" align="center">
                    <template slot-scope="scope">
                        <img style="height: 80px" :src="scope.row.BookImage">
                    </template>
                </el-table-column>
                <el-table-column label="书籍名称" align="center" prop="BookName"></el-table-column>
                <el-table-column label="ISBN号" width="120" align="center" prop="BookISBN">
                </el-table-column>
                <el-table-column label="售价" sortable width="140" align="center" prop="BookPrice">
                </el-table-column>
                <el-table-column label="学院分类" width="100" align="center" prop="BookDepartment">
                </el-table-column>
                <el-table-column label="年级分类" width="100" align="center" prop="BookGrade">
                </el-table-column>
                <el-table-column label="商品介绍" width="100" align="center" prop="BookDescribe">
                </el-table-column>
                <el-table-column label="审核状态" width="100" align="center" prop="BookStatus">
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
        </div>
    </el-card>
</div>
<!-- 出售列表结束 -->
</body>
</html>

<script>
    var app=new Vue({
        el: '#app',
        data() {
            return {
                rules: {
                    BookName: [
                        {required: true, message: '请输入书籍名称', trigger: 'blur'},
                        {min: 2, max: 140, message: '长度在 2 到 140 个字符', trigger: 'blur'}
                    ],
                    BookGrade:[{required: true, message: '请输入年级分类', trigger: 'blur'}],
                    BookISBN: [{required: true, message: '请输入书籍ISBN号', trigger: 'blur'}],
                    BookDepartment: [{required: true, message: '请选择学院分类', trigger: 'blur'}],
                    BookDescribe: [{required: true, message: '请输入书籍情况描述', trigger: 'blur'}],
                    BookPrice: [{required: true, message: '请输入售价', trigger: 'blur'}],
                    BookOrigPrice: [{required: true, message: '请输入市场价', trigger: 'blur'}],
                },
                BookDepartments:[
                    {value:'机械工程学院',label:'机械工程学院'},
                    {value:'电子工程与智能化学院',label:'电子工程与智能化学院'},
                    {value:'计算机科学与技术学院',label:'计算机科学与技术学院'},
                    {value:'生态环境与建筑工程学院',label:'生态环境与建筑工程学院'},
                    {value:'经济与管理学院',label:'经济与管理学院'},
                    {value:'社会发展研究院',label:'社会发展研究院'},
                    {value:'文学与传媒学院',label:'文学与传媒学院'},
                    {value:'法律与社会工作学院',label:'法律与社会工作学院'},
                    {value:'教育学院',label:'教育学院'},
                    {value:'化学工程与能源技术学院',label:'化学工程与能源技术学院'},
                    {value:'机器人学院',label:'机器人学院'},
                    {value:'中法联合学院',label:'中法联合学院'},
                    {value:'智能制造学院',label:'智能制造学院'},
                    {value:'网络空间安全学院',label:'网络空间安全学院'},
                    {value:'材料科学与工程学院',label:'材料科学与工程学院'},
                ],
                BookGrades:[
                    {value:'大一',label:'大一'},
                    {value:'大二',label:'大二'},
                    {value:'大三',label:'大三'},
                    {value:'大四',label:'大四'},
                ],
                defaultListQuery :{},
                listQuery:{},
                BookStatuses:[
                    {value:'已上架',label:'已上架'},
                    {value:'已售出',label:'已售出'},
                    {value:'审核未通过',label:'审核未通过'},
                ],
                list:[
                <%
     ArrayList  Salelists=(ArrayList)session.getAttribute("Salelists");
     if(Salelists==null||Salelists.size()==0){
            response.sendRedirect("http://localhost:8080/main/bottom.jsp");
        }else{
       for(int i= Salelists.size()-1;i>=0;i--){
          BookBean bb=(BookBean)Salelists.get(i);
     %>{
                BookId: '<%=bb.getBookId()%>',
                        BookName:'<%=bb.getBookName()%>',
                BookImage: '../image/img/'+'<%=bb.getBookImage()%>',
                BookPrice: '<%=bb.getBookPrice()%>',
                BookDescribe: '<%=bb.getBookDescribe()%>',
                BookStatus:'<%=bb.getBookStatus()%>',
                BookGrade:'<%=bb.getBookGrade()%>',
                        BookDepartment:'<%=bb.getBookDepartment()%>',
                        BookISBN:'<%=bb.getBookISBN()%>',


            },
            <%
            }
                }
            %>
        ]
            }
        },
        methods: {

            deleteRow(index, rows) {//删除改行
                this. list.splice(index, 1);
                alert(rows.BookId);
                window.location.href="http://localhost:8080/SaledeleteServlert?BookId="+rows.BookId;

            },
        }
    })
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

<style scoped>
</style>

