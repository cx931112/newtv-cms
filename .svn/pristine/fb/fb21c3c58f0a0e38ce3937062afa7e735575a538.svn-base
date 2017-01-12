/*
 * 文 件 名:  SystemBasicController.java
 * 版    权:  Ysten Technologies Co., Ltd. Copyright YYYY-YYYY,  All rights reserved
 * 描    述:  <描述>
 * 修 改 人:  Administrator
 * 修改时间:  2014年2月25日
 * 跟踪单号:  <跟踪单号>
 * 修改单号:  <修改单号>
 * 修改内容:  <修改内容>
 */
package net.chinaott.cms.web.common.web;

import net.chinaott.cms.web.module.account.service.ShiroDbRealm.ShiroUser;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.context.request.WebRequest;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public abstract class BusinessBasicController
{






    /**
     * 取出Shiro中的当前用户.
     */
    public ShiroUser getCurrentUser()
    {
        ShiroUser user = (ShiroUser)SecurityUtils.getSubject().getPrincipal();
        return user;
    }




    /**
     * 实现前台日期类型的转换
     *
     * @param binder
     * @param request
     * @see [类、类#方法、类#成员]
     */
    @InitBinder
    public void initBinder(WebDataBinder binder, WebRequest request)
    {
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        CustomDateEditor dateEditor = new CustomDateEditor(format, true);
        binder.registerCustomEditor(Date.class, dateEditor);
    }


}
