package net.chinaott.cms.core.basetag.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name = "cms_base_tag")
public class BaseTag implements Serializable{
	
	private static final long serialVersionUID = -7223793732939881148L;

	/**
	 * 标签ID
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "tag_id")
	private Long tagId;
	
	/**
	 * 标签类型名称
	 */
	@Column(name = "tag_type_name")
    private String tagTypeName;

	/**
	 * 标签类型值
	 */
	@Column(name = "tag_type_value")
    private String tagTypeValue;

	/**
	 * 标签值
	 */
	@Column(name = "tag_value")
    private String tagValue;

	/**
	 * 标签名称
	 */
	@Column(name = "tag_name")
    private String tagName;

	/**
	 * 标签排序
	 */
	@Column(name = "tag_sort")
    private Integer tagSort;

	/**
	 * 是否可运营
	 */
	@Column(name = "is_operate")
    private Integer isOperate;

}