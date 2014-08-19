/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.frame.util;

import cn.emay.sdk.client.api.Client;
import com.cysoa.frame.listener.FrameContextListener;
import org.apache.log4j.Logger;

/**
 *
 * @author cyss210
 */
public class EmayFactory {

    private static Logger log = Logger.getLogger(EmayFactory.class);
    private static Client client;

    public static synchronized Client getEmayClient() {
        if (client == null) {
            try {
                client = new Client(GlobalUtil.getSysConfig("sms_serial"), GlobalUtil.getSysConfig("sms_key"));
            } catch (Exception ex) {
                log.error("短信接口创建失败", ex);
            }
        }
        return client;
    }

    public static void destroyClient() {
        if (client != null) {
            try {
                client.closeRemoteSocket();
            } catch (Exception e) {
                log.warn("关闭亿美短信接口异常：" + e);
            }
            try {
                client.closeSocketConnect();
            } catch (Exception e) {
                log.warn("关闭亿美短信接口异常：" + e);
            }
        }
    }
}
