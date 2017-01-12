package net.chinaott.cms.core.system.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * 
 * <按钮权限关联实体类>
 * 
 * @author Peter
 * @version [版本号, 2014年5月16日]
 * @see [相关类/方法]
 * @since [产品/模块版本]
 */
@Entity
@IdClass(RoleButtonRelPK.class)
@Table(name = "role_button_rel")
public class RoleButtonRel implements Serializable
{
    private static final long serialVersionUID = 1L;
    
    @Id
    private String buttonCode;
    
    @Id
    private Long roleId;
    
    @Column(name = "OPR_USERID")
    private Long oprUserId;

    @Column(name = "CREATE_TIME")
    private Date createTime;

    @Column(name = "UPDATE_TIME")
    private Date updateTime;
    
    public RoleButtonRel(){}
    

    public RoleButtonRel(String buttonCode, Long roleId, Long oprUserId, Date createTime, Date updateTime)
    {
        super();
        this.buttonCode = buttonCode;
        this.roleId = roleId;
        this.oprUserId = oprUserId;
        this.createTime = createTime;
        this.updateTime = updateTime;
    }


    public String getButtonCode()
    {
        return buttonCode;
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
    
    public Long getOprUserId()
    {
        return oprUserId;
    }
    
    public void setOprUserId(Long oprUserId)
    {
        this.oprUserId = oprUserId;
    }


    public Date getCreateTime()
    {
        return createTime;
    }


    public void setCreateTime(Date createTime)
    {
        this.createTime = createTime;
    }


    public Date getUpdateTime()
    {
        return updateTime;
    }


    public void setUpdateTime(Date updateTime)
    {
        this.updateTime = updateTime;
    }
    
    
}
