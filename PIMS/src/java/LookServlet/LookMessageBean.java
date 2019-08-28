/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package LookServlet;

/**
 *
 * @author Administrator
 */
public class LookMessageBean {
    private String    StudentId;
    private String    Username;
    private String    Password;
    private String    Money;
    private String    Schoolzone;
    private String    Telphone;
    private String    Department;
    private String    Gradeyear;
    private String    remarks;
    public LookMessageBean(){
    }

    public void setUsername(String username) {
        Username = username;
    }

    public String getUsername() {
        return Username;
    }

    public void setPassword(String password) {
        Password = password;
    }

    public String getPassword() {
        return Password;
    }

    public String getStudentId() {
        return StudentId;
    }

    public void setStudentId(String studentId) {
        StudentId = studentId;
    }

    public String getMoney() {
        return Money;
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

    public void setMoney(String money) {
        Money = money;
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

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }
}
