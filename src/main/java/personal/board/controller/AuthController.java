package personal.board.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import personal.board.model.BoardDao;
import personal.board.model.utils.JWTokens;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

@WebServlet(urlPatterns = "/auth/LoginOk")
public class AuthController extends HttpServlet {
    private static final Logger logger = LoggerFactory.getLogger(AuthController.class);
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //사용자 입력값 받기
        String id = req.getParameter("id");
        String pwd = req.getParameter("pwd");

        //회원 여부 확인
        BoardDao dao = new BoardDao(getServletContext());
        boolean isMember = dao.isMember(id, pwd);
        dao.close();
        if(isMember) { //로그인 처리
            //토큰 생성해서 쿠키에 담기
            Map<String, Object> payloads = new HashMap<String, Object>();
            payloads.put("password", pwd);
            long expirationTime = 1000*60*60*3; //토큰 만료 시간 3시간
            String token = JWTokens.createToken(id, payloads, expirationTime);
            Cookie cookie = new Cookie(getServletContext().getInitParameter("COOKIE-NAME"), token);
            cookie.setPath(req.getContextPath());
            resp.addCookie(cookie);
        }

        //아이디 기억하기 옵션
        logger.info("remember-id값: {}", req.getParameter("remember-id"));
        if(req.getParameter("remember-id") != null) { //옵션을 체크한 경우
//            Cookie rememberIdCookie
        }
    }
}
