package personal.board.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(urlPatterns = "/auth/login")
public class LoginController extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Cookie loginChk = new Cookie("User-Token", "");
        loginChk.setPath(req.getContextPath());
        loginChk.setMaxAge(-1);
        resp.addCookie(loginChk);
        req.getRequestDispatcher("/WEB-INF/views/Login.jsp").forward(req, resp);
    }
}
