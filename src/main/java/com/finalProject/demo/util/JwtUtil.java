package com.finalProject.demo.util;

import io.jsonwebtoken.*;
import io.jsonwebtoken.io.Decoders;
import io.jsonwebtoken.security.Keys;
import org.springframework.stereotype.Service;

import javax.crypto.SecretKey;
import java.util.Date;


@Service
public class JwtUtil {

    public   static final long EXPIRE = 24*60*60;//有效期限24hr
    public static final String TOKEN_SECRET = "####fjridldlssssmxjxhdheudkjdlkfoekejshxkcldddldjkrhnzmalllalalkorea####";//私鑰保存在Server
    public static final String TOKEN_SECRET_PWD = "####HEYTHErfkeosksiwjddhfudndddddjcjdisjsllseaWELCOMETOCHEZMOIWebForgotPwD####";
    /**
     *
     * @param email
     * @param name
     * @return
     */
    public static String getUserJwtToken(String email, String name, Long id){


        byte[] key = Decoders.BASE64.decode((TOKEN_SECRET));
        SecretKey secretKey = Keys.hmacShaKeyFor(key);
        return Jwts.builder()
                .setHeaderParam("typ","JWT")//標頭
                .setHeaderParam("alg","HS256")
                .setSubject(name)
                .setIssuedAt(new Date())
                .setExpiration(new Date(System.currentTimeMillis()+EXPIRE))
                .claim("name",name)
                .claim("id",id)
                .claim("role","user")
                .signWith(secretKey,SignatureAlgorithm.HS256)
                .compact();
    }

    public static String getManagerJwtToken(String email, String name, Long id){


        byte[] key = Decoders.BASE64.decode((TOKEN_SECRET));
        SecretKey secretKey = Keys.hmacShaKeyFor(key);
        return Jwts.builder()
                .setHeaderParam("typ","JWT")//標頭
                .setHeaderParam("alg","HS256")
                .setSubject(name)
                .setIssuedAt(new Date())
                .setExpiration(new Date(System.currentTimeMillis()+EXPIRE))
                .claim("name",name)
                .claim("id",id)
                .claim("role","manager")
                .signWith(secretKey,SignatureAlgorithm.HS256)
                .compact();
    }

    public static String getJwtTokenfpd(String email, String name, Long id,String authorizationToken){


        byte[] key = Decoders.BASE64.decode((TOKEN_SECRET_PWD));
        SecretKey secretKey = Keys.hmacShaKeyFor(key);
        return Jwts.builder()
                .setHeaderParam("typ","JWT")//標頭
                .setHeaderParam("alg","HS256")
                .setSubject(name)
                .setIssuedAt(new Date())
                .setExpiration(new Date(System.currentTimeMillis()+EXPIRE))
                .claim("name",name)
                .claim("id",id)
                .claim("role","manager")
                .claim("Authorization",authorizationToken)
                .signWith(secretKey,SignatureAlgorithm.HS256)
                .compact();
    }

    public static Claims verify(String token) throws JwtException{
            Jws<Claims> claimsJws = Jwts
                    .parserBuilder()
                    .setSigningKey(TOKEN_SECRET)
                    .build()
                    .parseClaimsJws(token);
            return claimsJws.getBody();

    }






}
