package net.chinaott.cms.core.programseries.entity;

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
@Table(name = "cms_program_series_rel")
public class ProgramSeriesRel {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "rel_id")
    private Long relId;

    @Column(name = "program_series_id")
    private Long programSeriesId;

    @Column(name = "program_id")
    private Long programId;

    @Column(name = "group_name")
    private String groupName;

    @Column(name = "rel_time")
    private Date relTime;

    @Column(name = "rel_user")
    private String relUser;

    @Column(name = "update_time")
    private Date updateTime;

    @Column(name = "update_user")
    private String updateUser;

    @Column(name = "taxis")
    private Integer taxis;

    @Column(name = "status")
    private Integer status;

    @Column(name = "last_modify_time")
    private Date lastModifyTime;

}