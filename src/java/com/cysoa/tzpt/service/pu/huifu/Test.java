/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.tzpt.service.pu.huifu;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;

/**
 *
 * @author long
 */
public class Test {
    public static void main(String args[]){
      Date dt = new Date();   
    //最后的aa表示“上午”或“下午”    HH表示24小时制    如果换成hh表示12小时制   
    SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");   
    String temp_str=sdf.format(dt);   
    System.out.println(temp_str);
    double cash,Benxi,rate;
    int year;   
    System.out.println("---------------等额本息还款计算--------------"); 
    System.out.print("请输入本金：");   
    cash=10000;
     System.out.println("请输入利率：");   
     rate=0.0075;
     System.out.println("请输入贷款年限：");  
     year=12;
     Benxi=Count(cash,rate,year);   
     System.out.println("商业性贷款"+cash+"元"+"贷款年限为"+year+",每月等额 还本付息额为："+Benxi);   
    }
    public static double Count(double cash,double rate,double fqcount){ 
        double P;   
        P=cash*rate* Math.pow((1+rate),fqcount)/(Math.pow((1+rate),fqcount)-1) ;
        P=Math.rint(P); 
         double  bj=cash;
         double  hkbj=0;
         double  hklx=0;
        for(int i=1;i<=fqcount;i++){
         bj= bj-hkbj;
         hklx=Math.rint(bj*rate);
         hkbj=Math.rint(P-hklx);
         System.out.println(i+":"+"bj:"+bj+" hkbj:"+hkbj+" hklx:"+hklx);
        }
        return P;   
    } 
    
      public static List loanmodel(double cash,double rate,double fqcount){ 
        List ls=new ArrayList();
        double P;   
        P=cash*rate* Math.pow((1+rate),fqcount)/(Math.pow((1+rate),fqcount)-1) ;
        P=Math.rint(P); 
         double  bj=cash;
         double  hkbj=0;
         double  hklx=0;
         for(int i=1;i<=fqcount;i++){
         Map tempM=new HashMap();
         bj= bj-hkbj;
         hklx=Math.rint(bj*rate);
         hkbj=Math.rint(P-hklx);
         System.out.println(i+":"+"bj:"+bj+" hkbj:"+hkbj+" hklx:"+hklx);
         tempM.put("surplus",bj  );
         tempM.put("capital",hkbj  );
         tempM.put("interest",hklx  );
         tempM.put("sum",P );
         ls.add(tempM);
        } 
        return ls;   
    } 
}
