package net.chinaott.cms.core.programseries.entity;

import java.io.Serializable;
import java.math.BigDecimal;
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
@Table(name = "cms_program_series")
public class ProgramSeries implements Serializable{
	
	private static final long serialVersionUID = 2069098530371097801L;

	/**
	 * 节目集ID
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "program_series_id")
	private Long programSeriesId;

	/**
	 * 节目集名称
	 */
	@Column(name = "program_series_name")
    private String programSeriesName;

	/**
	 * 节目集拼音
	 */
	@Column(name = "program_series_pinyin")
    private String programSeriesPinyin;

	/**
	 * 节目集别名
	 */
	@Column(name = "program_series_alias")
    private String programSeriesAlias;

	/**
	 * 节目集英文名称
	 */
	@Column(name = "program_series_en_name")
    private String programSeriesEnName;

	/**
	 * 副标题
	 */
	@Column(name = "subtitle")
    private String subtitle;

	/**
	 * 节目类型
	 */
	@Column(name = "program_type")
    private String programType;

	/**
	 * 节目分类
	 */
	@Column(name = "program_class")
    private String programClass;

	/**
	 * 地区
	 */
	@Column(name = "zone")
    private String zone;

	/**
	 * 语言
	 */
	@Column(name = "language")
    private String language;

	/**
	 * 年代
	 */
	@Column(name = "years")
    private String years;

	/**
	 * 时长(分钟)
	 */
	@Column(name = "time_length")
    private Integer timeLength;

	/**
	 * 试播时长(分钟)
	 */
	@Column(name = "trial_dura")
    private Integer trialDura;

	/**
	 * 节目集数
	 */
	@Column(name = "program_count")
    private Integer programCount;

	/**
	 * 节目总集数
	 */
	@Column(name = "program_total_count")
    private Integer programTotalCount;

	/**
	 * 首播时间
	 */
	@Column(name = "premiere_date")
    private Date premiereDate;

	/**
	 * 首播频道
	 */
	@Column(name = "premiere_channel")
    private String premiereChannel;

	/**
	 */
	@Column(name = "publish_date")
    private Date publishDate;

	/**
	 * 清晰度
	 */
	@Column(name = "definition_code")
    private String definitionCode;

	/**
	 * 默认播放清晰度
	 */
	@Column(name = "default_definition")
    private String defaultDefinition;

	/**
	 * 小海报
	 */
	@Column(name = "small_poster_addr")
    private String smallPosterAddr;

	/**
	 * 大海报
	 */
	@Column(name = "big_poster_addr")
    private String bigPosterAddr;

	/**
	 * 横海报
	 */
	@Column(name = "horizontal_poster")
    private String horizontalPoster;

	/**
	 * 竖海报
	 */
	@Column(name = "vertical_poster")
    private String verticalPoster;

	/**
	 * 背景海报
	 */
	@Column(name = "background_poster")
    private String backgroundPoster;

	/**
	 * 外部数据标识
	 */
	@Column(name = "out_source_id")
    private String outSourceId;

	/**
	 * 厂商编码
	 */
	@Column(name = "cp_code")
    private String cpCode;

	/**
	 * 状态
	 */
	@Column(name = "status")
    private String status;

	/**
	 * 最后修改时间
	 */
	@Column(name = "last_modify_date")
    private Date lastModifyDate;

	/**
	 * 创建时间
	 */
	@Column(name = "create_date")
    private Date createDate;

	/**
	 * 下线原因
	 */
	@Column(name = "off_reason")
    private String offReason;

	/**
	 * 下线时间
	 */
	@Column(name = "off_line_time")
    private Date offLineTime;

	/**
	 * 重新上线原因
	 */
	@Column(name = "re_on_reason")
    private String reOnReason;

	/**
	 * 删除原因
	 */
	@Column(name = "del_reason")
    private String delReason;

	/**
	 * 发布平台IDS
	 */
	@Column(name = "publish_platform_ids")
    private String publishPlatformIds;

	/**
	 * 分发完成平台IDS
	 */
	@Column(name = "finish_platform_ids")
    private String finishPlatformIds;

	/**
	 * 是否被第三方删除
	 */
	@Column(name = "is_cp_delete")
    private Integer isCpDelete;

	/**
	 * 第三方操作时间
	 */
	@Column(name = "third_modify_time")
    private Date thirdModifyTime;

	/**
	 * 操作时间
	 */
	@Column(name = "operate_time")
    private Date operateTime;

	/**
	 * 操作类型,0:上线 1:下线
	 */
	@Column(name = "operate_type")
    private String operateType;

	/**
	 * 第一次上线时间
	 */
	@Column(name = "first_online_time")
    private Date firstOnlineTime;

	/**
	 * 节目集下节目排序方式
	 */
	@Column(name = "sort_type")
    private String sortType;

	/**
	 * 状态修改时间
	 */
	@Column(name = "status_time")
    private Date statusTime;

	/**
	 * 节目集下节目播放顺序
	 */
	@Column(name = "play_sort")
    private String playSort;

	/**
	 * 版权开始日期
	 */
	@Column(name = "copyright_start_date")
    private Date copyrightStartDate;

	/**
	 * 版权结束日期
	 */
	@Column(name = "copyright_end_date")
    private Date copyrightEndDate;

	/**
	 * 版权信息名称
	 */
	@Column(name = "copyright_name")
    private String copyrightName;

	/**
	 * 片单版权名称
	 */
	@Column(name = "film_cp_name")
    private String filmCpName;

	/**
	 * 评分
	 */
	@Column(name = "score")
    private BigDecimal score;

	/**
	 * 手动评分
	 */
	@Column(name = "manual_score")
    private BigDecimal manualScore;

	/**
	 */
	@Column(name = "play_times")
    private Long playTimes;

	/**
	 */
	@Column(name = "manual_play_times")
    private Long manualPlayTimes;

	/**
	 * 修改人
	 */
	@Column(name = "update_user")
    private String updateUser;

	/**
	 * 是否预告片{0:不是 1:是}
	 */
	@Column(name = "is_preview")
    private Integer isPreview;

	/**
	 * 是否完整版{0:不是 1:是}
	 */
	@Column(name = "is_full")
    private Integer isFull;

	/**
	 * 是否3D{0:不是 1:是}
	 */
	@Column(name = "is_3D")
    private Integer is3d;

	/**
	 * 简介
	 */
	@Column(name = "program_series_desc")
    private String programSeriesDesc;

	/**
	 * 审核意见
	 */
	@Column(name = "audit_desc")
    private String auditDesc;
}