package BookServlet;

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

public class AddshopingServlet  extends HttpServlet {
    public void wrong1(String msg){

        int type= JOptionPane.YES_NO_CANCEL_OPTION;
        String title="信息提示";
        JOptionPane.showMessageDialog(null, msg, title, type);
    }
    public void right(){
        String msg="此物品成功添加到购物车！";
        int type= JOptionPane.YES_NO_CANCEL_OPTION;
        String title="信息提示";
        JOptionPane.showMessageDialog(null, msg, title, type);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String BookId=request.getParameter("BookId");

        try{
            Connection con=null;
            Statement stmt=null;
            ResultSet rs=null;
            String url="jdbc:h2:~/jpa-demo-db";
            con= DriverManager.getConnection(url,"sa","sa");
            stmt=con.createStatement();


            String BookBuyerid="";
            HttpSession session=request.getSession();
            ArrayList login=(ArrayList)session.getAttribute("login");
            if(login==null||login.size()==0){
                response.sendRedirect("http://localhost:8080/login.jsp");
            }else{
                for(int i=login.size()-1;i>=0;i--){
                    LoginBean nn=(LoginBean)login.get(i);
                    BookBuyerid=nn.getUserName();

                }
            }
            String sql="select * from Bookinform where BookId= '"+BookId+"'";
            rs=stmt.executeQuery(sql);


            rs.last();
            int k=rs.getRow();

                String Username = rs.getString("Username");
                String  BookStatus = rs.getString("BookStatus");

                //插入到数据库当中！
                String sql2="insert into SELECT_BOOK"+"(BookId,BookStatus,BookSellerId,BookBuyerid)"+"values("+"'"+BookId+"'"+","+"'"+BookStatus+"'"+","+"'"+Username+"'"+","+"'"+BookBuyerid+"'"+")";

            int rowsAffected = stmt.executeUpdate(sql2);
            if (rowsAffected > 0) {
                wrong1("添加成功！");
                response.sendRedirect("http://localhost:8080/ShopingServlert?userName="+BookBuyerid);
            }
            else {
                response.sendRedirect("http://localhost:8080/BookMessage/booklist.jsp?userName="+BookBuyerid);
            }
            rs.close();
            stmt.close();
            con.close();
            right();

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
