package net.chinaott.cms.core.system.entity;

import org.apache.commons.lang3.builder.ToStringBuilder;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "SYSTEM_DIC")
public class SystemDic implements Serializable
{
    private static final long serialVersionUID = 1L;
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long ioid;
    
    @Column(name = "TYPE")
    private String type;
    
    @Column(name = "NAME")
    private String name;
    
    @Column(name = "VALUE")
    private String value;
    
    @Column(name = "DESCRIPTION")
    private String desc;
    
    @Column(name = "SORT_NUM")
    private Integer sortNum;
    
    /**
     * 创建时间
     */
    private Date createTime;
    
    /**
     * 状态更改时间
     */
    private Date updateTime;
    
    public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public Long getIoid()
    {
        return ioid;
    }
    
    public void setIoid(Long ioid)
    {
        this.ioid = ioid;
    }
    
    public String getDesc()
    {
        return desc;
    }
    
    public void setDesc(String desc)
    {
        this.desc = desc;
    }
    
    public Integer getSortNum()
    {
        return sortNum;
    }
    
    public void setSortNum(Integer sortNum)
    {
        this.sortNum = sortNum;
    }
    
    public SystemDic()
    {
    }
    
    public SystemDic(String value)
    {
        this.value = value;
    }
    
    @Override
    public String toString()
    {
        return ToStringBuilder.reflectionToString(this);
    }
    
    public String getType()
    {
        return type;
    }
    
    public void setType(String type)
    {
        this.type = type;
    }
    
    public String getName()
    {
        return name;
    }
    
    public void setName(String name)
    {
        this.name = name;
    }
    
    public String getValue()
    {
        return value;
    }
    
    public void setValue(String value)
    {
        this.value = value;
    }
}
