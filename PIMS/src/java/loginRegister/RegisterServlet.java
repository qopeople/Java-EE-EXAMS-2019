/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package loginRegister;

import java.io.IOException;
import java.sql.*;
//import javax.activation.DataSource;
//import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

/**
 *
 * @author Administrator
 * 1.设计好错误提示函数，便于随时调用
 * 2.severlt一般使用请求数据库操作、数据的增删改查
 */
public class RegisterServlet extends HttpServlet {
    public void wrong1(){
        String msg="不允许有空，注册失败！";
        int type=JOptionPane.YES_NO_CANCEL_OPTION;
        String title="信息提示";
        JOptionPane.showMessageDialog(null, msg, title, type);
    }
    public void wrong2(){
        String msg="两次密码不同，注册失败！";
        int type=JOptionPane.YES_NO_CANCEL_OPTION;
        String title="信息提示";
        JOptionPane.showMessageDialog(null, msg, title, type);
    }
    public void wrong3(){
        String msg="用户名已存在，注册失败！";
        int type=JOptionPane.YES_NO_CANCEL_OPTION;
        String title="信息提示";
        JOptionPane.showMessageDialog(null, msg, title, type);
    }
    public void right(){
        String msg="注册信息合格，注册成功！";
        int type=JOptionPane.YES_NO_CANCEL_OPTION;
        String title="信息提示";
        JOptionPane.showMessageDialog(null, msg, title, type);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String StudentId=new String(request.getParameter("StudentId").getBytes("ISO-8859-1"),"UTF-8");
        String Username=new String(request.getParameter("Username").getBytes("ISO-8859-1"),"UTF-8");
        String Password=new String(request.getParameter("Password").getBytes("ISO-8859-1"),"UTF-8");
        String  repassword =new String(request.getParameter("repassword").getBytes("ISO-8859-1"),"UTF-8");
        if(StudentId.length()==0||Username.length()==0||Password.length()==0||repassword.length()==0){
            wrong1();
            response.sendRedirect("http://localhost:8080/register/register.jsp");
        }else if(!(repassword.equals(Password))){
            wrong2();
            response.sendRedirect("http://localhost:8080/register/register.jsp");
        }else{
            try{
                Connection con=null;
                Statement stmt=null;
                ResultSet rs=null;
               // InitialContext context = new InitialContext();
                //DataSource dataSource = (DataSource)context.lookup("");
               // Class.forName("com.org.h2.Driver");
                String url="jdbc:h2:~/jpa-demo-db";
                con=DriverManager.getConnection(url,"sa","sa");
                stmt=con.createStatement();

                String sql1="select * from userinform where StudentId='"+StudentId+"'";//查找是否有相同的主键存在
                rs=stmt.executeQuery(sql1);
                rs.last();//现将记录移到最后一行，
                int k;
                k=rs.getRow(); //再去获取当前记录最后一行的行数，既可以获取记录总数，
                if(k>0){
                    wrong3();
                    response.sendRedirect("http://localhost:8080/register/register.jsp");
                }else{
                    String sql2="insert into userinform"+"(StudentId,Username,Password)"+"values("+"'"+StudentId+"'"+","+"'"+Username+"'"+","+"'"+Password+"'"+")";
                    stmt.executeUpdate(sql2);
                }
                rs.close();
                stmt.close();
                con.close();
                right();
                response.sendRedirect("http://localhost:8080/login.jsp");
            }catch(Exception e){
                e.printStackTrace();
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        doGet(request, response);
    }

   
}
