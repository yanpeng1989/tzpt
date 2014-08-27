/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.frame.service.impl;

import com.cysoa.frame.exception.CustomException;
import java.util.Map;

/**
 *
 * @author cyss210
 */
public interface UniversalServiceInterface {
    public abstract void execute(Map<String, Object> in, Map<String, Object> inHead, Map<String, Object> out, Map<String, Object> outHead) throws CustomException;
}
