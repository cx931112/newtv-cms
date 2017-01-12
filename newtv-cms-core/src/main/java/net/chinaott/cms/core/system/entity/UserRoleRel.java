/*
 * 文 件 名:  UserRoleRel.java
 * 版    权:  Ysten Technologies Co., Ltd. Copyright YYYY-YYYY,  All rights reserved
 * 描    述:  <描述>
 * 修 改 人:  Administrator
 * 修改时间:  2013年12月13日
 * 跟踪单号:  <跟踪单号>
 * 修改单号:  <修改单号>
 * 修改内容:  <修改内容>
 */
package net.chinaott.cms.core.system.entity;

import org.apache.commons.lang3.builder.ToStringBuilder;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

/**
 * <用户 角色关系表>
 * 
 * @author liw
 * @version [1.0, 2013年12月13日]
 */
@Entity
@Table(name = "user_role_rel")
public class UserRoleRel implements Serializable
{
    private static final long serialVersionUID = -5642256333944208676L;
    
    @Id
    @Column(name = "USER_ID")
    private Long userId;
    
    @Column(name = "ROLE_ID")
    private Long roleId;
    
    public Long getUserId()
    {
        return userId;
    }
    
    public void setUserId(Long userId)
    {
        this.userId = userId;
    }
    
    public Long getRoleId()
    {
        return roleId;
    }
    
    public void setRoleId(Long roleId)
    {
        this.roleId = roleId;
    }
    
    @Override
    public String toString()
    {
        return ToStringBuilder.reflectionToString(this);
    }
}