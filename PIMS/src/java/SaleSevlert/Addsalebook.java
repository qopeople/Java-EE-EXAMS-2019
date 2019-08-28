package SaleSevlert;


import BookServlet.BookBean;
import loginRegister.LoginBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import javax.swing.*;
import java.awt.print.Book;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

@MultipartConfig(location = "C:\\Users\\齐佩\\Desktop\\ch07\\PIMS\\web\\image\\img")// location改为本地的绝对路径
public class Addsalebook extends HttpServlet  {
    public void wrong1(){
        String msg="不允许有空，添加失败！";
        int type=JOptionPane.YES_NO_CANCEL_OPTION;
        String title="信息提示";
        JOptionPane.showMessageDialog(null, msg, title, type);
    }
    public void wrong2(){
        String msg="用户名已存在，添加失败！";
        int type=JOptionPane.YES_NO_CANCEL_OPTION;
        String title="信息提示";
        JOptionPane.showMessageDialog(null, msg, title, type);
    }
    public void right(){
        String msg="填写信息合格，添加成功！";
        int type=JOptionPane.YES_NO_CANCEL_OPTION;
        String title="信息提示";
        JOptionPane.showMessageDialog(null, msg, title, type);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        Part part = request.getPart("BookImage");
        // part.getSubmittedFileName()方法获取上传文件的文件名
        String  BookImage = part.getSubmittedFileName();
        //System.out.println("上传文件的文件名: " + realpath);
        //String fileNames =  "C:\\unloads\\" + fileName;
        // String realpath = servletContext.getRealPath(fileNames);
        System.out.println("上传文件的文件名: " +  BookImage);

       // session.setAttribute("imagename",fileName);
        // 根据@MultipartConfig的location配置的目录上传文件，直接传参文件名即可。
        part.write(BookImage);
       // response.getWriter().write("文件上传成功！");
        String BookISBN = new String(request.getParameter("BookISBN").getBytes("ISO-8859-1"), "UTF-8");
        String BookName = new String(request.getParameter("BookName").getBytes("ISO-8859-1"), "UTF-8");
        String BookDescribe = new String(request.getParameter("BookDescribe").getBytes("ISO-8859-1"), "UTF-8");
        String BookStatus ="上架";
        String BookGrade = new String(request.getParameter("BookGrade").getBytes("ISO-8859-1"), "UTF-8");
        String BookDepartment = new String(request.getParameter("BookDepartment").getBytes("ISO-8859-1"), "UTF-8");
     //   String BookImage = new String(request.getParameter("BookImage").getBytes("ISO-8859-1"), "UTF-8");
        String BookPrice = new String(request.getParameter("BookPrice").getBytes("ISO-8859-1"), "UTF-8");
//            书籍编号作为唯一标识的主码，暂时决定用这样的方式来编码：
//            学院缩写（4位）+年级（1位）+书籍版号后5位+库存数量+1（4位）
//            总体为10+4位，由于库存一般难以超过9999本以上，所以库存数量为4位可行
//            先寻找同一本书的库存数量，再加入新新的书籍信息
        String Depaid = null;
        switch (BookDepartment) {
            case "机械工程学院":
                Depaid = new String("CME0");
            case "电子工程与智能化学院":
                Depaid = new String("CEEE");
            case "计算机科学与技术学院":
                Depaid = new String("CCST");
            case "生态环境与建筑工程学院":
                Depaid = new String("CAEE");
            case "经济与管理学院":
                Depaid = new String("CEM0");
            case "文学与传媒学院":
                Depaid = new String("CLM0");
            case "法律与社会工作学院":
                Depaid = new String("CLSW");
            case "教育学院":
                Depaid = new String("CE00");
            case "化学工程与能源技术学院":
                Depaid = new String("CEPE");
            case "机器人学院":
                Depaid = new String("CR00");
            case "智能制造学院":
                Depaid = new String("CIM0");
            case "网络空间安全学院":
                Depaid = new String("CCS0");
            case "材料科学与工程学院":
                Depaid = new String("CMSE");
        }
        String Grade = null;
        switch (BookGrade) {
            case "大一":
                Grade = new String("1");
            case "大二":
                Grade  = new String("2");
            case "大三":
                Grade  = new String("3");
            case "大四":
                Grade  = new String("4");
        }
        String ISBN = BookISBN.substring(BookISBN.length() - 5, BookISBN.length());
        //组合出正确图书编码
        String BookId = Depaid + Grade + ISBN;

        if (BookId.length() == 0 || BookISBN.length() == 0 || BookName.length() == 0){
            wrong1();
            response.sendRedirect("http://localhost:8080/SalerMessage/addsalesbook.jsp");
        }
        else{
            try {
                Connection con = null;
                Statement stmt = null;
                ResultSet rs = null;
                String url = "jdbc:h2:~/jpa-demo-db";
                con = DriverManager.getConnection(url, "sa", "sa");
                stmt = con.createStatement();

                HttpSession session=request.getSession();
                ArrayList login=(ArrayList)session.getAttribute("login");
                String userName="";
                if(login==null||login.size()==0){
                    response.sendRedirect("http://localhost:8080/login.jsp");
                }else{
                    for(int i=login.size()-1;i>=0;i--){
                        LoginBean nn=(LoginBean)login.get(i);
                        userName=nn.getUserName();
                    }
                }
                String sql1="select * from Bookinform where BookId='" + BookId+ "'and Username='"+userName+"'";
                rs=stmt.executeQuery(sql1);
                rs.last();
                int k;
                k=rs.getRow();
                if(k>0){
                    wrong2();
                    response.sendRedirect("http://localhost:8080/SalerMessage/addsalesbook.jsp");
                }else{
                    String sql2="insert into Bookinform"+"(BookId,BookISBN,BookName,BookDescribe,BookStatus,BookGrade,BookDepartment,BookImage,BookPrice,Username)"+"values("+"'"+BookId+"'"+","+"'"+BookISBN+"'"+","+"'"+BookName+"'"+","+"'"+BookDescribe+"'"+","+"'"+BookStatus+"'"+","+"'"+BookGrade+"'"+","+"'"+BookDepartment+"'"+","+"'"+BookImage+"'"+","+"'"+BookPrice+"'"+","+"'"+userName+"'"+")";
                    stmt.executeUpdate(sql2);
                }

                String sql3="select * from Bookinform where  Username ='"+userName+"'";
                rs=stmt.executeQuery(sql3);
                ArrayList salelist=null;
                salelist=new ArrayList();

                while(rs.next()){
                    BookBean mm=new BookBean();
                    mm.setBookId(rs.getString("BookId"));
                    mm.setBookISBN (rs.getString("BookISBN"));
                    mm.setBookName(rs.getString("BookName"));
                    mm.setBookDescribe(rs.getString("BookDescribe"));
                    mm.setBookStatus(rs.getString("BookStatus"));
                    mm.setBookGrade(rs.getString("BookGrade"));
                    mm.setBookDepartment(rs.getString("BookDepartment"));
                    mm.setBookImage(rs.getString("BookImage"));
                    mm.setBookPrice(rs.getString("BookPrice"));
                    salelist.add(mm);
                    session.setAttribute("salelist",salelist);
                }
                rs.close();
                stmt.close();
                con.close();
                right();
                response.sendRedirect("http://localhost:8080/SaleBookServlert?userName="+userName);

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    protected void  doGet (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
