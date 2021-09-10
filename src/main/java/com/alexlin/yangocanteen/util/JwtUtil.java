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
        long time = 1000L * 60 * 60 * 24 * 30; // 设置30天过期

        JwtBuilder jwtBuilder = Jwts.builder();
        token = jwtBuilder
                // header
                .setHeaderParam("typ", "JWT")
                .setHeaderParam("alg", "HS256")
                // payload
                .claim("username", user.getUsername()) // 将用户名存入token
                .claim("password", user.getPassword()) // 将密码存入token
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
