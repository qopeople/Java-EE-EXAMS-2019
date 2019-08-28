

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <meta charset="utf-8">
    <title>iview example</title>
    <!-- import CSS -->

    <link rel="stylesheet" href="../css/booklist.css">
</head>
<%


    String userName = (String) session.getAttribute("userName");
%>
<body style="background-color:#f7f7f6">
<div class="heads">
    <p>账户安全管理</p>
</div>
<div class="aside">
    <p><a href="http://localhost:8080/LookMessageServlet?userName=<%=userName%>" target="showframe">个人资料</a></p>
</div>
<div class="aside">
    <p><a href="http://localhost:8080/lookMessage/updateMessage.jsp?userName=<%=userName%>" target="showframe">修改/添加资料</a></p>
</div>


<div class="heads">
    <p>我是买家</p>
</div>
<div class="aside">
    <p><a href="http://localhost:8080/ShopingServlert?userName=<%=userName%>" target="showframe">购物车</a></p>
</div>
<div class="aside">
    <p><a href="http://localhost:8080/Oneorderlistsevlet?userName=<%=userName%>" target="showframe">购物详情</a></p>
</div>
<div class="heads">
    <p>我是卖家</p>
</div>

<div class="aside">
    <p><a href="http://localhost:8080/SaleBookServlert?userName=<%=userName%>" target="showframe">上架书籍</a></p>
</div>
<div class="aside">
    <p><a href="http://localhost:8080/SalerMessage/addsalesbook.jsp?userName=<%=userName%>" target="showframe">添加书籍</a></p>
</div>
<div class="heads">
    <p>通讯录</p>
</div>
<div class="aside">
    <p><a href="http://localhost:8080/FriendlistServlet?userName=<%=userName%>" target="showframe">查看通讯录</a></p>
</div>
<div class="aside">
    <p><a href="http://localhost:8080/friendMessage/friendadd.jsp" target="showframe">添加好友</a></p>
</div>

</body>
</html>