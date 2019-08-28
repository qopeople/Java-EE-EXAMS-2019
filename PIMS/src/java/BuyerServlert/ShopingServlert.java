package BuyerServlert;

import BookServlet.BookBean;

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

public class ShopingServlert extends HttpServlet {

    public void wrong1(String msg){

        int type= JOptionPane.YES_NO_CANCEL_OPTION;
        String title="信息提示";
        JOptionPane.showMessageDialog(null, msg, title, type);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userName=request.getParameter("userName");

        try{
            Connection con=null;
            Statement stmt=null;
            ResultSet rs=null;
            String url="jdbc:h2:~/jpa-demo-db";
            con= DriverManager.getConnection(url,"sa","sa");
            stmt=con.createStatement();

            String sql="select * from Bookinform where BookId in ( select BookId from  SELECT_BOOK where BookBuyerid ='"+userName+"')";

            rs=stmt.executeQuery(sql);

            ArrayList shoplists=null;
            shoplists=new ArrayList();
            HttpSession session=request.getSession();
            while(rs.next()){
                BookBean mm=new BookBean();

                mm.setBookId(rs.getString("BookId"));
                mm.setBookISBN (rs.getString("BookISBN"));
                mm.setBookName(rs.getString("BookName"));
                mm.setBookDescribe(rs.getString("BookDescribe"));
                mm.setBookStatus(rs.getString("BookStatus"));
                mm.setBookGrade(rs.getString("BookGrade"));
                mm.setBookDepartment(rs.getString("BookDepartment"));
                mm.setBookImage(rs.getString("BookImage"));
                mm.setBookPrice(rs.getString("BookPrice"));
                shoplists.add(mm);
            }
            session.setAttribute("shoplists", shoplists);
            rs.close();
            stmt.close();
            con.close();
            response.sendRedirect("http://localhost:8080/BuyerMessage/shopinglist.jsp");
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
