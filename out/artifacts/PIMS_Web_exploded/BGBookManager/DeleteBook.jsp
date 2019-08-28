<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>书籍信息</title>
    <script src="https://unpkg.com/vue/dist/vue.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>
</head> 
<body>
    <!-- 出售列表开始 -->
    <div id="app">
      <el-card  class="box-card" style="width:100%;margin-top: 5px;">
        <div slot="header" class="clearfix">
          <i class="el-icon-tickets"></i> 
          <span>出售列表</span>
        </div>
        <div>
        <el-table ref="productTable"
          :data="list"
          style="width: 100%"
          @selection-change="handleSelectionChange"
          border>
          <el-table-column type="selection" width="60" align="center"></el-table-column>
          <el-table-column label="序号" width="100" align="center" type="index" >
          </el-table-column>
          <el-table-column label="书籍图片" width="120" align="center">
            <template slot-scope="scope">
              <img style="height: 80px" :src="scope.row.BookImage">
            </template>
          </el-table-column>
          <el-table-column label="书籍名称" align="center">
            <template slot-scope="scope">
              <p>{{scope.row.BookName}}</p>
            </template> 
          </el-table-column>
          <el-table-column label="ISBN号" prop="BookISBN" sortable width="120" align="center">
          </el-table-column>
          <el-table-column label="学院分类" width="120" align="center">
            <template slot-scope="scope">
              <p>{{scope.row.BookDepartment}}</p>
            </template>
          </el-table-column>
          <el-table-column label="年级分类" width="120" align="center">
            <template slot-scope="scope">
              <p>{{scope.row.BookGrade}}</p>
            </template> 
          </el-table-column>
          <el-table-column label="审核状态" width="100" align="center">
            <template slot-scope="scope">
              <p>{{scope.row.BookStatus}}</p>
            </template>
          </el-table-column>
          <el-table-column label="操作" width="160" align="center">
            <template slot-scope="scope">
              <el-button
                size="mini"
                @click="handleUpdateProduct(scope.$index, scope.row)">编辑
              </el-button>
              <el-button
                size="mini"
                type="danger"
                @click="handleDelete(scope.$index, scope.row)">删除
              </el-button>
            </template>
          </el-table-column>
        </el-table>
        </div>
      </el-card>
    </div>  
    <!-- 出售列表结束 -->
</body>
</html>
<script>
    var app=new Vue({
        el: '#app',
        data() {
        return {
          hasEditCreated:false,
          //选中商品分类的值
          selectProductCateValue: [],
          productCateOptions: [],
          brandOptions: [],
          value:{},
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
          BookDepartments:[
            {value:'机械工程学院',label:'机械工程学院'},
            {value:'电子工程与智能化学院',label:'电子工程与智能化学院'},
            {value:'计算机科学与技术学院',label:'计算机科学与技术学院'},
            {value:'生态环境与建筑工程学院',label:'生态环境与建筑工程学院'},
            {value:'经济与管理学院',label:'经济与管理学院'},
            {value:'社会发展研究院',label:'社会发展研究院'},
            {value:'文学与传媒学院',label:'文学与传媒学院'},
            {value:'法律与社会工作学院',label:'法律与社会工作学院'},
            {value:'教育学院',label:'教育学院'},
            {value:'化学工程与能源技术学院',label:'化学工程与能源技术学院'},
            {value:'机器人学院',label:'机器人学院'},
            {value:'中法联合学院',label:'中法联合学院'},
            {value:'智能制造学院',label:'智能制造学院'},
            {value:'网络空间安全学院',label:'网络空间安全学院'},
            {value:'材料科学与工程学院',label:'材料科学与工程学院'},
          ],
          BookGrades:[
              {value:'大一',label:'大一'},
              {value:'大二',label:'大二'},
              {value:'大三',label:'大三'},
              {value:'大四',label:'大四'},
          ],
          defaultListQuery :{},
          listQuery:{},
          BookStatuses:[
                {value:'已上架',label:'已上架'},
                {value:'已售出',label:'已售出'},
                {value:'审核未通过',label:'审核未通过'},
          ],
          list:[
            {  
              BookImage:'./算法导论（原书第3版）.jpg',
              BookName:'11',
              BookISBN:'11',
              BookDepartment:'11',  
              BookGrade:'11',
              BookStatus:'已上架',
            },
            {  
              BookImage:'./算法导论（原书第3版）.jpg',
              BookName:'12',
              BookISBN:'12',
              BookDepartment:'12',
              BookGrade:'12',
              BookStatus:'已上架',
            },
            {  
              BookImage:'./算法导论（原书第3版）.jpg',
              BookName:'13',
              BookISBN:'13',
              BookDepartment:'13',
              BookGrade:'13',
              BookStatus:'已上架',
            },
          ],
          }
        },
        methods: {
      handleSelectionChange(val) {
        this.multipleSelection = val;
      },
      handleDelete(index, row){
        this.$confirm('是否要进行删除操作?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          
        });
      },
      //发送筛选请求
      handleSearchList(){
        var searchlist=document.getElementById('Search').action="https://www.baidu.com/";
      },
    }
    })
  </script>
  
  <style scoped>
  </style>

