/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package BGBookManager;

import BookServlet.BookBean;
import loginRegister.LoginBean;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class LookBookServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try{
            Connection con = null;
            Statement stmt = null;
            ResultSet rs = null;
            String url = "jdbc:h2:~/jpa-demo-db";
            con = DriverManager.getConnection(url, "sa", "sa");
            stmt = con.createStatement();

                String BookId="";

                //登录检查
                String userName="";
                HttpSession session=request.getSession();
                ArrayList login=(ArrayList)session.getAttribute("login");
                if(login==null||login.size()==0){
                    response.sendRedirect("http://localhost:8080/login.jsp");
                }else{
                    for(int i=login.size()-1;i>=0;i--){
                        LoginBean nn=(LoginBean)login.get(i);
                        userName=nn.getUserName();
                    }
                }
            System.out.println("QQQQQQ");
                //获取列表信息
                BookId=request.getParameter("BookId");
                String sql1="select * from BOOKINFORM ;";
                rs=stmt.executeQuery(sql1);
                ArrayList booklist=null;
                booklist=new ArrayList();
                while(rs.next()){
                    BookBean ff=new BookBean();
                    ff.setBookId(rs.getString("BookId")) ;
                    ff.setBookISBN(rs.getString("BookISBN")) ;
                    ff.setBookName(rs.getString("BookName")) ;
                    ff.setBookDescribe(rs.getString("BookDescribe")) ;
                    ff.setBookGrade(rs.getString("BookGrade")) ;
                    ff.setBookDepartment(rs.getString("BookDepartment")) ;
                    ff.setBookImage("../image/img/"+rs.getString("BookImage")) ;
                    ff.setBookPrice(rs.getString("BookPrice")) ;
                    ff.setUsername(rs.getString("Username"));
                    ff.setBookStatus(rs.getString("BookStatus")) ;
                    booklist.add(ff);
                 }
                session.setAttribute("booklist", booklist);
                rs.close();
                stmt.close();
                con.close();
                response.sendRedirect("http://localhost:8080/BGBookManager/LookBook.jsp");
            }catch(Exception e){
                e.printStackTrace();
            }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        doGet(request, response);
    }
}