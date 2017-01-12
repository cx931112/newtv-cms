package net.chinaott.cms.core.system.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * <系统菜单实体类>
 * 
 * @author liwei
 * @version [版本号, 2014年2月28日]
 */
@Entity
@Table(name = "menu")
public class SysMenu implements Serializable
{
    private static final long serialVersionUID = 1L;
    
    @Id
    @Column(name = "MENU_ID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(name = "MENU_NAME")
    private String name;
    
    @Column(name = "MENU_ALIAS")
    private String alias;
    
    @Column(name = "MENU_DESC")
    private String description;
    
    @Column(name = "MENU_LINK")
    private String link;
    
    @Column(name = "MENU_SORTNUM")
    private Integer sort;
    
    @JsonProperty("parentId")
    @Column(name = "MENU_PARENTID")
    private Long parentId;
    
    @Column(name = "OPR_USERID")
    private Long oprUserId;
    
    @Column(name = "CREATE_TIME")
    private Date createTime;
    
    @Column(name = "UPDATE_TIME")
    private Date updateTime;
    
    @JsonIgnore
    @Transient
    private List<SysMenu> childMenus;
    
    @JsonIgnore
    @OneToMany(mappedBy = "menu", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private List<Button> childButton;
    
    @Transient
    private boolean checked;
    
    @Transient
    private String state;
    
    @OneToOne(fetch = FetchType.LAZY, optional = true)
    @NotFound(action = NotFoundAction.IGNORE)
    @JoinColumn(name = "MENU_PARENTID", referencedColumnName = "MENU_ID", insertable = false, updatable = false)
    @JsonIgnore
    private SysMenu sysMenu;
    
    /**
     * @return 返回 sysMenu
     */
    public SysMenu getSysMenu()
    {
        return sysMenu;
    }
    
    /**
     * @param 对sysMenu进行赋值
     */
    public void setSysMenu(SysMenu sysMenu)
    {
        this.sysMenu = sysMenu;
    }
    
    public Long getOprUserId()
    {
        return oprUserId;
    }
    
    public void setOprUserId(Long oprUserId)
    {
        this.oprUserId = oprUserId;
    }
    
    public boolean isChecked()
    {
        return checked;
    }
    
    public void setChecked(boolean checked)
    {
        this.checked = checked;
    }
    
    public List<SysMenu> getChildMenus()
    {
        return childMenus;
    }
    
    public void setChildMenus(List<SysMenu> childMenus)
    {
        this.childMenus = childMenus;
    }
    
    public Integer getSort()
    {
        return sort;
    }
    
    public void setSort(Integer sort)
    {
        this.sort = sort;
    }
    
    public Long getParentId()
    {
        return parentId;
    }
    
    public void setParentId(Long parentId)
    {
        this.parentId = parentId;
    }
    
    public String getName()
    {
        return name;
    }
    
    public void setName(String name)
    {
        this.name = name;
    }
    
    public String getAlias()
    {
        return alias;
    }
    
    public void setAlias(String alias)
    {
        this.alias = alias;
    }
    
    public String getDescription()
    {
        return description;
    }
    
    public void setDescription(String description)
    {
        this.description = description;
    }
    
    public String getLink()
    {
        return link;
    }
    
    public void setLink(String link)
    {
        this.link = link;
    }
    
    public Date getCreateTime()
    {
        return createTime;
    }
    
    public void setCreateTime(Date createTime)
    {
        this.createTime = createTime;
    }
    
    public Long getId()
    {
        return id;
    }
    
    public void setId(Long id)
    {
        this.id = id;
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
    
    public List<Button> getChildButton()
    {
        return childButton;
    }
    
    public void setChildButton(List<Button> childButton)
    {
        this.childButton = childButton;
    }
    
    public String getState()
    {
        if (0 == this.getParentId())
            return "closed";
        return null;
    }
    
    public void setState(String state)
    {
        this.state = state;
    }
    
}