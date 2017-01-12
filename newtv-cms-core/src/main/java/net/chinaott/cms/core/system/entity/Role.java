package net.chinaott.cms.core.system.entity;

import org.apache.commons.lang3.builder.ToStringBuilder;

import javax.persistence.*;
import java.util.Date;

//JPA标识
@Entity
@Table(name = "role")
public class Role
{
    @Id
    @Column(name = "ROLE_ID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(name = "ROLE_NAME")
    private String name;
    
    @Column(name = "ROLE_DESC")
    private String description;
    
    @Column(name = "OPR_USERID")
    private Long oprUserId;
    
    @Column(name = "CREATE_TIME")
    private Date createTime;
    
    @Column(name = "UPDATE_TIME")
    private Date updateTime;
    
    public Long getId()
    {
        return id;
    }
    
    public void setId(Long id)
    {
        this.id = id;
    }
    
    /**
     * @return 返回 name
     */
    public String getName()
    {
        return name;
    }
    
    /**
     * @param 对name进行赋值
     */
    public void setName(String name)
    {
        this.name = name;
    }
    
    /**
     * @return 返回 description
     */
    public String getDescription()
    {
        return description;
    }
    
    /**
     * @param 对description进行赋值
     */
    public void setDescription(String description)
    {
        this.description = description;
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
    
    public Long getOprUserId()
    {
        return oprUserId;
    }
    
    public void setOprUserId(Long oprUserId)
    {
        this.oprUserId = oprUserId;
    }
    
    @Override
    public String toString()
    {
        return ToStringBuilder.reflectionToString(this);
    }
}