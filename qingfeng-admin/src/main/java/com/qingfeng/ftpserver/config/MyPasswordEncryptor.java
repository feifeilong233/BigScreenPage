package com.qingfeng.ftpserver.config;

/**
 * @author Administrator
 * @version 1.0.0
 * @ProjectName finder-module-ftpserver
 * @Description TODO
 * @createTime 2022年04月21日 09:34:00
 */
import at.favre.lib.crypto.bcrypt.BCrypt;
import org.apache.ftpserver.usermanager.PasswordEncryptor;

import java.security.NoSuchAlgorithmException;

public class MyPasswordEncryptor implements PasswordEncryptor {
    public MyPasswordEncryptor() {
    }

    public String encrypt(String password) {
        String bcryptString = BCrypt.with(BCrypt.Version.VERSION_2Y).hashToString(10, password.toCharArray());
        System.out.println(bcryptString);
        return bcryptString;
    }

    public boolean matches(String passwordToCheck, String storedPassword) {
        System.out.println("--------------matches-------------");
        System.out.println(passwordToCheck);
        System.out.println(storedPassword);
        if (storedPassword == null) {
            throw new NullPointerException("storedPassword can not be null");
        } else if (passwordToCheck == null) {
            throw new NullPointerException("passwordToCheck can not be null");
        } else {
            BCrypt.Result result = BCrypt.verifyer().verify(passwordToCheck.toCharArray(), storedPassword);
//            return this.encrypt(passwordToCheck).equalsIgnoreCase(storedPassword);
            return result.verified;
        }
    }


    public static void main(String[] args) throws NoSuchAlgorithmException {
        String bcryptString = BCrypt.with(BCrypt.Version.VERSION_2Y).hashToString(10, "123456".toCharArray());
        System.out.println(bcryptString);
    }
}
