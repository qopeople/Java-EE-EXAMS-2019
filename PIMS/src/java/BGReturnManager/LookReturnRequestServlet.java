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
public class LookReturnRequestServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        try {
            Connection con = null;
            Statement stmt = null;
            ResultSet rs = null;
            ResultSet rs2 = null;
            String url="jdbc:h2:~/jpa-demo-db";
            con= DriverManager.getConnection(url,"sa","sa");

            stmt = con.createStatement();

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

            String OrderId=request.getParameter("OrderId");
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

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            SimpleDateFormat sd = new SimpleDateFormat("yyyyMMdd");
            Date datetime = new Date();
            String RequestDate = sdf.format(datetime);
            String ServiceId=sd.format(datetime)+OrderId;
            System.out.println(ServiceId);
            String ReturnMoney=((OrderBean)returnbook.get(0)).getOrdermoney();
            String ServiceStatus="未审核";
            String ServiceDate="";
            String ReturnDescribe="";
            String ServiceRemark="";

            ArrayList checkreturn=null;
            checkreturn=new ArrayList();
            ReturnBean ff=new ReturnBean();
            ff.setServiceId(ServiceId);
            ff.setOrderId(OrderId);
            ff.setRequestDate(RequestDate);
            ff.setUsername(userName);
            ff.setReturnMoney(ReturnMoney);
            ff.setServiceStatus(ServiceStatus);
            ff.setServiceDate(ServiceDate);
            ff.setReturnDescribe(ReturnDescribe);
            ff.setServiceRemark(ServiceRemark);
            checkreturn.add(ff);
            session.setAttribute("checkreturn", checkreturn);

            stmt.close();
            con.close();
            response.sendRedirect("http://localhost:8080/BGOrderManager/ReturnRequest.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        doGet(request, response);
    }

}