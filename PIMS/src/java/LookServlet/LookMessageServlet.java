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

/**
 *
 * @author Administrator
 */
public class LookMessageServlet extends HttpServlet {
        protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String userName=request.getParameter("userName");
        try{
            Connection con=null;
            Statement stmt=null;
            ResultSet rs=null;
            String url="jdbc:h2:~/jpa-demo-db";
            con=DriverManager.getConnection(url,"sa","sa");
            stmt=con.createStatement();
            String sql="select * from userinform where Username='"+userName+"'";
            rs=stmt.executeQuery(sql);

            LookMessageBean mm=new LookMessageBean();
            HttpSession session=request.getSession();
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
            response.sendRedirect("http://localhost:8080/lookMessage/lookMessage.jsp");
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
