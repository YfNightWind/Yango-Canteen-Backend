package com.alexlin.yangocanteen.util;

import com.alexlin.yangocanteen.bean.User;

import io.jsonwebtoken.*;
import io.jsonwebtoken.security.SignatureException;

import java.util.Date;
import java.util.UUID;

public class JwtUtil {
    //设置长一些防止出现is not secure enough for the HS256 algorithm的情况
    public static final String JWT_SIGN_KEY = "springboottokenzhendeshihaofuzawodoubuzhidaozenmegao";

    public static String createToken(User user) {
        String token;
        long time = 1000L * 60 * 60 * 24 * 30;
//        String signature = user.getUsername();
//
//        int calendarField = Calendar.DATE;
//        int calendarInterval = 20;// 天数
//        // 签名时间
//        Date signTime = new Date();
//
//        Calendar nowTime = Calendar.getInstance();
//        nowTime.add(calendarField, calendarInterval);
//        // 到期时间
//        Date expiresDate = nowTime.getTime();
//
//        token = JWT.create().withAudience(user.getUsername())// 将用户名存入token中
//                .withIssuedAt(signTime)// 签名时间
//                .withExpiresAt(expiresDate)// 到期时间
//                .sign(Algorithm.HMAC256(JWT_SIGN_KEY));// 将用户名作为token密钥
        JwtBuilder jwtBuilder = Jwts.builder();
        token = jwtBuilder
                // header
                .setHeaderParam("typ", "JWT")
                .setHeaderParam("alg", "HS256")
                // payload
                .claim("username", user.getUsername())
                .claim("password", user.getPassword())
                .setExpiration(new Date(System.currentTimeMillis() + time))
                .setId(UUID.randomUUID().toString())
                .setSubject(user.getUsername())
                // signature
                // 加上username使得每个用户具有唯一性
                .signWith(SignatureAlgorithm.HS256, JWT_SIGN_KEY + user.getUsername())
                .compact();

        return token;
    }

    // 校验token
    public static boolean checkToken(String username, String token) {
        if (username == null || token == null) {
            return false;
        }

        try {
            Jws<Claims> claimsJws = Jwts.parser().setSigningKey(JWT_SIGN_KEY + username).parseClaimsJws(token);
        } catch (MalformedJwtException | SignatureException | ExpiredJwtException | UnsupportedJwtException e) {
            System.out.println(e);
            return false;
        }
        return true;
    }
}
