package personal.board.model.utils;

import io.jsonwebtoken.*;
import io.jsonwebtoken.security.Keys;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.crypto.SecretKey;
import java.nio.charset.StandardCharsets;
import java.util.*;

public class JWTokens {
    private static SecretKey secretKey;
    private static final Logger logger = LoggerFactory.getLogger(JWTokens.class);
    private static final String KEY_PATH = "/resources/tokens"; //확장자 생략
    private static final String KEY="secret-key";
    static {
        //tokens.properties에 작성해줬던 키 값 가져오기
        ResourceBundle resource = ResourceBundle.getBundle(KEY_PATH);
        String secretKey = resource.getString(KEY);
        byte[] secret = Base64.getEncoder().encodeToString(secretKey.getBytes()).getBytes(StandardCharsets.UTF_8);
        secretKey = String.valueOf(Keys.hmacShaKeyFor(secret));

    }

    /**
     * JWT 토큰을 생성한 후 반환해주는 메소드
     * @param username - 사용자 아이디
     * @param payloads - 사용자 정보를 추가로 저장하기 위한 Claims
     * @param expirationTime - 토큰 만료 시간 (15분 ~ 몇 시간이 적당)
     *                       - 단위는 1/1000초 (즉 1ms)
     * @return jwt 토큰값 반환
     * */
    public static String createToken(String username, Map<String, Object> payloads, long expirationTime) {
        //JWT 토큰 만료시간
        long currentTimeMillis = System.currentTimeMillis(); //토큰 생성시간
        expirationTime += currentTimeMillis;

        //header 설정
        Map<String, Object> headers = new HashMap<>();
        headers.put("typ", "JWT");  //토큰의 종류
        headers.put("alg", "HS256"); //암호화 알고리즘

        Claims claims = (Claims) Jwts.claims().subject(username);
        claims.putAll(payloads);
        claims.put("roles", "권한");

        JwtBuilder builder = Jwts.builder()
                .header().add(headers).and() //header 설정
                .claims(claims) //기타 페이로드 설정
                .issuedAt(new Date()) //생성 시간 설정
                .expiration(new Date(expirationTime)) //만료 시간 설정
                .signWith(secretKey, Jwts.SIG.HS256); //비밀 키로 JWT 서명

        //JWT 생성
        String jwt = builder.compact();
        return jwt;
    }

    /**
     * 발급된 토큰의 payloads 부분을 반환하는 메소드
     * @param token - 발급된 토큰
     * @return 토큰의 payloads 부분을 반환
     * */
    public static Map<String, Object> getTokenPayloads(String token) {
        Map<String, Object> claims = new HashMap<>();
        try{
            claims = Jwts.parser()
                    .verifyWith(secretKey).build() //signature로 검증
                    .parseSignedClaims(token) //만기일자 체크
                    .getPayload();
            return claims;
        } catch(Exception e) {
            claims.put("invalid", "Invalid Token");
        }

        return claims;
    }

    /**
     * 유효한 토큰인지 검증하는 메소드
     * @param token - 발급토큰
     * @return 유효한 토큰이면 true, 만료됐거나 변조된 토큰이면 false 반환
     * */
    public static boolean verifyToken(String token) {
        try{
            //JWT토큰 파싱 및 검증
            Jws<Claims> claims = Jwts.parser()
                    .verifyWith(secretKey).build() //signature 비밀키로 검증
                    .parseSignedClaims(token); //만기일자 체크
            //토큰의 유효성과 만료일자 확인
            logger.info("만기일자: {}", claims.getPayload().getExpiration());
            return true;
        } catch(JwtException | IllegalArgumentException e) {
            logger.error("유효하지 않은 토큰입니다: {}", e.getMessage());
            return false;
        }
    }

    /**
     * 발급된 토큰을 요청헤더의 쿠키에서 읽어오는 메소드
     * @param request - 요청 헤더에서 쿠키를 읽어오기 위한 객체
     * @param cookieName - 토큰 발급 시 설정한 쿠키 명
     * @return 발급된 토큰
     */
    public static String getToken(HttpServletRequest request, String cookieName) {
        //발급된 토큰 가져오기
        Cookie[] cookies = request.getCookies();
        String token = "";
        if(cookies != null) {
            for(Cookie cookie : cookies) {
                if(cookie.getName().equals(cookieName)) {
                    token = cookie.getValue();
                }
            }
        }
        return token;
    }

    /**
     * 토큰 삭제 메소드
     * @param request - HttpServletRequest 객체
     * @param response - HttpServletResponse 객체
     * */
    public static void removeToken(HttpServletRequest request, HttpServletResponse response) {
        Cookie cookie = new Cookie(request.getServletContext().getInitParameter("COOKIE-NAME"),"");
        cookie.setPath(request.getContextPath());
        cookie.setMaxAge(0);
        response.addCookie(cookie);
    }
}
