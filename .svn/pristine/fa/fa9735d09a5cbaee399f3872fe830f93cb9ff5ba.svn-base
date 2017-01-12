package net.chinaott.cms.core.log.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;

@Data
@Entity
@Table(name = "cms_program_audit")
public class ProgramAudit {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "audit_log_id")
    private Long auditLogId;
    
    @Column(name = "program_id")
    private Long programId;
    
    @Column(name = "program_name")
    private String programName;
    
    @Column(name = "audit_type")
    private Integer auditType;
    
    @Column(name = "status")
    private Integer status;
    
    @Column(name = "audit_time")
    private Date auditTime;
    
    @Column(name = "audit_user")
    private String auditUser;
    
    @Column(name = "audit_desc")
    private String auditDesc;

}