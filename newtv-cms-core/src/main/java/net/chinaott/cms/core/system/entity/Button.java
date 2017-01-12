package net.chinaott.cms.core.system.entity;

import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * 按钮实体类
 * 
 * @author Peter
 * @version [版本号, 2014年5月16日]
 * @see [相关类/方法]
 * @since [产品/模块版本]
 */
@Entity
@Table(name = "button")
public class Button implements Serializable
{
    private static final long serialVersionUID = 1L;
    
    @Id
    private String buttonCode;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MENU_ID")
    @NotFound(action = NotFoundAction.IGNORE)
    private SysMenu menu;
    
    private String buttonName;
    
    private String buttonDesc;
    
    @Column(name = "OPR_USERID")
    private Long oprUserId;
    
    private Date createTime;
    
    private Date updateTime;
    
    @Transient
    private boolean checked;
    
    public String getButtonCode()
    {
        return buttonCode;
    }
    
    public void setButtonCode(String buttonCode)
    {
        this.buttonCode = buttonCode;
    }
    
    public SysMenu getMenu()
    {
        return menu;
    }
    
    public void setMenu(SysMenu menu)
    {
        this.menu = menu;
    }
    
    public String getButtonName()
    {
        return buttonName;
    }
    
    public void setButtonName(String buttonName)
    {
        this.buttonName = buttonName;
    }
    
    public String getButtonDesc()
    {
        return buttonDesc;
    }
    
    public void setButtonDesc(String buttonDesc)
    {
        this.buttonDesc = buttonDesc;
    }
    
    public boolean isChecked()
    {
        return checked;
    }
    
    public void setChecked(boolean checked)
    {
        this.checked = checked;
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
