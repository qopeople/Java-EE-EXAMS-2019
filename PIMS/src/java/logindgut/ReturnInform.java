package logindgut;
import javax.json.bind.annotation.JsonbProperty;

public class ReturnInform {
    @JsonbProperty( "username")
    private String  username ;
    @JsonbProperty("name")
    private String name  ;
    @JsonbProperty("faculty")
    private String faculty ;
    @JsonbProperty("faculty_title")
    private String faculty_title ;
    @JsonbProperty("group")
    private String group ;
    @JsonbProperty("openid")
    private String openid ;
    @JsonbProperty("wx_openid")
    private String wx_openid ;

    public ReturnInform(){}

    public ReturnInform(String  username,String name, String faculty,String wx_openid, String group,String faculty_title,String openid){
        this.group =group;
        this.name = name;
        this.openid=openid;
        this.username=username;
        this.wx_openid =wx_openid;
        this.faculty =faculty;
        this.faculty_title = faculty_title;
    }


    public String getOpenid() {
        return openid;
    }

    public String getGroup() {
        return group;
    }


    public String getName() {
        return name;
    }

    public String getUsername() {
        return username;
    }

    public void setFaculty_title(String faculty_title) {
        this.faculty_title = faculty_title;
    }

    public void setFaculty(String faculty) {
        this.faculty = faculty;
    }

    public String getFaculty_title() {
        return faculty_title;
    }

    public String getFaculty() {
        return faculty;
    }

    public String getWx_openid() {
        return wx_openid;
    }


    public void setGroup(String group) {
        this.group = group;
    }


    public void setName(String name) {
        this.name = name;
    }

    public void setOpenid(String openid) {
        this.openid = openid;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setWx_openid(String wx_openid) {
        this.wx_openid = wx_openid;
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
