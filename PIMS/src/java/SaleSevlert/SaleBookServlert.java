package SaleSevlert;

import BookServlet.BookBean;

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

public class SaleBookServlert extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String Username=request.getParameter("userName");

        try{
            Connection con=null;
            Statement stmt=null;
            ResultSet rs=null;
            String url="jdbc:h2:~/jpa-demo-db";
            con= DriverManager.getConnection(url,"sa","sa");
            stmt=con.createStatement();

            String sql="select * from Bookinform where Username='"+Username+"'";
            rs=stmt.executeQuery(sql);

            ArrayList Salelists=null;
            Salelists=new ArrayList();
            while(rs.next()){
                BookBean mm=new BookBean();

                mm.setUsername(rs.getString("Username"));
                mm.setBookId(rs.getString("BookId"));
                mm.setBookISBN (rs.getString("BookISBN"));
                mm.setBookName(rs.getString("BookName"));
                mm.setBookDescribe(rs.getString("BookDescribe"));
                mm.setBookStatus(rs.getString("BookStatus"));
                mm.setBookGrade(rs.getString("BookGrade"));
                mm.setBookDepartment(rs.getString("BookDepartment"));
                mm.setBookImage(rs.getString("BookImage"));
                mm.setBookPrice(rs.getString("BookPrice"));
                Salelists.add(mm);
            }
            HttpSession session=request.getSession();
            session.setAttribute("Salelists", Salelists);
            rs.close();
            stmt.close();
            con.close();
            response.sendRedirect("http://localhost:8080/SalerMessage/salebooklist.jsp");
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
