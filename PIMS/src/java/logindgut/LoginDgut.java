package logindgut;
import javax.json.*;
import javax.json.bind.Jsonb;
import javax.json.bind.JsonbBuilder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;

import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;


@SuppressWarnings("unchecked")
public class LoginDgut  extends HttpServlet {
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        System.out.println("dewfr");
        try {
            String token = request.getParameter("token");

            if (!token.equals("")) {
                session.setAttribute("tokens",token);
                System.out.println(token);
                    CloseableHttpClient httpclient = HttpClients.createDefault();
                    String url = "https://cas.dgut.edu.cn/ssoapi/v2/checkToken";
                    String useip = request.getLocalAddr();
                    TokenCheck tokenCheck = new TokenCheck("javaee", "b3b52e43ccfd", token, useip);
                    Jsonb jsonb = JsonbBuilder.create();
                    String jsonPerson = jsonb.toJson(tokenCheck);//生成jsonb字符串
                    System.out.println("json"+jsonPerson);
                    HttpPost post = new HttpPost(url);
                    StringEntity postingString = new StringEntity(jsonPerson);// 传递token的认证信息
                    post.setEntity(postingString);  //向url服务器端发送post请求！
                    post.setHeader("Content-type", "application/json");
                    //接受返回的json数据信息
                    HttpResponse res = httpclient.execute(post);
                    if (res.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
                        String result = EntityUtils.toString(res.getEntity());// 返回json格式：
                        System.out.println("信息"+result);
                        JsonReturn jsonReturn = jsonb.fromJson(result, JsonReturn.class);
                        String error = jsonReturn.getError();
                        String openid = jsonReturn.getOpenid();
                        String access_token = jsonReturn.getAccess_token();
                        String messages = jsonReturn.getMessage();
                        if (messages.equals("success")) {
                            Jsonb jsonb2 = JsonbBuilder.create();
                            CloseableHttpClient httpclient2 = HttpClients.createDefault();
                                String url2 = "https://cas.dgut.edu.cn/oauth/getUserInfo";
                                CheckInform checkInform = new CheckInform(access_token,openid);
                                String str = jsonb2.toJson(checkInform);
                                StringEntity postingString2 = new StringEntity(str);
                                HttpPost post2 = new HttpPost(url2);

                                post2.setEntity(postingString2);  //向url服务器端发送post请求！
                                post2.setHeader("Content-type", "application/json");

                                HttpResponse res2 = httpclient2.execute(post2);
                            if (res2.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
                                String result2 = EntityUtils.toString(res2.getEntity());
                                System.out.println("未转化的json内容：" + result2);

                                //再次发送请求
                               // CloseableHttpClient httpclient3 = HttpClients.createDefault();
                               // HttpPost post3 = new HttpPost("http://localhost:8080/SconnectL");
                               // StringEntity postingString3 = new StringEntity(str);
                                // post3.setEntity(postingString3);  //向url服务器端发送post请求！
                                //post3.setHeader("Content-type", "application/json");


                                ReturnInform returnInform = jsonb2.fromJson(result2, ReturnInform.class);

                                session.setAttribute("schoolid",returnInform.getUsername());
                                response.sendRedirect("http://localhost:8080/SnLServlert");




                            }
                        }
            }
            }
            else {
                response.sendRedirect("https://cas.dgut.edu.cn?appid=javaee&state=STATE");
            }

        } catch (Exception e) {

            e.printStackTrace();
        }
    }
    protected void doPost(HttpServletRequest request,
                         HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        if(session.getAttribute("currents").toString().equals("登录"))
          response.sendRedirect("https://cas.dgut.edu.cn?appid=javaee&state=STATE");
        if(session.getAttribute("currents").toString().equals("退出"))
        {
            session.setAttribute("userinorm"," ");
            session.setAttribute("currents", "登录");
            response.sendRedirect("http://localhost:8080/login.jsp");

        }
    }

}
