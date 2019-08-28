package logindgut;
import javax.json.bind.annotation.JsonbProperty;

public class TokenCheck {

    @JsonbProperty("token")
    private String token;

    @JsonbProperty("userip")
    private String userip;
    @JsonbProperty("appid")
    private String appid;

    @JsonbProperty("appsecret")
    private String appsecret;

    public TokenCheck(){}
    public TokenCheck( String appid, String appsecret,String token, String userip){
        this.token = token;
        this.appid = appid;
        this.appsecret = appsecret;
        this.userip = userip;
    }
    public String getToken() {
        return token;
    }

    public String getUserip() {
        return userip;
    }

    public String getAppsecret() {
        return appsecret;
    }

    public String getAppid() {
        return appid;
    }

    public void setUserip(String userip) {
        this.userip = userip;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public void setAppsecret(String appsecret) {
        this.appsecret = appsecret;
    }

    public void setAppid(String appid) {
        this.appid = appid;
    }

    @Override
    public String toString() {
        return super.toString();
    }

    @Override
    public boolean equals(Object obj) {
        return super.equals(obj);
    }

    @Override
    public int hashCode() {
        return super.hashCode();
    }
}

