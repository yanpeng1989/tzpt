/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.tzpt.service.pu.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author long
 */
public class LoanModelUtil {
    public static double rate=0.0075; 
    public static double tenderate=0.08;
    public static double getEverySum(double cash,double fqcount){ 
        double P;   
        P=cash*rate* Math.pow((1+rate),fqcount)/(Math.pow((1+rate),fqcount)-1) ;
        P=Math.rint(P); /*
         double  bj=cash;
         double  hkbj=0;
         double  hklx=0;
        for(int i=1;i<=fqcount;i++){
         bj= bj-hkbj;
         hklx=Math.rint(bj*rate);
         hkbj=Math.rint(P-hklx);
         System.out.println(i+":"+"bj:"+bj+" hkbj:"+hkbj+" hklx:"+hklx);
        }*/
        return P;   
    } 
    
      public static List loanmodel(double cash,int fqcount){ 
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
      public static void main(String args[]){
      loanmodel(10000,12);
      }
}
