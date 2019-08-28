<%-- 
    Document   : register
    Created on : 2012-3-20, 21:19:20
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <title>注册界面</title>
    <link rel="stylesheet" href="../css/index.css">
</head>
<body style="background-image: url(../image/image2.jpg); background-position: center;background-repeat:repeat;background-size:100%; ">

<form action="http://localhost:8080/RegisterServlet" method="post"  >
    <div id="app" class="register-btn">
        <div slot="header"  >
            <p style="color:brown">注册界面</p>
        </div>

        <div class="inputs" >
            <input placeholder="输入学校中央登录账号" name="StudentId" class="ii" type="text" required="required"> </input>
            <hr>
        </div>

        <div class="inputs" >
            <input placeholder="输入用户名" name="Username" class="ii" type="text" required="required"> </input>
            <hr>
        </div>

        <div  class="inputs"  >
            <input placeholder="输入密码"  name="Password" class="ii"  id="pws" type="password" required="required"> </input>
            <hr>
        </div>
        <div  class="inputs"  >
            <input placeholder="确认密码"  name="repassword" class="ii" id="repws" type="password" required="required"> </input>
            <hr>
        </div>


        <div class="btn">
            <input type="submit" value="注册"  class="submitbtn"  name="status" >
            <p class="tips">部分邮箱可能会拦截激活邮箱，如果长时间接不到激活邮件，请到垃圾箱查看</p>
        </div>
        <span  class="inform">已有账号,</span><a type="primary" href="http://localhost:8080/login.jsp" >马上登录</a>
    </div>
</form>
</body>
</html>
<style>
    .register-btn{
        width: 34%;
        height: 90%;
        position: relative;
        left: 33%;
        top: 10%;
        background-color: aliceblue;
        margin-top: 80px;
    }
    .inputs{
        width: 80%;
        margin-bottom: 30px ;
        margin-top: 20px;
        margin-left: 50px
    }
    p{
        text-align: center;
        font-size: 20px;
        color:cadetblue    ;
        margin: 10px;
        padding: 20px;

    }
    .ii{
        height: 30px;
        width: 180px;
        border: none;
        background-color:  aliceblue;
        zoom:1;
        outline: medium;}
    hr{
        width: 340px;
        height: 5px;
    }
    .btn{
        margin-left: 40px;
        margin-top: 20px;
    }
    .tips{
        color: brown;
        font-size: 13px;
        margin: 5px;
    }
    .inform{
        margin-left: 180px;
        font-size: 13px;
    }
    .submitbtn{
        width: 200px;
        height: 35px;
        margin-left: 90px;
        background-color:aliceblue;
    }
</style>
<script src="css/vue.js"></script>
<!-- import JavaScript -->
<script src="css/elementui.js"></script>
<script>
    new Vue({
        el: '#app',
        data: function() {
            return {
            }
        }

    });
    function  checkform(){

        var pws =  document.getElementById("pws").value ;
        var  repws =   document.getElementById("repws").value ;

        if(pws!=repws)
        {
            alert("密码与确认密码不同！");
            return false;
        }
        alert("注册成功");

        return true;
    }

</script>