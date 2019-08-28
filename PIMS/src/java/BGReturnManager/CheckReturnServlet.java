/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package BGReturnManager;

import BGOrderManager.OrderBean;
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
public class CheckReturnServlet extends HttpServlet {
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
                Connection con=null;
                Statement stmt=null;
                ResultSet rs=null;
                ResultSet rs2=null;
            String url="jdbc:h2:~/jpa-demo-db";
            con= DriverManager.getConnection(url,"sa","sa");

                stmt=con.createStatement();

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

                String ServiceId="";
                ServiceId=request.getParameter("ServiceId");
                System.out.println(ServiceId);
                String sql1="select * from ReturnSheet where ServiceId='"+ServiceId+"'";
                System.out.println(sql1);
                rs=stmt.executeQuery(sql1);
                ArrayList checkreturn=null;
                checkreturn=new ArrayList();
                while(rs.next()){
                    ReturnBean ff=new ReturnBean();
                    ff.setServiceId(rs.getString("ServiceId"));
                    ff.setOrderId(rs.getString("OrderId"));
                    ff.setRequestDate(rs.getString("RequestDate"));
                    ff.setUsername(rs.getString("Username"));
                    ff.setReturnMoney(rs.getString("ReturnMoney"));
                    ff.setServiceStatus(rs.getString("ServiceStatus"));
                    ff.setServiceDate(rs.getString("ServiceDate"));
                    ff.setReturnDescribe(rs.getString("ReturnDescribe"));
                    ff.setServiceRemark(rs.getString("ServiceRemark"));
                    checkreturn.add(ff);
                 }
                session.setAttribute("checkreturn", checkreturn);
                rs.close();

                String OrderId=((ReturnBean)checkreturn.get(0)).getOrderId();
                String sql2="select * from OrderSheet where OrderId='"+OrderId+"'";
                System.out.println(sql2);
                rs2=stmt.executeQuery(sql2);
                ArrayList returnbook=null;
                returnbook=new ArrayList();
                while(rs2.next()){
                    OrderBean ff=new OrderBean();
                    ff.setOrderId(rs2.getString("OrderId"));
                    ff.setOrderDate(rs2.getString("OrderDate"));
                    ff.setBookId(rs2.getString("BookId"));
                    ff.setBookSellerid(rs2.getString("BookSellerid"));
                    ff.setBookBuyerid(rs2.getString("BookBuyerid"));
                    ff.setBookStatus(rs2.getString("BookStatus"));
                    ff.setOrdermoney(rs2.getString("Ordermoney"));
                    returnbook.add(ff);
                }
                session.setAttribute("returnbook", returnbook);
                rs2.close();
                stmt.close();
                con.close();
                response.sendRedirect("http://localhost:8080/BGReturnManager/CheckReturn.jsp");
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