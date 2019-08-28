package logindgut;
import javax.json.bind.annotation.JsonbProperty;

public class JsonReturn {

    @JsonbProperty("error")
    private String error ;
    @JsonbProperty("message")
    private String message;
    @JsonbProperty("openid")
    private String openid;
    @JsonbProperty("access_token")
    private String access_token;
    public JsonReturn(){}
    public JsonReturn(String error,String message,String openid,String access_token){
        this.error = error;
        this.openid =openid;
        this.access_token = access_token;
        this.message = message;
    }

    public String getError() {
        return error;
    }

    public String getAccess_token() {
        return access_token;
    }

    public String getMessage() {
        return message;
    }

    public String getOpenid() {
        return openid;
    }

    @Override
    public int hashCode() {
        return super.hashCode();
    }

    public void setOpenid(String openid) {
        this.openid = openid;
    }

    @Override
    public boolean equals(Object obj) {
        return super.equals(obj);
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public void setError(String error) {
        this.error = error;
    }

    public void setAccess_token(String access_token) {
        this.access_token = access_token;
    }

    @Override
    public String toString() {
        return super.toString();
    }
}
