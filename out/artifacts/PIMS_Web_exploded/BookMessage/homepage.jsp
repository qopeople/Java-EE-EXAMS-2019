<%--
  Created by IntelliJ IDEA.
  User: 齐佩
  Date: 2019/6/17
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>首页</title>
    <link rel="stylesheet" href="../css/index.css">
</head>
<body>
<!--顶部通栏开始-->
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
<!--顶部通栏结束-->
<!--顶部搜索开始-->
<div class="header-search-box">
    <div class="header-search">
        <a href="" class="logo-text clearfix">
            <img  src="../image/logo.png" >
        </a>

    </div>
</div>
<!--顶部搜索结束-->
<!--分类导航开始-->
<div class="cagetory-box">
    <div class="list-group">
        <div class="list-group-item item-header"  init-detail='wait' >
            <a href="javascript:;" class="title pull-left">图书</a>
        </div>
        <div class="list-group-item item-remarkable"  init-detail='wait' >
            <div class="item-text">
                <div class="text">
                     <a href="http://localhost:8080/BooklServlet?BookDepartment=机械工程学院" class="item-title">机械工程学院</a>
                </div>
            </div>
        </div>
        <div class="list-group-item"  init-detail='wait' >
            <div class="item-text">
                <div class="text">
                     <a href="http://localhost:8080/BooklServlet?BookDepartment=电子工程与智能化学院" class="item-title" >电子工程与智能化学院</a>
                </div>
            </div>
        </div>
        <div class="list-group-item"  init-detail='wait' >
            <div class="item-text">
                <div class="text">
                     <a href="http://localhost:8080/BooklServlet?BookDepartment=计算机科学与技术学院" class="item-title">计算机科学与技术学院</a>
                </div>
            </div>
        </div>
        <div class="list-group-item"  init-detail='wait' >
            <div class="item-text">
                <div class="text">
                     <a href="http://localhost:8080/BooklServlet?BookDepartment=生态环境与建筑工程学院" class="item-title" >生态环境与建筑工程学院</a>
                </div>
            </div>
        </div>
        <div class="list-group-item" init-detail='wait' >
            <div class="item-text">
                <div class="text">
                     <a href="http://localhost:8080/BooklServlet?BookDepartment=经济与管理学院" class="item-title">经济与管理学院</a>
                </div>
            </div>
        </div>
        <div class="list-group-item" init-detail='wait' >
            <div class="item-text">
                <div class="text">
                     <a href="http://localhost:8080/BooklServlet?BookDepartment=社会发展研究院" class="item-title" >社会发展研究院</a>
                </div>
            </div>
        </div>
        <div class="list-group-item" init-detail='wait' >
            <div class="item-text">
                <div class="text">
                     <a href="http://localhost:8080/BooklServlet?BookDepartment='文学与传媒学院'" class="item-title" >文学与传媒学院</a>
                </div>
            </div>
        </div>
        <div class="list-group-item" init-detail='wait' >
            <div class="item-text">
                <div class="text">
                     <a href="http://localhost:8080/BooklServlet?BookDepartment=法律与社会工作学院" class="item-title" >法律与社会工作学院</a>
                </div>
            </div>
        </div>
        <div class="list-group-item" init-detail='wait' >
            <div class="item-text">
                <div class="text">
                     <a href="http://localhost:8080/BooklServlet?BookDepartment=" class="item-title" onclick='selectlist("教育学院")'>教育学院</a>
                </div>
            </div>
        </div>
        <div class="list-group-item" init-detail='wait' >
            <div class="item-text">
                <div class="text">
                     <a href="http://localhost:8080/BooklServlet?BookDepartment=化学工程与能源技术学院" class="item-title" >化学工程与能源技术学院</a>

                </div>
            </div>
        </div>
        <div class="list-group-item" init-detail='wait' >
            <div class="item-text">
                <div class="text">
                     <a href="http://localhost:8080/BooklServlet?BookDepartment=机器人学院" class="item-title"  >机器人学院</a>

                </div>
            </div>
        </div>
        <div class="list-group-item" init-detail='wait' >
            <div class="item-text">
                <div class="text">
                    <a href="http://localhost:8080/BooklServlet?BookDepartment=中法联合学院" class="item-title merge"  >中法联合学院</a>
                </div>
            </div>
        </div>
        <div class="list-group-item" init-detail='wait' >
            <div class="item-text">
                <div class="text">
                    <a href="http://localhost:8080/BooklServlet?BookDepartment=智能制造学院" class="item-title merge"  >智能制造学院</a>
                </div>
            </div>
        </div>
        <div class="list-group-item" init-detail='wait' >
            <div class="item-text">
                <div class="text">
                    <a href="http://localhost:8080/BooklServlet?BookDepartment=网络空间安全学院" class="item-title merge"  >网络空间安全学院</a>
                </div>
            </div>
        </div>
        <div class="list-group-item" init-detail='wait' >
            <div class="item-text">
                <div class="text">
                    <a  href="http://localhost:8080/BooklServlet?BookDepartment=材料科学与工程学院" class="item-title merge"  >材料科学与工程学院</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!--分类导航结束-->
