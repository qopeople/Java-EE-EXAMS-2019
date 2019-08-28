package FriendServlet;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import FriendServlet.FriendBean;
import loginRegister.LoginBean;

public class FriendaddServlet extends HttpServlet {
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
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        String fUsername=new String(request.getParameter("fUsername").getBytes("ISO-8859-1"),"UTF-8");
        String fSchoolzone=new String(request.getParameter("fSchoolzone").getBytes("ISO-8859-1"),"UTF-8");
        String fTelphone=new String(request.getParameter("fTelphone").getBytes("ISO-8859-1"),"UTF-8");
        String fDepartment=new String(request.getParameter("fDepartment").getBytes("ISO-8859-1"),"UTF-8");
        String fGradeyear=new String(request.getParameter("fGradeyear").getBytes("ISO-8859-1"),"UTF-8");

        if(fUsername.length()==0||fSchoolzone.length()==0||fTelphone.length()==0||fTelphone.length()==0||fDepartment.length()==0){
            wrong1();
            response.sendRedirect("http://localhost:8080/friendMessage/friendadd.jsp");
        }else {
            try{
                //连接数据库、进行信息查询
                Connection con=null;
                Statement stmt=null;
                ResultSet rs=null;

                String url="jdbc:h2:~/jpa-demo-db";
                con=DriverManager.getConnection(url,"sa","sa");
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
                if(k>0){
                    wrong2();
                    response.sendRedirect("http://localhost:8080/friendMessage/friendadd.jsp");
                }else{
                    String sql2="insert into friendinform"+"(fUsername,fSchoolzone,fTelphone,fDepartment,fGradeyear,Myname)"+"values("+"'"+fUsername+"'"+","+"'"+fSchoolzone+"'"+","+"'"+fTelphone+"'"+","+"'"+fDepartment+"'"+","+"'"+fGradeyear+"'"+","+"'"+userName+"'"+")";
                    stmt.executeUpdate(sql2);
                }
                String sql3="select * from friendinform where Myname='"+userName+"'";
                rs=stmt.executeQuery(sql3);
                ArrayList friendlist=null;
                friendlist=new ArrayList();
                while(rs.next()){
                    FriendBean ff=new FriendBean();
                    ff.setMyname(rs.getString("Myname"));

                    ff.setUsername(rs.getString("fUsername"));
                    ff.setDepartment(rs.getString("fDepartment"));
                    ff.setGradeyear(rs.getString("fGradeyear"));
                    ff.setSchoolzone(rs.getString("fSchoolzone"));
                    ff.setTelphone(rs.getString("fTelphone"));
                    friendlist.add(ff);

                }
                session.setAttribute("friendlist", friendlist);
                rs.close();
                stmt.close();
                con.close();
                right();
                response.sendRedirect("http://localhost:8080/friendMessage/friendlist.jsp");
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