package net.chinaott.cms.web.log.entity;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.hibernate.annotations.Formula;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * 操作日志实体类
 * @author chenc
 * @version [版本号, 2014年3月27日]
 * @see [相关类/方法]
 * @since [产品/模块版本]
 */
@Entity
@Table(name = "log_operation")
public class OperationLog implements Serializable
{
    private static final long serialVersionUID = -425210115442287931L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "LOG_ID")
    private Long logId;

    /**
     * 日志内容，由其他字段拼接而成
     */
    @Column(name = "LOG_CONTENT")
    private String logContent;

    /**
     * 日志记录时间
     */
    @Column(name = "LOG_TIME")
    private Date logTime;

    /**
     * 操作数据主键
     */
    @Column(name = "OPR_DATA_ID")
    private String oprDataId;

    /**
     * 操作数据类型
     */
    @Column(name = "OPR_DATA_TYPE")
    private String oprDataType;

    /**
     * 操作类型
     */
    @Column(name = "OPR_TYPE")
    private String oprType;

    @Formula(value = "(select cs.name from system_dic cs where cs.type='OPR_TYPE' and cs.value=OPR_TYPE )")
    private String oprName;

    /**
     * 操作用户Id
     */
    @Column(name = "OPR_USER_ID")
    private String oprUserId;

    /**
     * 操作用户名称
     */
    @Column(name = "OPR_USER_NAME")
    private String oprUserName;

    public Long getLogId()
    {
        return logId;
    }

    public void setLogId(Long logId)
    {
        this.logId = logId;
    }

    public String getLogContent()
    {
        return logContent;
    }

    public void setLogContent(String logContent)
    {
        this.logContent = logContent;
    }

    public Date getLogTime()
    {
        return logTime;
    }

    public void setLogTime(Date logTime)
    {
        this.logTime = logTime;
    }

    public String getOprDataId()
    {
        return oprDataId;
    }

    public void setOprDataId(String oprDataId)
    {
        this.oprDataId = oprDataId;
    }

    public String getOprDataType()
    {
        return oprDataType;
    }

    public void setOprDataType(String oprDataType)
    {
        this.oprDataType = oprDataType;
    }

    public String getOprType()
    {
        return oprType;
    }

    public void setOprType(String oprType)
    {
        this.oprType = oprType;
    }

    public String getOprName()
    {
        return oprName;
    }

    public void setOprName(String oprName)
    {
        this.oprName = oprName;
    }

    public String getOprUserId()
    {
        return oprUserId;
    }

    public void setOprUserId(String oprUserId)
    {
        this.oprUserId = oprUserId;
    }

    public String getOprUserName()
    {
        return oprUserName;
    }

    public void setOprUserName(String oprUserName)
    {
        this.oprUserName = oprUserName;
    }

    @Override
    public String toString()
    {
        return ToStringBuilder.reflectionToString(this);
    }
}
