package net.chinaott.cms.core.system.entity;

import org.apache.commons.lang3.builder.ToStringBuilder;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

/**
 * <角色-菜单关系表> <实体类>
 * 
 * @author liwei
 * @version [1.0, 2013-11-29]
 */
@Entity
@Table(name = "role_menu_rel")
public class RoleMenuRel implements Serializable
{
    private static final long serialVersionUID = -5924532631770170659L;

    @Column(name = "MENU_ID")
    private Long menuId;
    
    @Id
    @Column(name = "ROLE_ID")
    private Long roleId;

    @Column(name = "OPR_USERID")
    private Long oprUserId;

    @Column(name = "CREATE_TIME")
    private Date createTime;

    @Column(name = "UPDATE_TIME")
    private Date updateTime;
    
    public Long getMenuId()
    {
        return menuId;
    }
    
    public void setMenuId(Long menuId)
    {
        this.menuId = menuId;
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
    
    @Override
    public String toString()
    {
        return ToStringBuilder.reflectionToString(this);
    }
}