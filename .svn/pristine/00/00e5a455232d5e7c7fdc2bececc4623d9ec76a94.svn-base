package net.chinaott.cms.core.actor.entity;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Data
@Entity
@Table(name = "cms_actor")
public class Actor implements Serializable{
	
	private static final long serialVersionUID = -5751814369032171360L;

	/**
	 * 影人编号
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "actor_id")
	private Long actorId;

	/**
	 * 名字
	 */
	@Column(name = "actor_name")
    private String actorName;

	/**
	 * 影人名字拼音
	 */
	@Column(name = "actor_name_pinyin")
    private String actorNamePinyin;

	/**
	 * 别名
	 */
	@Column(name = "alias")
    private String alias;

	/**
	 * 性别
	 */
	@Column(name = "sex")
    private String sex;

	/**
	 * 出生日期
	 */
	@Column(name = "birthday")
    private String birthday;

	/**
	 * 星座
	 */
	@Column(name = "actor_zodiac")
    private String actorZodiac;

	/**
	 * 籍贯
	 */
	@Column(name = "native_address")
    private String nativeAddress;

	/**
	 * 国籍
	 */
	@Column(name = "actor_country")
    private String actorCountry;

	/**
	 * 大海报
	 */
	@Column(name = "actor_big_poster")
    private String actorBigPoster;

	/**
	 * 小海报
	 */
	@Column(name = "actor_small_poster")
    private String actorSmallPoster;

	/**
	 * 外部数据标识
	 */
	@Column(name = "out_source_id")
    private String outSourceId;

	/**
	 * 是否显示
	 */
	@Column(name = "is_show")
    private Integer isShow;

	/**
	 * 创建时间
	 */
	@Column(name = "create_time")
    private Date createTime;

	/**
	 * 简介
	 */
	@Column(name = "actor_desc")
    private String actorDesc;
}