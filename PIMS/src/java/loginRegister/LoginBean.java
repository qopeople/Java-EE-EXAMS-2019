
package loginRegister;

public class LoginBean {
    private String username;
    private String password;
    public LoginBean(){
    }
    public String getUserName() {
        return username;
    }
    public void setUserName(String userName) {
        this.username = userName;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
}
