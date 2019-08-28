<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>子窗口左边部分</title>
    <script src="https://unpkg.com/vue/dist/vue.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>
</head>

<body style="margin:0px;background:#304156">
<div id="app">
    <el-row class="tac">
        <el-col :span="12" style="width: 100%;">
            <el-menu  class="el-menu-vertical-demo"
                      @open="handleOpen"
                      @close="handleClose"
                      background-color="#304156"
                      text-color="#bfcbd9"
                      active-text-color="#409EFF"
            >
                <a href="http://localhost:8080/LookUserServlet" target="main">
                    <el-menu-item index="1">
                        <i class="el-icon-location"></i>
                        <span>用户管理</span>
                    </el-menu-item>
                </a>
                <a href="http://localhost:8080/LookBookServlet" target="main">
                    <el-menu-item index="2">
                        <i class="el-icon-menu"></i>
                        <span>商品管理</span>
                    </el-menu-item>
                </a>
                <a href="http://localhost:8080/LookOrderServlet" target="main">
                    <el-menu-item index="3">
                        <i class="el-icon-menu"></i>
                        <span>订单管理</span>
                    </el-menu-item>
                </a>
                <a href="http://localhost:8080/LookReturnServlet" target="main">
                    <el-menu-item index="4">
                        <i class="el-icon-menu"></i>
                        <span>退貨管理</span>
                    </el-menu-item>
                </a>
            </el-menu>
        </el-col>
        </el-col>
    </el-row>
</div>
</body>

<script>
    var app=new Vue({
        el: '#app',
        data() {
            return {
            }
        },
        methods: {
            handleOpen(key, keyPath) {
                console.log(key, keyPath);
            },
            handleClose(key, keyPath) {
                console.log(key, keyPath);
            }
        }
    })
</script>
<style>
    a:visited{color:#bfcbd9;!important;text-decoration: none;}
    a{color:#bfcbd9;!important;text-decoration: none;}
</style>
</html>