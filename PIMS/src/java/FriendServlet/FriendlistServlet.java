package FriendServlet;



import loginRegister.LoginBean;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.*;

public class FriendlistServlet extends HttpServlet{
    public void wrong1(String msg){

        int type= JOptionPane.YES_NO_CANCEL_OPTION;
        String title="信息提示";
        JOptionPane.showMessageDialog(null, msg, title, type);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try{
            Connection con=null;
            Statement stmt=null;
            ResultSet rs=null;
            String url="jdbc:h2:~/jpa-demo-db";
            con=DriverManager.getConnection(url,"sa","sa");
            stmt=con.createStatement();

            String Myname="";
            HttpSession session=request.getSession();
            ArrayList login=(ArrayList)session.getAttribute("login");
            if(login==null||login.size()==0){
                response.sendRedirect("http://localhost:8080/login.jsp");
            }else{
                for(int i=login.size()-1;i>=0;i--){
                    LoginBean nn=(LoginBean)login.get(i);
                    Myname=nn.getUserName();
                  //  wrong1(Myname);
                }
            }

            String sql="select * from friendinform where Myname='"+Myname+"'";
            rs=stmt.executeQuery(sql);



            ArrayList friendlist=null;
            friendlist=new ArrayList();
            while(rs.next()){
                FriendBean mm=new FriendBean();
                mm.setMyname(rs.getString("Myname"));

                mm.setUsername(rs.getString("fUsername"));

                    mm.setDepartment(rs.getString("fDepartment"));

                    mm.setGradeyear(rs.getString("fGradeyear"));

                    mm.setSchoolzone(rs.getString("fSchoolzone"));
                    mm.setTelphone(rs.getString("fTelphone"));
              //   wrong1(mm.getDepartment()+mm.getGradeyear()+mm.getMyname()+mm.getTelphone()+mm.getSchoolzone() );
                friendlist.add(mm);

            }
            session.setAttribute("friendlist",friendlist);
            rs.close();
            stmt.close();
            con.close();
            response.sendRedirect("http://localhost:8080/friendMessage/friendlist.jsp");
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
