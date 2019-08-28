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
public class DeleteOrderServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String OrderId=request.getParameter("OrderId");
        if(OrderId.length()==0){
            response.sendRedirect("http://localhost:8080/LookOrderServlet");
        }else {
            try {
                Connection con = null;
                Statement stmt = null;
                ResultSet rs = null;
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

                String sql1 = "delete from OrderSheet  where OrderId='" + OrderId + "'";
                System.out.println(sql1);
                stmt.executeUpdate(sql1);

                String sql2 = "delete from ReturnSheet  where OrderId='" + OrderId + "'";
                System.out.println(sql2);
                stmt.executeUpdate(sql2);

                stmt.close();
                con.close();
                response.sendRedirect("http://localhost:8080/LookOrderServlet");
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