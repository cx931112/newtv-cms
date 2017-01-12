package net.chinaott.cms.web.module.account.service;

import net.chinaott.cms.web.utils.ShiroUtils;
import org.springframework.data.domain.AuditorAware;

public class ShiroAuditorAware
implements AuditorAware<Long>
{
public Long getCurrentAuditor()
{
  try
  {
    return ShiroUtils.getUserId(); } catch (Exception e) {
  }
  return Long.valueOf(-1L);
}
}
