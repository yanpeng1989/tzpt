/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.frame.util;

import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.Key;
import java.security.NoSuchAlgorithmException;
import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.KeyGenerator;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.SecretKeySpec;
import org.apache.log4j.Logger;

/**
 *
 * @author cyss210
 */
public class AES {

    private static Logger log = Logger.getLogger(AES.class);
    public static byte[] AES_PWD = "1234321099992222".getBytes();
    static final String algorithmStr = "AES/ECB/PKCS5Padding";
    static private KeyGenerator keyGen;
    static private Cipher cipher;
    static boolean isInited = false;

    //初始化  
    static private void init() {

        //初始化keyGen  
        try {
            keyGen = KeyGenerator.getInstance("AES");
        } catch (NoSuchAlgorithmException e) {
            // TODO Auto-generated catch block  
            log.warn(e);
        }
        keyGen.init(128);

        //初始化cipher  
        try {
            cipher = Cipher.getInstance(algorithmStr);
        } catch (NoSuchAlgorithmException e) {
            // TODO Auto-generated catch block  
            log.warn(e);
        } catch (NoSuchPaddingException e) {
            // TODO Auto-generated catch block  
            log.warn(e);
        }

        isInited = true;
    }

    public static byte[] GenKey() {
        if (!isInited)//如果没有初始化过,则初始化  
        {
            init();
        }
        return keyGen.generateKey().getEncoded();
    }

    public static byte[] encrypt(byte[] content, byte[] keyBytes) throws InvalidKeyException, IllegalBlockSizeException, BadPaddingException {
        byte[] encryptedText = null;

        if (!isInited)//为初始化  
        {
            init();
        }

        Key key = new SecretKeySpec(keyBytes, "AES");

        try {
            cipher.init(Cipher.ENCRYPT_MODE, key);
        } catch (InvalidKeyException e) {
            // TODO Auto-generated catch block  
            throw e;
        }

        try {
            encryptedText = cipher.doFinal(content);
        } catch (IllegalBlockSizeException e) {
            // TODO Auto-generated catch block  
            throw e;
        } catch (BadPaddingException e) {
            // TODO Auto-generated catch block  
            throw e;
        }

        return encryptedText;
    }

    //解密为byte[]  
    public static byte[] decrypt(byte[] content, byte[] keyBytes) throws IllegalBlockSizeException, InvalidKeyException, BadPaddingException {
        byte[] originBytes = null;
        if (!isInited) {
            init();
        }

        Key key = new SecretKeySpec(keyBytes, "AES");

        try {
            cipher.init(Cipher.DECRYPT_MODE, key);
        } catch (InvalidKeyException e) {
            // TODO Auto-generated catch block  
            throw e;
        }

        //解密  
        try {
            originBytes = cipher.doFinal(content);
        } catch (IllegalBlockSizeException e) {
            // TODO Auto-generated catch block  
            throw e;
        } catch (BadPaddingException e) {
            // TODO Auto-generated catch block  
            throw e;
        }

        return originBytes;
    }

    public static String encrypt(String str) throws Exception {
        byte[] content = str.getBytes("utf-8");
        byte[] enRes = encrypt(content, AES_PWD);
        return Base64.encode(enRes);
    }

    public static String decrypt(String str) throws Exception {
        byte[] content = Base64.decode(str);
        byte[] deRes = decrypt(content, AES_PWD);
        return new String(deRes, "utf-8");
    }
}
