/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package BGOrderManager;

/**
 *
 * @author Administrator
 */


public class OrderBean {
    private String OrderId;
    private String BookId;
    private String BookStatus;
    private String BookSellerid;
    private String BookBuyerid;
    private String OrderDate;
    private String Ordermoney;

    public OrderBean() {
    }

    public String getOrderId() {
        return OrderId;
    }

    public void setOrderId(String orderId) {
        OrderId = orderId;
    }

    public String getBookId() {
        return BookId;
    }

    public void setBookId(String bookId) {
        BookId = bookId;
    }

    public String getBookStatus() {
        return BookStatus;
    }

    public void setBookStatus(String bookStatus) {
        BookStatus = bookStatus;
    }

    public String getBookBuyerid() {
        return BookBuyerid;
    }

    public void setBookBuyerid(String bookBuyerid) {
        BookBuyerid = bookBuyerid;
    }

    public String getBookSellerid() {
        return BookSellerid;
    }

    public void setBookSellerid(String bookSellerid) {
        BookSellerid = bookSellerid;
    }

    public String getOrderDate() {
        return OrderDate;
    }

    public void setOrderDate(String orderDate) {
        OrderDate = orderDate;
    }

    public String getOrdermoney() {
        return Ordermoney;
    }

    public void setOrdermoney(String ordermoney) {
        Ordermoney = ordermoney;
    }
}
