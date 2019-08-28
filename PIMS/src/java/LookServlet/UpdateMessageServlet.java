/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package LookServlet;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
import loginRegister.LoginBean;

/**
 *
 * @author Administrator
 */
public class UpdateMessageServlet extends HttpServlet {
    public void wrong1(){
        String msg="不允许有空，修改失败！";
        int type=JOptionPane.YES_NO_CANCEL_OPTION;
        String title="信息提示";
        JOptionPane.showMessageDialog(null, msg, title, type);
    }
    public void right(){
        String msg="填写信息合格，修改成功！";
        int type=JOptionPane.YES_NO_CANCEL_OPTION;
        String title="信息提示";
        JOptionPane.showMessageDialog(null, msg, title, type);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {


        String Username=new String(request.getParameter("Username").getBytes("ISO-8859-1"),"UTF-8");
        String StudentId=new String(request.getParameter("StudentId").getBytes("ISO-8859-1"),"UTF-8");
        String Telphone=new String(request.getParameter("Telphone").getBytes("ISO-8859-1"),"UTF-8");
        String Department=new String(request.getParameter("Department").getBytes("ISO-8859-1"),"UTF-8");

        String Gradeyear=new String(request.getParameter("Gradeyear").getBytes("ISO-8859-1"),"UTF-8");
        String Schoolzone=new String(request.getParameter("Schoolzone").getBytes("ISO-8859-1"),"UTF-8");
        String remarks=new String(request.getParameter("remarks").getBytes("ISO-8859-1"),"UTF-8");


        if(Username.length()==0||StudentId.length()==0){
            wrong1();
            response.sendRedirect("http://localhost:8080/lookMessage/updateMessage.jsp");
        }else{
            try{
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
                }

                String sql1="Update userinform set Username='"+Username+"',Telphone='"+Telphone+"',Department='"+Department+"',Gradeyear='"+Gradeyear+"',Schoolzone='"+Schoolzone+"',remarks='"+remarks+"'where  StudentId='"+ StudentId+"'";
                stmt.executeUpdate(sql1);
                String sql2="select * from userinform where StudentId='"+StudentId+"'";
                rs=stmt.executeQuery(sql2);
                LookMessageBean mm=new LookMessageBean();
                while(rs.next()){
                    mm.setStudentId(rs.getString("StudentId"));
                    mm.setUsername(rs.getString("Username"));
                    mm.setDepartment(rs.getString("Department"));
                    mm.setGradeyear(rs.getString("Gradeyear"));
                    mm.setPassword(rs.getString("Password"));
                    mm.setSchoolzone(rs.getString("Schoolzone"));
                    mm.setTelphone(rs.getString("Telphone"));
                    mm.setRemarks(rs.getString("remarks"));
                    mm.setMoney(rs.getString("Money"));
                }
                ArrayList wordlist=null;
                wordlist=new ArrayList();
                wordlist.add(mm);
                session.setAttribute("wordlist", wordlist);
                rs.close();
                stmt.close();
                con.close();
                right();
                response.sendRedirect("http://localhost:8080/lookMessage/lookMessage.jsp");
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
