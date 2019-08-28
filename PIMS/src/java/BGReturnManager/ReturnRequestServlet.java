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
public class ReturnRequestServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String OrderId=request.getParameter("OrderId");
        if(OrderId.length()==0){
            response.sendRedirect("http://localhost:8080/LookReturnServlet");
        }else {
            try {
                Connection con=null;
                Statement stmt=null;
                ResultSet rs=null;
                String url="jdbc:h2:~/jpa-demo-db";
                con= DriverManager.getConnection(url,"sa","sa");
                stmt=con.createStatement();

                //登录验证
                String userName = "";
                HttpSession session = request.getSession();
                ArrayList login = (ArrayList) session.getAttribute("login");
                if (login == null || login.size() == 0) {
                    response.sendRedirect("http://localhost:8080/login.jsp");
                } else {
                    for (int i = login.size() - 1; i >= 0; i--) {
                        LoginBean nn = (LoginBean) login.get(i);
                        userName = nn.getUserName();
                    }
                }

                //更改订单内状态
                String BookStatus="退货申请中";
                String sql1="update OrderSheet set BookStatus='"+BookStatus+"' where OrderId='"+OrderId+"'";
                System.out.println(sql1);
                stmt.executeUpdate(sql1);

                String sql2="select * from OrderSheet where OrderId='"+OrderId+"';";
                System.out.println(sql2);
                rs=stmt.executeQuery(sql2);
                OrderBean ff=new OrderBean();
                if(rs.next()){
                    ff.setOrderId(rs.getString("OrderId"));
                    ff.setBookId(rs.getString("BookId"));
                    ff.setBookStatus(rs.getString("BookStatus"));
                    ff.setBookSellerid(rs.getString("BookSellerid"));
                    ff.setBookBuyerid(rs.getString("BookBuyerid"));
                    ff.setOrderDate(rs.getString("OrderDate"));
                    ff.setOrdermoney(rs.getString("Ordermoney"));
                }

                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                SimpleDateFormat sd = new SimpleDateFormat("yyyyMMdd");
                Date datetime = new Date();
                String RequestDate = sd.format(datetime);
                String ServiceId=sd.format(datetime)+OrderId;
                String ReturnMoney=ff.getOrdermoney();
                String ServiceStatus="未审核";
                String ServiceDate="''";
                String ReturnDescribe=request.getParameter("ReturnDescribe");
                String ServiceRemark=request.getParameter("ServiceRemark");

//                新增退货申请

                String sql3="insert into ReturnSheet(ServiceId,OrderId,RequestDate,Username,ReturnMoney," +
                        "ServiceStatus,ServiceDate,ReturnDescribe,ServiceRemark) values(" +
                        "'"+ServiceId+"','"+OrderId+"','"+RequestDate+"','"+userName+"','"+ReturnMoney+"','"+
                        ServiceStatus+"',"+ServiceDate+",'"+ReturnDescribe+"','"+ServiceRemark+"');"
                        ;
                System.out.println(sql3);
                stmt.executeUpdate(sql3);

                response.sendRedirect("http://localhost:8080/LookOrderServlet");
                stmt.close();
                con.close();


            } catch (Exception e) {
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