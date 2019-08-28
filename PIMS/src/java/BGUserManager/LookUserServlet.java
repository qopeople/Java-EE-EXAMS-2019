/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package BGUserManager;

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
import java.util.ArrayList;

public class LookUserServlet extends HttpServlet {

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
                //获取列表信息
                String sql1="select * from USERINFORM ;";
                rs=stmt.executeQuery(sql1);
                ArrayList userlist=null;
                userlist=new ArrayList();
                while(rs.next()){
                    UserBean ff=new UserBean();
                    ff.setStudentId(rs.getString("StudentId"));
                    ff.setUsername(rs.getString("Username"));
                    ff.setPassword(rs.getString("Password"));
                    ff.setMoney(rs.getString("Money"));
                    ff.setSchoolzone(rs.getString("Schoolzone"));
                    ff.setTelphone(rs.getString("Telphone"));
                    ff.setDepartment(rs.getString("Department"));
                    ff.setGradeyear(rs.getString("Gradeyear"));
                    ff.setRemarks(rs.getString("remarks"));
                    userlist.add(ff);
                 }
                session.setAttribute("userlist", userlist);
                rs.close();
                stmt.close();
                con.close();
                response.sendRedirect("http://localhost:8080/BGUserManager/LookUser.jsp");
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