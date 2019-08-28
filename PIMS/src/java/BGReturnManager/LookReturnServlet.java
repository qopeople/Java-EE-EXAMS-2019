/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package BGReturnManager;

import BGReturnManager.ReturnBean;
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

public class LookReturnServlet extends HttpServlet {

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
            System.out.println("");
                //获取列表信息
                String sql1="select * from ReturnSheet ;";
                rs=stmt.executeQuery(sql1);
                ArrayList returnlist=null;
                returnlist=new ArrayList();
                while(rs.next()){
                    ReturnBean ff=new ReturnBean();
                    ff.setServiceId(rs.getString("ServiceId")) ;
                    ff.setOrderId(rs.getString("OrderId")) ;
                    ff.setRequestDate(rs.getString("RequestDate")) ;
                    ff.setUsername(rs.getString("Username")) ;
                    ff.setReturnMoney(rs.getString("ReturnMoney")) ;
                    ff.setServiceStatus(rs.getString("ServiceStatus")) ;
                    ff.setServiceDate(rs.getString("ServiceDate")) ;
                    ff.setReturnDescribe(rs.getString("ReturnDescribe")) ;
                    ff.setServiceRemark(rs.getString("ServiceRemark")) ;
                    returnlist.add(ff);
                 }
                session.setAttribute("returnlist", returnlist);
                rs.close();
                stmt.close();
                con.close();
                response.sendRedirect("http://localhost:8080/BGReturnManager/LookReturn.jsp");
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