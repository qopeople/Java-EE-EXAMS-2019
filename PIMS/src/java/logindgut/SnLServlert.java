package logindgut;

import loginRegister.LoginBean;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

public class SnLServlert  extends HttpServlet {
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String  StudentId=  (String) session.getAttribute("schoolid");
        try{
            Connection con=null;
            Statement stmt=null;
            ResultSet rs=null;

            String url="jdbc:h2:~/jpa-demo-db";
            con=DriverManager.getConnection(url,"sa","sa");
            stmt=con.createStatement();


            String sql1="select * from userinform where StudentId='"+StudentId+"'";//查找是否有相同的主键存在
            rs=stmt.executeQuery(sql1);
            rs.last();//现将记录移到最后一行，
            int k;
            k=rs.getRow(); //再去获取当前记录最后一行的行数，既可以获取记录总数，
            if(k>0) {
                String username = rs.getString("Username");
                LoginBean nn=new LoginBean();//实例化保存个人信息的JavaBean
                nn.setUserName(username);//保存用户名

                ArrayList login=new ArrayList();//实例化列表对象，是为了多并发操作吗？
                login.add(nn);//把个人信息保存到列表中，如果同时有很多人同时访问，则不会出现数据混乱的操作？
                session.setAttribute("login", login);//把列表保存到session对象中，以便在别的页面中获取个人信息
                session.setAttribute("userName",username);
                response.sendRedirect("http://localhost:8080/BookMessage/homepage.jsp");

            }
            else {
                response.sendRedirect("http://localhost:8080/register/register.jsp");
            }
            } catch (SQLException e) {
            e.printStackTrace();
        }






    }

@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        doGet(request, response);
        }
}
