package net.chinaott.cms.core.program.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import lombok.Data;

@Data
@Entity
@Table(name = "cms_program")
public class Program implements Serializable{
	
	private static final long serialVersionUID = -7554887120499975075L;

	/**
	 * 节目ID
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "program_id")
	private Long programId;

	/**
	 * 节目名称
	 */
	@Column(name = "program_name")
    private String programName;

	/**
	 * 节目名称拼音
	 */
	@Column(name = "program_pinyin")
    private String programPinyin;

	/**
	 * 节目别名
	 */
	@Column(name = "program_alias")
    private String programAlias;

	/**
	 * 节目英文名称
	 */
	@Column(name = "program_en_name")
    private String programEnName;

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
	 * 字幕
	 */
	@Column(name = "caption")
    private String caption;

	/**
	 * 时长(秒)
	 */
	@Column(name = "program_length")
    private Integer programLength;

	/**
	 * 集数
	 */
	@Column(name = "set_number")
    private Integer setNumber;

	/**
	 * 排序
	 */
	@Column(name = "sort_num")
    private Integer sortNum;

	/**
	 * 试播时长(秒)
	 */
	@Column(name = "trial_dura")
    private Integer trialDura;

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
	 * 发布时间
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
	 * CDN分发状态
	 */
	@Column(name = "cdn_status")
    private String cdnStatus;

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
	 * 状态修改时间
	 */
	@Column(name = "status_time")
    private Date statusTime;

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
	 * 播放次数
	 */
	@Column(name = "play_times")
    private Long playTimes;

	/**
	 * 手动播放次数
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
	 * 片头时长(秒)
	 */
	@Column(name = "head_time")
    private Integer headTime;

	/**
	 * 片尾时长(秒)
	 */
	@Column(name = "tail_time")
    private Integer tailTime;

	/**
	 * 节目描述
	 */
	@Column(name = "program_desc")
    private String programDesc;
	
	/**
     * 回退原因
     */
    @Column(name = "back_reason")
    private String backReason;

	/**
	 * 审核意见
	 */
	@Column(name = "audit_desc")
    private String auditDesc;
	
	@Transient
	private List<String> programSeriesNameList;
	/**
	 * 导演
	 */
	@Transient
	private String director;
	/**
	 * 主演
	 */
	@Transient
    private String leadingRole;
	
	
}