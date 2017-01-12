package net.chinaott.cms.core.program.entity;

import java.util.Date;

import lombok.Data;

@Data
public class ProgramDistributeStatus{
	
	private Long platformId;

    private Long programRateId;
	
    private Long distributeStatus;

    private Date finishTime;

    private Long cdnStatus;

    private String failReason;

    private String playUrl;

    private String replaceDomainPlayUrl;

}