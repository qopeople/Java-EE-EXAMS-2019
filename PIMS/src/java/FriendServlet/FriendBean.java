package FriendServlet;

public class FriendBean  {

    private String    Username;

    private String    Schoolzone;
    private String    Telphone;
    private String    Department;
    private String    Gradeyear;
    private String    Myname;
    public  FriendBean (){
    }

    public void setUsername(String username) {
        Username = username;
    }

    public String getUsername() {
        return Username;
    }


    public String getSchoolzone() {
        return Schoolzone;
    }

    public String getDepartment() {
        return Department;
    }

    public String getGradeyear() {
        return Gradeyear;
    }

    public String getTelphone() {
        return Telphone;
    }


    public void setDepartment(String department) {
        Department = department;
    }

    public void setSchoolzone(String schoolzone) {
        Schoolzone = schoolzone;
    }

    public void setGradeyear(String gradeyear) {
        Gradeyear = gradeyear;
    }

    public void setTelphone(String telphone) {
        Telphone = telphone;
    }

    public String getMyname() {
        return Myname;
    }

    public void setMyname(String myname) {
        Myname = myname;
    }
}
