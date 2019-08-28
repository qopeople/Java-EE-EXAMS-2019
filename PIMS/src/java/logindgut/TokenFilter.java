package logindgut;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
import java.io.IOException;
/**
 * 相当于是在处理请求时进行其数据的预处理
 * */
@WebFilter(filterName = "TokenFilter")
public class TokenFilter  extends HttpFilter {
    @Override
    protected void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain) throws IOException, ServletException {
        System.out.println(this.getClass());
        res.setContentType("text/html;charset=UTF-8");
        if (req.getMethod().equals("GET")) {
            String token = req.getParameter("token");
            if (!token.equals("")) {
                if (token.equals("APPID-a-0e5a4085badb7af57ff9b50c30d1eee1")) {
                    chain.doFilter(req, res); //token通过验证
                    return;
                } else {
                    res.sendRedirect("https://cas.dgut.edu.cn?appid=javaee&state=STATE");
                }
            }
        }
        chain.doFilter(req, res); //token通过验证
        return;
    }

    @Override
    public void destroy() {

    }
}
