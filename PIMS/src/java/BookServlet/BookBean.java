package BookServlet;

public class BookBean {
    private String  BookId;
    private String BookISBN;
    private String BookName ;
    private String BookDescribe;
    private String BookStatus ;
    private String BookGrade ;
    private String BookDepartment;
    private String BookImage ;
    private String BookPrice ;
    private String Username;
    public String getBookId() {
        return BookId;
    }

    public String getBookDescribe() {
        return BookDescribe;
    }

    public String getBookGrade() {
        return BookGrade;
    }

    public String getBookISBN() {
        return BookISBN;
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String username) {
        Username = username;
    }

    public String getBookName() {
        return BookName;
    }

    public void setBookDescribe(String bookDescribe) {
        BookDescribe = bookDescribe;
    }

    public void setBookId(String bookId) {
        BookId = bookId;
    }

    public String getBookStatus() {
        return BookStatus;
    }

    public String getBookDepartment() {
        return BookDepartment;
    }

    public void setBookGrade(String bookGrade) {
        BookGrade = bookGrade;
    }

    public void setBookISBN(String bookISBN) {
        BookISBN = bookISBN;
    }

    public void setBookName(String bookName) {
        BookName = bookName;
    }

    public void setBookStatus(String bookStatus) {
        BookStatus = bookStatus;
    }

    public String getBookImage() {
        return BookImage;
    }

    public void setBookDepartment(String bookDepartment) {
        BookDepartment = bookDepartment;
    }



    public String getBookPrice() {
        return BookPrice;
    }



    public void setBookImage(String bookImage) {
        BookImage = bookImage;
    }


    public void setBookPrice(String bookPrice) {
        BookPrice = bookPrice;
    }

}
