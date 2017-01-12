package net.chinaott.cms.core.system.entity;

import javax.persistence.Column;
import java.io.Serializable;

/**
 * 
 * 按钮权限联合主键 <功能详细描述>
 * 
 * @author Peter
 * @version [版本号, 2014年5月16日]
 * @see [相关类/方法]
 * @since [产品/模块版本]
 */
public class RoleButtonRelPK implements Serializable
{
    private static final long serialVersionUID = 1L;
    @Column(name="BUTTON_CODE",updatable=true)
    private String buttonCode;
    
    private Long roleId;
    
    public String getButtonCode()
    {
        return buttonCode;
    }
    
    public RoleButtonRelPK()
    {
        super();
    }

    public RoleButtonRelPK(String buttonCode, Long roleId)
    {
        super();
        this.buttonCode = buttonCode;
        this.roleId = roleId;
    }

    public void setButtonCode(String buttonCode)
    {
        this.buttonCode = buttonCode;
    }
    
    public Long getRoleId()
    {
        return roleId;
    }
    
    public void setRoleId(Long roleId)
    {
        this.roleId = roleId;
    }
    
}
