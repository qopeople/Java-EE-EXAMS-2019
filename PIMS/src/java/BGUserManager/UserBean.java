/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package BGUserManager;

/**
 *
 * @author Administrator
 */
public class UserBean {
    private String StudentId;
    private String Username;
    private String Password;
    private String Money;
    private String Schoolzone;
    private String Telphone;
    private String Department;
    private String Gradeyear;
    private String remarks;

    public UserBean() {
    }

    public String getStudentId() {
        return StudentId;
    }

    public void setStudentId(String studentId) {
        StudentId = studentId;
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String username) {
        Username = username;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String password) {
        Password = password;
    }

    public String getMoney() {
        return Money;
    }

    public void setMoney(String money) {
        Money = money;
    }

    public String getSchoolzone() {
        return Schoolzone;
    }

    public void setSchoolzone(String schoolzone) {
        Schoolzone = schoolzone;
    }

    public String getTelphone() {
        return Telphone;
    }

    public void setTelphone(String telphone) {
        Telphone = telphone;
    }

    public String getDepartment() {
        return Department;
    }

    public void setDepartment(String department) {
        Department = department;
    }

    public String getGradeyear() {
        return Gradeyear;
    }

    public void setGradeyear(String gradeyear) {
        Gradeyear = gradeyear;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }
}
