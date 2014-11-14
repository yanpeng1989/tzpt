<%-- 
    Document   : details
    Created on : 2014-11-12, 11:32:22
    Author     : cyss210
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="item-header">
    上传资料
</div>
<form>
    <label class="red-title">必要信息</label>
    <table class="detail-table">
        <thead>
            <tr>
                <th width="171">文件名称</th>
                <th width="111">状态</th>
                <th width="161">已上传文件</th>
                <th width="161">文件浏览</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>身份证（正面）</td>
                <td>
                    <c:if test="${out['id_copy_front'] eq null}">等待上传</c:if>
                    <c:if test="${out['id_copy_front'] != null}"><font color='green'>上传完成</font></c:if>
                    </td>
                    <td>
                    <c:if test="${out['id_copy_front'] != null}">
                        <label req_url="${out['id_copy_front']}" class="loan-check-img">查看</label>
                    </c:if>
                </td>
                <td>
                    <input id="id_copy_front" name="id_copy_front" type="file" accept=".jpg,.jpeg,.png" req_url="${out['id_copy_front']}" />
                </td>
            </tr>
            <tr>
                <td>身份证（反面）</td>
                <td>
                    <c:if test="${out['id_copy_back'] eq null}">等待上传</c:if>
                    <c:if test="${out['id_copy_back'] != null}"><font color='green'>上传完成</font></c:if>
                    </td>
                    <td>
                    <c:if test="${out['id_copy_back'] != null}">
                        <label req_url="${out['id_copy_back']}" class="loan-check-img">查看</label>
                    </c:if>
                </td>
                <td><input id="id_copy_back" name="id_copy_back" type="file" accept=".jpg,.jpeg,.png" req_url="${out['id_copy_back']}" /></td>
            </tr>
            <tr>
                <td>征信记录</td>
                <td>
                    <c:if test="${out['credit_statement'] eq null}">等待上传</c:if>
                    <c:if test="${out['credit_statement'] != null}"><font color='green'>上传完成</font></c:if>
                    </td>
                    <td>
                    <c:if test="${out['credit_statement'] != null}">
                        <label req_url="${out['credit_statement']}" class="loan-check-img">查看</label>
                    </c:if>
                </td>
                <td><input id="credit_statement" name="credit_statement" type="file" accept=".jpg,.jpeg,.png" req_url="${out['credit_statement']}" /></td>
            </tr>
            <tr>
                <td>收入证明</td>
                <td>
                    <c:if test="${out['bank_statement'] eq null}">等待上传</c:if>
                    <c:if test="${out['bank_statement'] != null}"><font color='green'>上传完成</font></c:if>
                    </td>
                    <td>
                    <c:if test="${out['bank_statement'] != null}">
                        <label req_url="${out['bank_statement']}" class="loan-check-img">查看</label>
                    </c:if>
                </td>
                <td><input id="bank_statement" name="bank_statement" type="file" accept=".jpg,.jpeg,.png" req_url="${out['bank_statement']}" /></td>
            </tr>
            <tr>
                <td>工作证明</td>
                <td>
                    <c:if test="${out['job_statement'] eq null}">等待上传</c:if>
                    <c:if test="${out['job_statement'] != null}"><font color='green'>上传完成</font></c:if>
                    </td>
                    <td>
                    <c:if test="${out['job_statement'] != null}">
                        <label req_url="${out['job_statement']}" class="loan-check-img">查看</label>
                    </c:if>
                </td>
                <td><input id="job_statement" name="job_statement" type="file" accept=".jpg,.jpeg,.png" req_url="${out['job_statement']}" /></td>
            </tr>
        </tbody>
    </table>
    <label class="red-title">可选信息</label>
    <table class="detail-table">
        <thead>
            <tr>
                <th width="171">文件名称</th>
                <th width="111">状态</th>
                <th width="161">已上传文件</th>
                <th width="161">文件浏览</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>房产认证</td>
                <td>
                    <c:if test="${out['house_card_copy'] eq null}">等待上传</c:if>
                    <c:if test="${out['house_card_copy'] != null}"><font color='green'>上传完成</font></c:if>
                    </td>
                    <td>
                    <c:if test="${out['house_card_copy'] != null}">
                        <label req_url="${out['house_card_copy']}" class="loan-check-img">查看</label>
                    </c:if>
                </td>
                <td><input id="house_card_copy" name="house_card_copy" type="file" accept=".jpg,.jpeg,.png" req_url="${out['house_card_copy']}" /></td>
            </tr>
            <tr>
                <td>学历认证</td>
                <td>
                    <c:if test="${out['graduation'] eq null}">等待上传</c:if>
                    <c:if test="${out['graduation'] != null}"><font color='green'>上传完成</font></c:if>
                    </td>
                    <td>
                    <c:if test="${out['graduation'] != null}">
                        <label req_url="${out['graduation']}" class="loan-check-img">查看</label>
                    </c:if>
                </td>
                <td><input id="graduation" name="graduation" type="file" accept=".jpg,.jpeg,.png" req_url="${out['graduation']}" /></td>
            </tr>
            <tr>
                <td>婚姻认证</td>
                <td>
                    <c:if test="${out['married_card'] eq null}">等待上传</c:if>
                    <c:if test="${out['married_card'] != null}"><font color='green'>上传完成</font></c:if>
                    </td>
                    <td>
                    <c:if test="${out['married_card'] != null}">
                        <label req_url="${out['married_card']}" class="loan-check-img">查看</label>
                    </c:if>
                </td>
                <td><input id="married_card" name="married_card" type="file" accept=".jpg,.jpeg,.png" req_url="${out['married_card']}" /></td>
            </tr>
            <tr>
                <td>其他资产证明</td>
                <td>
                    <c:if test="${out['rests'] eq null}">等待上传</c:if>
                    <c:if test="${out['rests'] != null}"><font color='green'>上传完成</font></c:if>
                    </td>
                    <td>
                    <c:if test="${out['rests'] != null}">
                        <label req_url="${out['rests']}" class="loan-check-img">查看</label>
                    </c:if>
                </td>
                <td><input id="rests" name="rests" type="file" accept=".jpg,.jpeg,.png" req_url="${out['rests']}" /></td>
            </tr>
            <tr>
                <td>户口认证</td>
                <td>
                    <c:if test="${out['birth'] eq null}">等待上传</c:if>
                    <c:if test="${out['birth'] != null}"><font color='green'>上传完成</font></c:if>
                    </td>
                    <td>
                    <c:if test="${out['birth'] != null}">
                        <label req_url="${out['birth']}" class="loan-check-img">查看</label>
                    </c:if>
                </td>
                <td><input id="birth" name="birth" type="file" accept=".jpg,.jpeg,.png" req_url="${out['birth']}" /></td>
            </tr>
            <tr>
                <td>水电费单</td>
                <td>
                    <c:if test="${out['utility_bills'] eq null}">等待上传</c:if>
                    <c:if test="${out['utility_bills'] != null}"><font color='green'>上传完成</font></c:if>
                    </td>
                    <td>
                    <c:if test="${out['utility_bills'] != null}">
                        <label req_url="${out['utility_bills']}" class="loan-check-img">查看</label>
                    </c:if>
                </td>
                <td><input id="utility_bills" name="utility_bills" type="file" accept=".jpg,.jpeg,.png" req_url="${out['utility_bills']}" /></td>
            </tr>
            <tr>
                <td>电话费单</td>
                <td>
                    <c:if test="${out['tel_bills'] eq null}">等待上传</c:if>
                    <c:if test="${out['tel_bills'] != null}"><font color='green'>上传完成</font></c:if>
                    </td>
                    <td>
                    <c:if test="${out['tel_bills'] != null}">
                        <label req_url="${out['tel_bills']}" class="loan-check-img">查看</label>
                    </c:if>
                </td>
                <td><input id="tel_bills" name="tel_bills" type="file" accept=".jpg,.jpeg,.png" req_url="${out['tel_bills']}" /></td>
            </tr>
            <tr>
                <td>其他认证材料</td>
                <td>
                    <c:if test="${out['others'] eq null}">等待上传</c:if>
                    <c:if test="${out['others'] != null}"><font color='green'>上传完成</font></c:if>
                    </td>
                    <td>
                    <c:if test="${out['others'] != null}">
                        <label req_url="${out['others']}" class="loan-check-img">查看</label>
                    </c:if>
                </td>
                <td><input id="others" name="others" type="file" accept=".jpg,.jpeg,.png" req_url="${out['others']}" /></td>
            </tr>
        </tbody>
    </table>
    <input id="p_detail_save_btn" class="button button-flat-royal" style="margin-top: 10px;" type="button" value="提交申请" />
</form>
<div id="loan_img_modal" class="modal fade">
    <div class="modal-dialog">
        <img id="loan_img_pre" />
    </div>
</div>