package FriendServlet;

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

public class FrienddeleteServlet extends HttpServlet {
    public void wrong1(String msg){

        int type= JOptionPane.YES_NO_CANCEL_OPTION;
        String title="信息提示";
        JOptionPane.showMessageDialog(null, msg, title, type);
    }
    public void right(){
        String msg="此通讯录好友已成功删除！";
        int type=JOptionPane.YES_NO_CANCEL_OPTION;
        String title="信息提示";
        JOptionPane.showMessageDialog(null, msg, title, type);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fUsername=request.getParameter("fUsername");
        try {
            Connection con = null;
            Statement stmt = null;
            ResultSet rs = null;
            String url = "jdbc:h2:~/jpa-demo-db";
            con = DriverManager.getConnection(url, "sa", "sa");
            stmt = con.createStatement();

            String Myname="";
            HttpSession session=request.getSession();
            ArrayList login=(ArrayList)session.getAttribute("login");
            if(login==null||login.size()==0){
                response.sendRedirect("http://localhost:8080/login.jsp");
            }else{
                for(int i=login.size()-1;i>=0;i--){
                    LoginBean nn=(LoginBean)login.get(i);
                    Myname=nn.getUserName();

                }
            }
            String sql="select * from friendinform where Myname='"+Myname+"' and fUsername= '"+fUsername+"'";
            rs=stmt.executeQuery(sql);
            rs.last();
            int k=rs.getRow();
            if(k>0){
                String sql2="delete  from friendinform where Myname='"+Myname+"' and fUsername= '"+fUsername+"'";

                stmt.executeUpdate(sql2);
            }
            rs.close();
            stmt.close();
            con.close();
            right();
            response.sendRedirect("http://localhost:8080/FriendlistServlet?Myname="+Myname);
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


