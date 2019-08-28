/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package BGReturnManager;

import loginRegister.LoginBean;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author Administrator
 */
public class PassReturnServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try{
            Connection con=null;
            Statement stmt=null;
            ResultSet rs=null;
            String url="jdbc:h2:~/jpa-demo-db";
            con= DriverManager.getConnection(url,"sa","sa");
            stmt=con.createStatement();

                //登录验证
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

                SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
                Date datetime = new Date();
                String ServiceDate = sd.format(datetime);
                String ServiceId=request.getParameter("ServiceId");
                String ServiceStatus=request.getParameter("ServiceStatus");
                String ServiceRemark=request.getParameter("ServiceRemark");
                String sql1="update ReturnSheet set ServiceStatus='"+ServiceStatus+"',ServiceRemark='"+ServiceRemark+"',ServiceDate='"+ServiceDate+"' where ServiceId='"+ServiceId+"'";
                System.out.println(sql1);
                stmt.executeUpdate(sql1);
                stmt.close();
                con.close();
                response.sendRedirect("http://localhost:8080/LookReturnServlet");
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