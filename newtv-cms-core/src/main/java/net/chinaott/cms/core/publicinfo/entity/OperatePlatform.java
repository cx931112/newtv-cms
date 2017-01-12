package net.chinaott.cms.core.publicinfo.entity;

import java.io.Serializable;

import javax.persistence.*;

import lombok.Data;

import org.apache.commons.lang3.builder.ToStringBuilder;


@Data
@Entity
@Table(name="cms_operate_platform")
public class OperatePlatform implements Serializable{
/**
	 * 
	 */
	;
/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

@Id
/*插入数据时id是自动生成*/
@GeneratedValue(strategy = GenerationType.IDENTITY)
@Column(name="OPERATE_PLATFORM_ID")
private Integer id;

@Column(name="OPERATE_PLATFORM_NAME")
private String name;

@Column(name="SORT_NUM")
private Long sortNum;


@Override
public String toString()
{
    return ToStringBuilder.reflectionToString(this);
}
}
