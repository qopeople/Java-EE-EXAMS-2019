<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>top页面</title>
    <script src="https://unpkg.com/vue/dist/vue.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>
    <style>
    </style>
</head>

<body style="margin:0px;">
<div id="app">
    <el-menu  class="el-menu-demo" mode="horizontal" >
        <el-menu-item index="1">后台管理系统</el-menu-item>
        <el-menu-item index="2"> <a href="http://localhost:8080/login.jsp" target="_parent"><el-button  >退出系統</el-button></a></el-menu-item>
    </el-menu>

    <div class="line"></div>
</div>
</body>
<script>
    var app = new Vue({
        el: '#app',
        data() {
            return {

            }
        },
        methods: {
        }
    })
</script>

</html>