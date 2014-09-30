/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cysoa.tzpt.service.pu.util;

import cn.com.nciic.www.IsSimpleCitizenExists;
import cn.com.nciic.www.IsSimpleCitizenExistsResponse;
import cn.com.nciic.www.ModifyPasswordByJson;
import cn.com.nciic.www.ModifyPasswordByJsonResponse;
import cn.com.nciic.www.QueryBalance;
import cn.com.nciic.www.QueryBalanceResponse;
import cn.com.nciic.www.QuerySimpleCitizenData;
import cn.com.nciic.www.QuerySimpleCitizenDataResponse;
import cn.com.nciic.www.SimpleCheckByJson;
import cn.com.nciic.www.SimpleCheckByJsonResponse;
import cn.com.nciic.www.service.IdentifierServiceStub;
import java.net.MalformedURLException;
import org.datacontract.schemas._2004._07.finance_epm.CheckRequest;
import org.datacontract.schemas._2004._07.finance_epm.CheckResponse;
import org.datacontract.schemas._2004._07.finance_epm.Credential;
import org.datacontract.schemas._2004._07.finance_epm.IdentifierData;
import org.datacontract.schemas._2004._07.finance_epm.IsExistsResponse;
 
    
import java.net.MalformedURLException;

import org.datacontract.schemas._2004._07.finance_epm.*;

import cn.com.nciic.www.*;

public class SfrzUtil {
	 public static void main(String[] args) throws MalformedURLException {
		String rzjg=simpleCheckByJson("412326198007241216", "孔繁玉", "zzbys_admin", "n33d2239");
                 System.out.println(rzjg.split("&")[0]+rzjg.split("&")[1]);
	} 

	/**
	 * 简项认证
	 * 
	 * @param info
	 * @param id5
	 * @return   姓名&生日
	 * @throws MalformedURLException
	 */
	public static String simpleCheckByJson(String idCardNum, String realName,
			String userName, String password) {
            String result="";
		try {
			String req = String.format("{\"IDNumber\":\"%s\",\"Name\":\"%s\"}",
					idCardNum, realName);
			String cred = String.format(
					"{\"UserName\":\"%s\",\"Password\":\"%s\"}", userName,
					password);

			IdentifierServiceStub client = new IdentifierServiceStub();

			SimpleCheckByJson scbj = new SimpleCheckByJson();
			scbj.setCred(cred);
			scbj.setRequest(req);

			SimpleCheckByJsonResponse scbr = client.simpleCheckByJson(scbj);

			 result = scbr.getSimpleCheckByJsonResult();

			 System.out.println("实名认证返回结果：" + result);
		} catch (Exception e) {
			e.printStackTrace();
		}
               
                if(result.indexOf("\"一致")>0){
                    String sex=result.indexOf("男性")>0?"男":"女";
                    String birthday=result.substring(result.indexOf("Birthday")+11, result.indexOf("Birthday")+21);
                   // System.out.println(sex+"_"+birthday);
                    return (sex+"&"+ birthday);
                }
                else{
                 return "";
                }
	}

	/**
	 * 查询剩余次数
	 * 
	 * @param id5
	 * @return
	 */
	public static void queryBalance(String userName, String password) {
		try {
			String req = "";
			String cred = String.format(
					"{\"UserName\":\"%s\",\"Password\":\"%s\"}", userName,
					password);

			IdentifierServiceStub client = new IdentifierServiceStub();

			QueryBalance qb = new QueryBalance();
			qb.setCred(cred);
			qb.setRequest(req);

			QueryBalanceResponse qbr = client.queryBalance(qb);

			String result = qbr.getQueryBalanceResult();

			//System.out.println("查询余额返回结果：" + result);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 修改密码
	 * 
	 * @return
	 */
	public static void modifyPasswordByJson(String userName, String password,
			String newPassword) {
		try {
			String req = String.format("{\"OrgPwd\":\"%s\",\"NewPwd\":\"%s\"}",
					"OrgPwd", newPassword);
			String cred = String.format(
					"{\"UserName\":\"%s\",\"Password\":\"%s\"}", userName,
					password);

			IdentifierServiceStub client = new IdentifierServiceStub();

			ModifyPasswordByJson mp = new ModifyPasswordByJson();
			mp.setCred(cred);
			mp.setRequest(req);

			ModifyPasswordByJsonResponse mpbjr = client
					.modifyPasswordByJson(mp);

			String result = mpbjr.getModifyPasswordByJsonResult();

			//System.out.println("修改密码返回结果：" + result);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 是否存在简项认证历史记录 如果存在则提取简项认证信息
	 * 
	 * @return
	 */
	public static void querySimpleCitizenData(String idCardNum,
			String realName, String userName, String password) {
		CheckResponse result = null;
		try {
			IdentifierServiceStub client = new IdentifierServiceStub();

			Credential credential = new Credential();
			credential.setUserName(userName);
			credential.setPassword(password);

			CheckRequest req = new CheckRequest();
			req.setIDNumber(idCardNum);
			req.setName(realName);

			IsSimpleCitizenExists isce = new IsSimpleCitizenExists();
			isce.setCred(credential);
			isce.setRequest(req);

			IsSimpleCitizenExistsResponse iscer = client
					.isSimpleCitizenExists(isce);

			IsExistsResponse ier = iscer.getIsSimpleCitizenExistsResult();

			if (ier.getIsExists() == true) {
				QuerySimpleCitizenData data = new QuerySimpleCitizenData();
				data.setCred(credential);
				data.setRequest(req);

				QuerySimpleCitizenDataResponse cr = client
						.querySimpleCitizenData(data);

				result = cr.getQuerySimpleCitizenDataResult();

				IdentifierData iden = result.getIdentifier();

				//System.out.println("提取简项认证历史记录返回结果：" + iden.getResult());
			} else {
				//System.out.println("不存在该用户信息!");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}

 
