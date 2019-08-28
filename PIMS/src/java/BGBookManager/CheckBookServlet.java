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

/**
 *
 * @author Administrator
 */
public class CheckBookServlet extends HttpServlet {
    public void wrong1(){
        String msg="不允许有空，注册失败！";
        int type=JOptionPane.YES_NO_CANCEL_OPTION;
        String title="信息提示";
        JOptionPane.showMessageDialog(null, msg, title, type);
    }
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

                String BookId="";
                BookId=request.getParameter("BookId");
                System.out.println(BookId);
                String sql1="select * from BOOKINFORM where BookId='"+BookId+"'";
                System.out.println(sql1);
                rs=stmt.executeQuery(sql1);
                ArrayList checkbook=null;
                checkbook=new ArrayList();
                while(rs.next()){
                    BookBean ff=new BookBean();
                    ff.setBookId(rs.getString("BookId")) ;
                    ff.setBookISBN(rs.getString("BookISBN")) ;
                    ff.setBookName(rs.getString("BookName")) ;
                    ff.setBookDescribe(rs.getString("BookDescribe")) ;
                    ff.setBookGrade(rs.getString("BookGrade")) ;
                    ff.setBookDepartment(rs.getString("BookDepartment")) ;
                    ff.setBookImage(rs.getString("BookImage")) ;
                    ff.setBookPrice(rs.getString("BookPrice")) ;
                    ff.setUsername(rs.getString("Username"));
                    ff.setBookStatus(rs.getString("BookStatus")) ;
                    checkbook.add(ff);
                 }
                session.setAttribute("checkbook", checkbook);
                rs.close();
                stmt.close();
                con.close();
                response.sendRedirect("http://localhost:8080/BGBookManager/CheckBook.jsp");
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