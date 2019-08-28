package logindgut;
import javax.json.bind.annotation.JsonbProperty;
public class CheckInform {
    @JsonbProperty("openid")
    private String openid;
    @JsonbProperty("access_token")
    private String access_token;
    public CheckInform(){}
    public CheckInform(String access_token,String openid){
        this.access_token =access_token;
        this.openid =openid;
    }

    public void setAccess_token(String access_token) {
        this.access_token = access_token;
    }

    @Override
    public String toString() {
        return super.toString();
    }

    public void setOpenid(String openid) {
        this.openid = openid;
    }

    @Override
    public boolean equals(Object obj) {
        return super.equals(obj);
    }

    public String getOpenid() {
        return openid;
    }

    public String getAccess_token() {
        return access_token;
    }
}
