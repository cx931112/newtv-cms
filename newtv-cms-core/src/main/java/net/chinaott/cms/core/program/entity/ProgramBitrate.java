package net.chinaott.cms.core.program.entity;

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
@Table(name = "cms_program_bitrate")
public class ProgramBitrate {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "program_rate_id")
    private Long programRateId;

    @Column(name = "program_id")
    private Long programId;

    @Column(name = "src_file_name")
    private String srcFileName;

    @Column(name = "src_file_path")
    private String srcFilePath;

    @Column(name = "md5")
    private String md5;

    @Column(name = "uuid")
    private String uuid;

    @Column(name = "bitrate_status")
    private Integer bitrateStatus;

    @Column(name = "file_type")
    private String fileType;

    @Column(name = "file_size")
    private Long fileSize;

    @Column(name = "cp_code")
    private String cpCode;

    @Column(name = "play_url")
    private String playUrl;

    @Column(name = "down_url")
    private String downUrl;

    @Column(name = "out_source_id")
    private String outSourceId;

    @Column(name = "definition_code")
    private String definitionCode;

    @Column(name = "is_cp_delete")
    private Integer isCpDelete;

    @Column(name = "third_modify_time")
    private Date thirdModifyTime;

    @Column(name = "create_date")
    private Date createDate;

    @Column(name = "last_modify_date")
    private Date lastModifyDate;

}