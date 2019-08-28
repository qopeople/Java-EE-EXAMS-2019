<%-- 
    Document   : index
    Created on : 2012-3-20, 1:17:27
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>首页</title>
    <link rel="stylesheet" href="./css/index.css">
    <script src="https://unpkg.com/vue/dist/vue.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>
</head>
<body >
<!--顶部通栏开始-->
<div id="navHeader" class="nav-header-box">
    <div class="header-wrap">
        <div class="slogan-box">
            <span class="info-text">图书漂流</span>
            <span>知识传递</span>
        </div>
        <div class="user-info-box clearfix">
            <div class="item-info login-win">
                <!--                   <span class="line-left">|</span>-->
                <!--                   <span class="line-right">|</span>-->
                <span id="nickName" class="info-normal">
                            <span class="info-text">登录</span>
                            <span class="info-text">/</span>
                            <span class="info-text">注册</span>
                        </span>
                <div id="loginWin" class="info-win"></div>
            </div>
            <div class="item-info">
                <a id="cartLink" href="" class="info-link" target="_blank" rel="nofollow">
                    <span class="info-text">购物车 <span id="cartNum" class="num"></span></span>
                </a>
                <div id="cartListWin" class="info-win">
                    <div class="load-box"></div>
                </div>
            </div>
            <div class="item-info">
                <a href="" class="info-link" target="_blank" rel="nofollow">
                <span class="info-text">我的订单</span>
                </a>
            </div>
            <div class="item-info">
                <a href="" class="info-link" target="_blank" rel="nofollow">
                    <span class="info-text">个人中心</span>
                </a>
                <div class="info-win">
                    <div class="personal-center">
                        <div class="info-domain">
                            <div class="title">
                                <span class="iconfont icon-dianpu"></span>
                                <span class="text">店铺</span>
                            </div>
                            <a href="" class="item" target="_blank" rel="nofollow">我的订单</a>
                            <a href="" class="item" target="_blank" rel="nofollow">收藏</a>
                            <!--                                <a href="#" class="item" target="_blank">足迹</a>-->
                        </div>
                        <div class="info-domain">
                            <div class="title">
                                <span class="iconfont icon-paimai"></span>
                                <span class="text">拍卖</span>
                            </div>
                            <a href="" class="item" target="_blank" rel="nofollow">拍卖交易</a>
                            <a href="" class="item" target="_blank" rel="nofollow">我的竞拍</a>
                            <a href="" class="item" target="_blank" rel="nofollow">收藏</a>
                            <!--                                <a href="#" class="item" target="_blank">足迹</a>-->
                        </div>
                        <div class="info-domain">
                            <div class="title"></div>
                            <a href="" class="item" target="_blank" rel="nofollow">我的好友</a>
                            <a href="" class="item" target="_blank" rel="nofollow">资金账户</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="item-info">
                <a href="" class="info-link" target="_blank" target="_blank">
                    <span class="info-text">卖家中心</span>
                </a>
                <div id="sellerWin" class="info-win"></div>
            </div>
        </div>
    </div>
</div>
<!--顶部通栏结束-->
<!--顶部搜索结束-->
<div style="background:url(./image/image2.jpg);height: 100%;">
    <div id="app" class="log-but">
        <el-card class="box-card">
            <div slot="header" class="clearfix">
                <p style="text-align: center; color: brown;font-size:15px; ">校园二手书网</p>
            </div>
            <form action="http://localhost:8080/LoginServlet" method="post">
                <div class="inputs" >
                    <input placeholder=" 请输入用户名"  name="username" type="text" require="required">
                    </input>
                </div>
                <div  class="inputs"  >
                    <input placeholder=" 请输入密码" name="password" require="required" type="password" ></input>
                </div>
                <el-row>
                    <el-col :span="12" :push="2">  <el-checkbox v-model="checked">记住密码</el-checkbox></el-col>
                    <el-col :span="12" :push="5">  <el-link type="info" :underline="false" href="https://element.eleme.io" >忘记密码</el-link></el-col>
                </el-row>
                <button style="margin-left:30px;margin-top: 10px; width:280px;height: 40px;background-color: brown;color: aliceblue "   name="status">登录</button>
                <div class="others">
                    <div class="others2">
                        <el-row>
                            <el-col :span="20" >其他登陆方式：
                                <img src="./image/qq.svg" width="5%">
                                <img src="./image/微信.svg" width="5%">
                                <img src="./image/支付宝.svg" width="5%">
                                <a href="https://cas.dgut.edu.cn?appid=javaee&state=STATE"> <img src="./image/dgut.jpg" alt="" width="6%" > </a>
                            </el-col>
                        </el-row>
                    </div>
                    <el-row>
                        <el-col :span=12 :pull=2></el-col> 没有账号？马上<a  href="http://localhost:8080/register/register.jsp">注册</a></el-col>
                    </el-row>
                </div>
            </form>
        </el-card>
    </div>
</div>
</body>
</html>

<style>
    .log-but{
        width: 400px;
        background-color: aliceblue;
        margin: 0 auto;

    }
    .inputs{
        width: 100%;
        margin-bottom: 30px ;
        margin-top: 20px;
        margin-left: 50px
    }
    .inputs>input{
        width: 280px;
        height: 30px;
    }

    .others{
        margin: 20px;
        margin-left: 40px;
    }


</style>


<script>
    new Vue({
        el: '#app',
        data: function() {
            return {
                activeName: 'first',

                checked: false
            }
        },

    });

</script>

