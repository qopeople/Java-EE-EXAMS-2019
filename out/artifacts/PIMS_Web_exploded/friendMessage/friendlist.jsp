<%--
    Document   : lookFriend
    Created on : 2012-3-21, 0:49:41
    Author     : Administrator
--%>


<%@page import="java.util.ArrayList"%>
<%@ page import="FriendServlet.FriendBean" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
    <el-card  class="box-card" style="width:100%;margin-top: 5px;">
        <div slot="header" class="clearfix">
            <el-row>
                <el-col :span=13 >
                    <span>通讯录列表</span>
                </el-col>
                <el-col :span=6 >
                    <el-input
                            v-model="search"
                            size="mini"
                            type="search"
                            placeholder="输入关键字搜索"></el-input>
                </el-col>
                <el-col :span=5 :push=1  >


                </el-col>
            </el-row>

        </div>
        <el-table
                :data="tableData"
                style="width: 100%"
                :row-class-name="tableRowClassName">
            <el-table-column
                    prop="Username"
                    label="姓名"
                    width="180">
                <template slot-scope="scope">
                    <span  v-html="showDate(scope.row.Username)">{{scope.row.Username}}  </span>
                </template>
            </el-table-column>
            <el-table-column
                    prop="Schoolzone"
                    label="校区">

                <template slot-scope="scope">
                    <span  v-html="showDate(scope.row.Schoolzone)">{{scope.row.Schoolzone}}  </span>
                </template>
            </el-table-column>
            <el-table-column
                    prop="Department"
                    label="学院">

                <template slot-scope="scope">
                    <span  v-html="showDate(scope.row.Department)">{{scope.row.Department}}  </span>
                </template>
            </el-table-column>
            <el-table-column
                    prop="Gradeyear"
                    label="年级">
                <template slot-scope="scope">
                    <span  v-html="showDate(scope.row.Gradeyear)">{{scope.row.Gradeyear}}  </span>
                </template>

            </el-table-column>
            <el-table-column
                    prop="Telphone"
                    label="电话号码">
                <template slot-scope="scope">
                    <span  v-html="showDate(scope.row.Telphone)">{{scope.row.Telphone}}  </span>
                </template>

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
    </el-card>

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
                search:'',
                tableData2: [
                        <%
             ArrayList friendslist=(ArrayList)session.getAttribute("friendlist");

               for(int i=friendslist.size()-1;i>=0;i--){
                  FriendBean ff=(FriendBean)friendslist.get(i);
             %>{
                        Username:'<%=ff.getUsername()%>',
                        Schoolzone:'<%=ff.getSchoolzone()%>',
                        Department:'<%=ff.getDepartment()%>',
                        Gradeyear:'<%=ff.getGradeyear()%>',
                        Telphone:'<%=ff.getTelphone()%>',
                    },
                    <%

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

        methods: {
            deleteRow(index, rows) {//删除改行
                this.tableData2.splice(index, 1);
                alert(rows.Username);
                window.location.href="http://localhost:8080/FrienddeleteServlet?fUsername="+rows.Username;

            },
            showDate(val) {
                val = val + '';
                if (val.indexOf(this.search) !== -1 && this.search !== '') {
                    return val.replace(this.search, '<font color="#409EFF">' + this.search + '</font>')
                } else {
                    return val
                }
            },

            tableRowClassName({row, rowIndex}) {
                if (rowIndex%2=== 1) {
                    return 'warning-row';
                } else if (rowIndex%2===0) {
                    return 'success-row';
                }
                return '';
            }
        },
    })
</script>
<style>
    .el-table .warning-row {
        background: oldlace;
    }

    .el-table .success-row {
        background: #f0f9eb;
    }
</style>




