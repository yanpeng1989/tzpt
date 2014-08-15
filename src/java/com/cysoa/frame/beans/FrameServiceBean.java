/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.frame.beans;

import java.io.Serializable;

/**
 *
 * @author cyss210
 */
public class FrameServiceBean implements Serializable{
    private String serviceCode;
    private String beanName;
    private String isLogin;
    private String channel;
    private String desc;

    /**
     * @return the serviceCode
     */
    public String getServiceCode() {
        return serviceCode;
    }

    /**
     * @param serviceCode the serviceCode to set
     */
    public void setServiceCode(String serviceCode) {
        this.serviceCode = serviceCode;
    }

    /**
     * @return the beanName
     */
    public String getBeanName() {
        return beanName;
    }

    /**
     * @param beanName the beanName to set
     */
    public void setBeanName(String beanName) {
        this.beanName = beanName;
    }

    /**
     * @return the isLogin
     */
    public String getIsLogin() {
        return isLogin;
    }

    /**
     * @param isLogin the isLogin to set
     */
    public void setIsLogin(String isLogin) {
        this.isLogin = isLogin;
    }

    /**
     * @return the channel
     */
    public String getChannel() {
        return channel;
    }

    /**
     * @param channel the channel to set
     */
    public void setChannel(String channel) {
        this.channel = channel;
    }

    /**
     * @return the desc
     */
    public String getDesc() {
        return desc;
    }

    /**
     * @param desc the desc to set
     */
    public void setDesc(String desc) {
        this.desc = desc;
    }
    
    
}
