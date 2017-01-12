package net.chinaott.cms.core.programseries.entity;

import lombok.Data;

import java.util.Date;

@Data
public class ProgramSeriesAudit {
    private Long auditLogId;

    private Long programSeriesId;

    private String programSeriesName;

    private Integer auditType;

    private Integer status;

    private Date auditTime;

    private String auditUser;

    private String auditDesc;

}