/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package BGOrderManager;

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

public class LookOrderServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try{
            Connection con = null;
            Statement stmt = null;
            ResultSet rs = null;
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

                //获取列表信息
                String sql1="select * from OrderSheet ;";
                rs=stmt.executeQuery(sql1);
                ArrayList orderlist=null;
                orderlist=new ArrayList();
                while(rs.next()){
                    OrderBean ff=new OrderBean();
                    ff.setOrderId(rs.getString("OrderId"));
                    ff.setBookId(rs.getString("BookId"));
                    ff.setBookStatus(rs.getString("BookStatus"));
                    ff.setBookSellerid(rs.getString("BookSellerid"));
                    System.out.println(ff.getBookSellerid());
                    ff.setBookBuyerid(rs.getString("BookBuyerid"));
                    System.out.println(ff.getBookBuyerid());
                    ff.setOrderDate(rs.getString("OrderDate"));
                    ff.setOrdermoney(rs.getString("Ordermoney"));
                    orderlist.add(ff);
                 }
                session.setAttribute("orderlist", orderlist);
                rs.close();
                stmt.close();
                con.close();
                response.sendRedirect("http://localhost:8080/BGOrderManager/LookOrder.jsp");
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