<!--banner开始-->
<div id="banner-box">
    <img src="../image/image1.jpg" alt="">
</div>
<!--banner结束-->
<!--好书推荐开始-->
<div class="gallery-book-list">
    <p class="gallery-book-title"><span>好书推荐</span>
    <ul class="layer-content gallery-book-product clearfix">
        <li class="layer-slide gallery-book-slide">
            <div style="display: block;position: relative;height:100%">
                    <span class="gallery-book-list-img">
                        <img src="../image/算法导论（原书第3版）.jpg"  alt="算法导论（原书第3版）">
                    </span>
                <a href="" 
                   class="gallery-book-product-text" title="算法导论（原书第3版）">算法导论（原书第3版）</a>
                <div class="gallery-book-author" title="[美] Thomas H.Cormen等著；殷建平等 译">[美] Thomas H.Cormen等著；殷建平等 译</div>
                <div class="gallery-book-product-price">
                    <div><i><span style="font-size:14px;color: #bf7f5f;">￥</span>128.00 </i><span>起</span></div>
                </div>
            </div>
        </li>
        <li class="layer-slide gallery-book-slide">
            <div style="display: block;position: relative;height:100%">
                    <span class="gallery-book-list-img">
                        <img src="../image/计算机网络（第6版）.jpg"  alt="计算机网络（第6版）">
                    </span>
                <a href="" 
                   class="gallery-book-product-text" title="计算机网络（第6版）">计算机网络（第6版）</a>
                <div class="gallery-book-author" title=" [美] James F.Kurose等  著；陈鸣   译"> [美] James F.Kurose等 著；陈鸣  译</div>
                <div class="gallery-book-product-price">
                    <div><i><span style="font-size:14px;color: #bf7f5f;">￥</span>79.00 </i><span>起</span></div>
                </div>
            </div>
        </li>
        <li class="layer-slide gallery-book-slide">
            <div style="display: block;position: relative;height:100%">
                    <span class="gallery-book-list-img">
                        <img src="../image/数据挖掘导论.jpg"  alt="数据挖掘导论">
                    </span>
                <a href="" 
                   class="gallery-book-product-text" title="数据挖掘导论">数据挖掘导论</a>
                <div class="gallery-book-author" title=" Pang-Ning Tan等  著；孔亚雷  译"> Pang-Ning Tan等 著；范明等  译</div>
                <div class="gallery-book-product-price">
                    <div><i><span style="font-size:14px;color: #bf7f5f;">￥</span>69.00 </i><span>起</span></div>
                </div>
            </div>
        </li>
        <li class="layer-slide gallery-book-slide">
            <div style="display: block;position: relative;height:100%">
                    <span class="gallery-book-list-img">
                        <img src="../image/深入理解计算机系统（原书第3版）.jpg"  alt="深入理解计算机系统（原书第3版）">
                    </span>
                <a href="" 
                   class="gallery-book-product-text" title="深入理解计算机系统（原书第3版）">深入理解计算机系统（原书第3版）</a>
                <div class="gallery-book-author" title=" Randal E.Bryant等  著； 龚奕利 译"> Randal E.Bryant等
                    著； 龚奕利 译</div>
                <div class="gallery-book-product-price">
                    <div><i><span style="font-size:14px;color: #bf7f5f;">￥</span>139.00 </i><span>起</span></div>
                </div>
            </div>
        </li>
        <li class="layer-slide gallery-book-slide">
            <div style="display: block;position: relative;height:100%">
                    <span class="gallery-book-list-img">
                        <img src="../image/编译原理.jpg"  alt="编译原理">
                    </span>
                <a href=""  class="gallery-book-product-text"
                   title="编译原理">编译原理</a>
                <div class="gallery-book-author" title="Alfred V. Aho等  著； 赵建华等  译">Alfred V. Aho等 著； 赵建华等 译</div>
                <div class="gallery-book-product-price">
                    <div><i><span style="font-size:14px;color: #bf7f5f;">￥</span>89.00 </i><span>起</span></div>
                </div>
            </div>
        </li>
        <li class="layer-slide gallery-book-slide">
            <div style="display: block;position: relative;height:100%">
                    <span class="gallery-book-list-img">
                        <img src="../image/高等数学（上册）.jpg"  alt="高等数学（上册）">
                    </span>
                <a href=""  class="gallery-book-product-text"
                   title="高等数学（上册）">高等数学（上册）</a>
                <div class="gallery-book-author" title="同济大学数学系  著">同济大学数学系 著</div>
                <div class="gallery-book-product-price">
                    <div><i><span style="font-size:14px;color: #bf7f5f;">￥</span>27.6 </i><span>起</span></div>
                </div>
            </div>
        </li>
    </ul>
</div>
<!---好书推荐结束-->
</body>
</html>
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