<%@ page import="java.util.ArrayList" %>

<%@ page import="BGUserManager.UserBean" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>用戶信息</title>
    <script src="https://unpkg.com/vue/dist/vue.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>
</head>
<body>
<!-- 书籍表单开始 -->
<div id="app">
    <el-card  class="box-card" style="width:45%;margin-top: 5px;margin-left: 50px;">
        <div slot="header" class="clearfix">
            <span>用戶信息</span>
        </div>
        <div >
            <el-form :model="value" :rules="rules"  ref="productInfoForm" label-width="120px" style="width: 600px" size="small">
                <el-form-item label="学校账号：" prop="StudentId" >
                    <el-input v-model="value.StudentId"  readonly></el-input>
                </el-form-item>
                <el-form-item label="姓名：" prop="Username">
                    <el-input v-model="value.Username"></el-input>
                </el-form-item>
                <el-form-item label="金币：" prop="Money">
                    <el-input v-model="value.Money" readonly></el-input>
                </el-form-item>
                <el-form-item label="校区：" prop="Schoolzone">
                    <el-input v-model="value.Schoolzone"></el-input>
                </el-form-item>
                <el-form-item label="学院分类：" prop="Department">
                    <el-cascader
                            v-model="value.Department"
                            :options="Departments">
                    </el-cascader>
                </el-form-item>
                <el-form-item label="年级分类：" prop="Gradeyear">
                    <el-cascader
                            v-model="value.Gradeyear"
                            :options="Gradeyears">
                    </el-cascader>
                </el-form-item>
                <el-form-item label="电话号码：" prop="Telphone">
                    <el-input v-model="value.Telphone"></el-input>
                </el-form-item>
                <el-form-item label="个人介绍：">
                    <el-input
                            :autoSize="true"
                            v-model="value.remarks"
                            type="textarea"
                            prop="remarks"
                    ></el-input>
                </el-form-item>
                <el-button type="primary" size="medium" @click="pass" style="position: relative;left:44%;">修改</el-button>
                </el-form-item>
            </el-form>
        </div>
    </el-card>
</div>
<!-- 书籍表单结束 -->
</body>
</html>

<script>
    var app=new Vue({
        el: '#app',
        data() {
            return {
                hasEditCreated:false,
                value:{
                    <%
                        ArrayList checkuser=(ArrayList)session.getAttribute("checkuser");
                        if(checkuser!=null){
                    %>
                    <%
                        UserBean ff=(UserBean)checkuser.get(0);
                    %>
                       StudentId:'<%=ff.getStudentId()%>',
                       Username:'<%=ff.getUsername()%>',
                       Money:'<%=ff.getMoney()%>',
                       Schoolzone:'<%=ff.getSchoolzone()%>',
                       Telphone:'<%=ff.getTelphone()%>',
                       Department:'<%=ff.getDepartment()%>',
                       Gradeyear:'<%=ff.getGradeyear()%>',
                       remarks:'<%=ff.getRemarks()%>',
                    <%
                        }
                    %>
                },
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
                Departments:[
                    {value:'机械工程学院',label:'机械工程学院'},//CME0:College of Mechanical Engineering
                    {value:'电子工程与智能化学院',label:'电子工程与智能化学院'},//CEEE:College of Electrical and Electronic Engineering
                    {value:'计算机科学与技术学院',label:'计算机科学与技术学院'},//CCST:College for Computer Sciences & Technology
                    {value:'生态环境与建筑工程学院',label:'生态环境与建筑工程学院'},//CAEE:College of Architectural Environment Engineering 
                    {value:'经济与管理学院',label:'经济与管理学院'},//CEM0:College of Economics and Management
                    {value:'文学与传媒学院',label:'文学与传媒学院'},//CLM0:College of literature and media
                    {value:'法律与社会工作学院',label:'法律与社会工作学院'},//CLSW:College of Law and Social Work
                    {value:'教育学院',label:'教育学院'},//CE00:College of education
                    {value:'化学工程与能源技术学院',label:'化学工程与能源技术学院'},//CEPE:College OF ENERGY&POWER ENGINEERING
                    {value:'机器人学院',label:'机器人学院'},//CR00:College of Robotics
                    {value:'智能制造学院',label:'智能制造学院'},//CIM0:College of Intelligent manufacturing
                    {value:'网络空间安全学院',label:'网络空间安全学院'},//CCS0:College of Cyberspace Security
                    {value:'材料科学与工程学院',label:'材料科学与工程学院'},//CMSE:College of Material Science and Engineering
                ],
                Gradeyears:[
                    {value:'大一',label:'大一'},
                    {value:'大二',label:'大二'},
                    {value:'大三',label:'大三'},
                    {value:'大四',label:'大四'},
                ],

            }
        },
        methods: {
            pass(){
                let str="&Username="+this.value.Username+"&Schoolzone="+this.value.Schoolzone+"&Telphone="+this.value.Telphone
                    +"&Department="+this.value.Department+"&Gradeyear="+this.value.Gradeyear+"&remarks="+this.value.remarks;
                alert("http://localhost:8080/PassBookServlet?StudentId="+this.value.StudentId+str);
                 window.location.href="http://localhost:8080/UpdateUserServlet?StudentId="+this.value.StudentId+str;
            },

        }
    })
</script>

<style scoped>
    .avatar-uploader .el-upload {
        border: 1px dashed #d9d9d9;
        border-radius: 6px;
        cursor: pointer;
        position: relative;
        overflow: hidden;
    }
    .avatar-uploader .el-upload:hover {
        border-color: #409EFF;
    }
    .avatar-uploader-icon {
        font-size: 28px;
        color: #8c939d;
        width: 178px;
        height: 178px;
        line-height: 178px;
        text-align: center;
    }
    .avatar {
        width: 178px;
        height: 178px;
        display: block;
    }
    .el-input{
        width:250px;
    }
</style>

