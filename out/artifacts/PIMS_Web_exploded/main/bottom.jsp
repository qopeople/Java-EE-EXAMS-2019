<%--
  Created by IntelliJ IDEA.
  User: 齐佩
  Date: 2019/4/30
  Time: 21:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>404 NOT FOUND</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="css/index.css">
</head>
<body>
<div id="app">
    <div class="tup">
        <img src="../image/404.png" >
    </div>
    <div class="wenzi">
      <p>oh 没有任何记录</p>
    </div>
    <div class="acv">
        <h3>Something went wrong,Please try again later! </h3>
        &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp  &nbsp &nbsp &nbsp &nbsp &nbsp<a href="http://localhost:8080/BookMessage/homepage.jsp"><el-button type="primary" round  >&nbsp &nbsp &nbsp &nbspReady&nbsp &nbsp &nbsp &nbsp</el-button></a>
    </div>
</div>
</body>
</html>
<style>
    img{
        float: left;
        margin: 9px
    }
    .wenzi{

        margin-top: 120px;
    }
    .acv{
        float: left;
        position: relative;
        top: 80px;

    }

</style>
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
                aa:""
            }
        },

    });
</script>