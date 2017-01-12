package net.chinaott.cms.core.program.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name = "cms_program_actor_rel")
public class ProgramActorRel implements Serializable{
	
	private static final long serialVersionUID = 8574558126889461736L;

	/**
	 * 关系编号
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "rel_id")
	private Long relId;

	/**
	 * 节目编号
	 */
	@Column(name = "program_id")
    private Long programId;

	/**
	 * 影人编号
	 */
	@Column(name = "actor_id")
    private Long actorId;

	/**
	 * 创建时间
	 */
	@Column(name = "create_time")
    private Date createTime;

	/**
	 * 更新时间
	 */
	@Column(name = "update_date")
    private Date updateDate;

	/**
	 * 更新用户
	 */
	@Column(name = "update_user")
    private String updateUser;

	/**
	 * 影人类型编号
	 */
	@Column(name = "actor_type_value")
    private String actorTypeValue;

}