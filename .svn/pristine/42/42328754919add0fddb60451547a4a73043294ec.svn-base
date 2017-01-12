package net.chinaott.cms.core.system.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.google.common.collect.ImmutableList;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "user")
public class User    implements Serializable
{
	@Id
	@Column(name = "USER_ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "LOGIN_NAME")
	private String loginName;

	@Column(name = "USER_NAME")
	private String name;

	// 不持久化到数据库，也不显示在Restful接口的属性.
	@Transient
	@JsonIgnore
	private String plainPassword;

	@Column(name = "USER_PWD")
	private String password;

	@Column(name = "USER_SALT")
	private String salt;

	@Column(name = "USER_ROLES")
	private String roles;

	@Column(name = "OPR_USERID")
	private Long createUserId;

	@Column(name = "CREATE_TIME")
	private Date registerDate;

	@Column(name = "UPDATE_TIME")
	private Date updateDate;

	@Column(name = "PLATFORM_ID")
	private Long platformId;

	@Column(name = "USER_EMAIL")
	private String email;



	/**
	 * 运营商 code
	 */
	@Column(name = "CP_CODES")
	private String cpCodes;

	@Column(name = "PROGRAM_TYPE_IDS")
	private String programTypeIds;

	@Column(name = "MATERIAL_TYPE_IDS")
	private String materialTypeIds;

	public String getProgramTypeIds()
	{
		return programTypeIds;
	}

	public void setProgramTypeIds(String programTypeIds)
	{
		this.programTypeIds = programTypeIds;
	}

	public String getMaterialTypeIds()
	{
		return materialTypeIds;
	}

	public void setMaterialTypeIds(String materialTypeIds)
	{
		this.materialTypeIds = materialTypeIds;
	}

	public String getCpCodes()
	{
		return cpCodes;
	}

	public void setCpCodes(String cpCodes)
	{
		this.cpCodes = cpCodes;
	}

	/**
	 * @return 返回 platformId
	 */
	public Long getPlatformId()
	{
		return platformId;
	}

	/**
	 * @param 对platformId进行赋值
	 */
	public void setPlatformId(Long platformId)
	{
		this.platformId = platformId;
	}

	@NotBlank
	public String getLoginName()
	{
		return loginName;
	}

	public void setLoginName(String loginName)
	{
		this.loginName = loginName;
	}

	@NotBlank
	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getPlainPassword()
	{
		return plainPassword;
	}

	public void setPlainPassword(String plainPassword)
	{
		this.plainPassword = plainPassword;
	}

	public String getPassword()
	{
		return password;
	}

	public void setPassword(String password)
	{
		this.password = password;
	}

	public String getSalt()
	{
		return salt;
	}

	public void setSalt(String salt)
	{
		this.salt = salt;
	}

	public String getRoles()
	{
		return roles;
	}

	public void setRoles(String roles)
	{
		this.roles = roles;
	}

	public List<String> getRoleList()
	{
		// 角色列表在数据库中实际以逗号分隔字符串存储，因此返回不能修改的List.
		return ImmutableList.copyOf(StringUtils.split(roles, ","));
	}

	public User()
	{
	}

	public User(Long id)
	{
		this.id = id;
	}

	// 设定JSON序列化时的日期格式
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+08:00")
	public Date getRegisterDate()
	{
		return registerDate;
	}

	public void setRegisterDate(Date registerDate)
	{
		this.registerDate = registerDate;
	}

	public Long getId()
	{
		return id;
	}

	public void setId(Long id)
	{
		this.id = id;
	}

	public Long getCreateUserId()
	{
		return createUserId;
	}

	public void setCreateUserId(Long createUserId)
	{
		this.createUserId = createUserId;
	}

	public Date getUpdateDate()
	{
		return updateDate;
	}

	public void setUpdateDate(Date updateDate)
	{
		this.updateDate = updateDate;
	}


	@Override
	public String toString()
	{
		return ToStringBuilder.reflectionToString(this);
	}

	public String getEmail()
	{
		return email;
	}

	public void setEmail(String email)
	{
		this.email = email;
	}
}