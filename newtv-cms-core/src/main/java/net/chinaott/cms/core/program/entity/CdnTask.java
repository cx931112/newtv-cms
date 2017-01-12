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
@Table(name = "cms_cdn_task")
public class CdnTask implements Serializable{
	
	private static final long serialVersionUID = -9029457114404910227L;

	/**
	 * 任务ID
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "task_id")
	private Long taskId;

	/**
	 * CDN平台IDS
	 */
	@Column(name = "platform_id")
    private String platformId;

	/**
	 * 节目集ID
	 */
	@Column(name = "program_series_id")
    private Long programSeriesId;

	/**
	 * 节目集名称
	 */
	@Column(name = "program_series_name")
    private String programSeriesName;

	/**
	 * 节目ID
	 */
	@Column(name = "program_id")
    private Long programId;

	/**
	 * 节目名称
	 */
	@Column(name = "program_name")
    private String programName;

	/**
	 * 集数
	 */
	@Column(name = "set_number")
    private Integer setNumber;

	/**
	 * 优先级
	 */
	@Column(name = "priority")
    private String priority;

	/**
	 * 状态
	 */
	@Column(name = "status")
    private Integer status;

	/**
	 * 创建时间
	 */
	@Column(name = "create_time")
    private Date createTime;

	/**
	 * 发送任务时间
	 */
	@Column(name = "sen_time")
    private Date senTime;

	/**
	 * 返回任务时间
	 */
	@Column(name = "return_time")
    private Date returnTime;

	/**
	 * CDN错误消息
	 */
	@Column(name = "fail_reason")
    private String failReason;

	/**
	 * 任务类型,0:下发;1:删除
	 */
	@Column(name = "task_type")
    private Integer taskType;
}