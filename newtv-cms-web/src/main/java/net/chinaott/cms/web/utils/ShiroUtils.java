package net.chinaott.cms.web.utils;

import net.chinaott.cms.web.module.account.service.ShiroDbRealm;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

public class ShiroUtils
{
  public static ShiroDbRealm.ShiroUser getUser()
  {
    return (ShiroDbRealm.ShiroUser)SecurityUtils.getSubject().getPrincipal();
  }

  public static Long getUserId()
  {
    return getUser().getId();
  }

  public static String getUserLoginName()
  {
    return getUser().getLoginName();
  }

  public static String getUserName()
  {
    return getUser().getName();
  }

  public static String getUserLoginIp()
  {
    Subject subject = SecurityUtils.getSubject();
    Session session = subject.getSession();
    return session.getHost();
  }

}