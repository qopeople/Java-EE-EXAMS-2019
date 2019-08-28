package BuyerServlert;

import loginRegister.LoginBean;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.*;
import java.io.IOException;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
public class AccountServlet  extends HttpServlet {
    public void wrong1(String msg){

        int type= JOptionPane.YES_NO_CANCEL_OPTION;
        String title="信息提示";
        JOptionPane.showMessageDialog(null, msg, title, type);
    }
    public void right(){
        String msg="此物品已成功删除！";
        int type=JOptionPane.YES_NO_CANCEL_OPTION;
        String title="信息提示";
        JOptionPane.showMessageDialog(null, msg, title, type);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String BookId=request.getParameter("BookId");
        String Ordermoney = request.getParameter("Ordermoney");
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        String OrderDate= df.format(new Date());// new Date()为获取当前系统时间

        long randomNum = System.currentTimeMillis();
       String OrderId = ""+randomNum;
        try{
            Connection con=null;
            Statement stmt=null;
            ResultSet rs=null;
            String url="jdbc:h2:~/jpa-demo-db";
            con= DriverManager.getConnection(url,"sa","sa");
            stmt=con.createStatement();

            String sql1="select  * from SELECT_BOOK  where BookId = '"+BookId+"'";

            rs=stmt.executeQuery(sql1);
            rs.last();
            int k=rs.getRow();
            if(k>0){
                String BookSellerId = rs.getString("BookSellerId");
                String BookBuyerid = rs.getString("BookBuyerid");
                String BookStatus="售出";
                String sql2="insert into OrderSheet"+"(OrderId,OrderDate,BookId,BookSellerId,BookBuyerid,BookStatus,Ordermoney)"+"values("+"'"+OrderId+"'"+","+"'"+OrderDate+"'"+","+"'"+BookId+"'"+","+"'"+BookSellerId+"'"+","+"'"+BookBuyerid+"','"+BookStatus+"'"+","+"'"+Ordermoney+"')";

                stmt.executeUpdate(sql2);
                String sql3 = "Update Bookinform  set BookStatus='售出' where BookId='"+BookId+"'";

                stmt.executeUpdate(sql3);

            }
            rs.close();
            stmt.close();
            con.close();
            right();
            response.sendRedirect("http://localhost:8080/ShopdeleteServlet?BookId="+BookId);
    } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void  doPost (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
    }

