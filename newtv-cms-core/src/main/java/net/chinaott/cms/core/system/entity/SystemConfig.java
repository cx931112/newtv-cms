package net.chinaott.cms.core.system.entity;

import org.apache.commons.lang3.builder.ToStringBuilder;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * <系统配置项实体类>
 * 
 * @author  chenc
 * @version  [版本号, 2014年2月13日]
 * @see  [相关类/方法]
 * @since  [产品/模块版本]
 */
@Entity
@Table(name = "system_config")
public class SystemConfig implements Serializable
{
    private static final long serialVersionUID = 2602884953091041657L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "CONFIG_ID")
    private Long configId;
    
    @Column(name = "CONFIG_NAME")
    private String configName;
    
    @Column(name = "CONFIG_DESC")
    private String configDesc;
    
    @Column(name = "CONFIG_VALUE")
    private String configValue;
    
    @Column(name = "OPR_USERID")
    private Long oprUserId;
    
    @Column(name = "CREATE_TIME")
    private Date createTime;
    
    @Column(name = "UPDATE_TIME")
    private Date updateTime;

    public Long getConfigId()
    {
        return configId;
    }

    public void setConfigId(Long configId)
    {
        this.configId = configId;
    }

    public String getConfigName()
    {
        return configName;
    }

    public void setConfigName(String configName)
    {
        this.configName = configName;
    }

    public String getConfigDesc()
    {
        return configDesc;
    }

    public void setConfigDesc(String configDesc)
    {
        this.configDesc = configDesc;
    }

    public String getConfigValue()
    {
        return configValue;
    }

    public void setConfigValue(String configValue)
    {
        this.configValue = configValue;
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
