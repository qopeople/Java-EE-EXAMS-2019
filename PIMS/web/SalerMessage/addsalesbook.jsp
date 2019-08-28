<%--
  Created by IntelliJ IDEA.
  User: 齐佩
  Date: 2019/6/18
  Time: 21:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>书籍信息</title>
    <link rel="stylesheet" href="../css/index.css">
    <script src="https://unpkg.com/vue/dist/vue.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>
</head>
<body>

<!-- 书籍表单开始 -->
<div id="app">
    <el-card  class="box-card" style="width:45%;margin-top: 5px;margin-left: 50px;">
        <div slot="header" class="clearfix">
            <span>书籍信息</span>
        </div>
        <form action="http://localhost:8080/Addsalebook" method="post"  enctype="multipart/form-data">
              <div class="form-item">
                  学院分类: <select name="BookDepartment">
            <option value ="网络空间安全学院">网络空间安全学院</option>
            <option value ="机械工程学院">机械工程学院</option>
            <option value ="电子工程与智能化学院">电子工程与智能化学院</option>
            <option value="计算机科学与技术学院">计算机科学与技术学院</option>
            <option value="生态环境与建筑工程学院i">生态环境与建筑工程学院</option>
            <option value ="经济与管理学院">经济与管理学院</option>
            <option value ="社会发展研究院">社会发展研究院</option>
            <option value="文学与传媒学院">文学与传媒学院</option>
            <option value="法律与社会工作学院">法律与社会工作学院</option>

            <option value ="教育学院">教育学院</option>
            <option value ="化学工程与能源技术学院">化学工程与能源技术学院</option>
            <option value="机器人学院">机器人学院</option>
            <option value="中法联合学院">中法联合学院</option>
            <option value ="智能制造学院">智能制造学院</option>

           </select>
          </div>
            <div class="form-item">
                年级分类：<select name="BookGrade">
                <option value ="大一">大一</option>
                <option value ="大二">大二</option>
                <option value="大三">大三</option>
                <option value="大四">大四</option>
            </select>
            </div>
            <div class="form-item">
                书籍名称：<input type="text" name="BookName"></input>
            </div>
            <div class="form-item">
                ISBN号：<input type="text" name="BookISBN"></input>
            </div>
            <div class="form-item">
                预售价：<input type="number" name="BookPrice"></input>
            </div>
            <div class="form-item">
                商品介绍：<input type="text" name="BookDescribe"></input>
            </div>
            <div class="form-item">
            选择一个书籍图片文件:
            <input type="file" name="BookImage" />
            </div>
             <input type="submit" value="确定添加" style="width:100px;margin-left:10px ">
        </form>


    </el-card>
</div>
<!-- 书籍表单结束 -->
<!-- 参考表单开始 -->
<img src="../image/model.png" style="width:600px;position:absolute;left: 750px;top:0px;" alt="">
<!-- 参考表单结束 -->

</body>
</html>



<style scoped>
    .el-card{
        width:98%;
        margin:10px;
        height: 550px;
    }
    .form-item{
        color:gray;

        margin: 16px;
        font-size: 20px;
    }
</style>



