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

public class FriendfindServlet extends HttpServlet {
    public void wrong1(String msg){

        int type= JOptionPane.YES_NO_CANCEL_OPTION;
        String title="信息提示";
        JOptionPane.showMessageDialog(null, msg, title, type);
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String fUsername=new String(request.getParameter("fUsername").getBytes("ISO-8859-1"),"UTF-8");

            try{
                //连接数据库、进行信息查询
                Connection con=null;
                Statement stmt=null;
                ResultSet rs=null;

                String url="jdbc:h2:~/jpa-demo-db";
                con= DriverManager.getConnection(url,"sa","sa");
                stmt=con.createStatement();

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
                String sql1="select * from friendinform where fUsername='"+fUsername+"'and Myname='"+userName+"'";

                rs=stmt.executeQuery(sql1);
                rs.last();
                int k;
                k=rs.getRow();

                    ArrayList onefriend=null;
                    onefriend=new ArrayList();
if(k>0) {
    FriendBean ff = new FriendBean();
    ff.setMyname(rs.getString("Myname"));
    ff.setUsername(rs.getString("fUsername"));
    ff.setDepartment(rs.getString("fDepartment"));
    ff.setGradeyear(rs.getString("fGradeyear"));
    ff.setSchoolzone(rs.getString("fSchoolzone"));
    ff.setTelphone(rs.getString("fTelphone"));
    onefriend.add(ff);

}

                    session.setAttribute("onefriend", onefriend);

                rs.close();
                stmt.close();
                con.close();
                response.sendRedirect("http://localhost:8080/friendMessage/friendadd.jsp");
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
