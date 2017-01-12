package net.chinaott.cms.core.program.bean;

import lombok.Data;

/**
 * CMS文件信息
 * @author cheng
 */
@Data
public class CmsSrcFile {

	/**
	 * "srcFiles":[{"sourceUrl":"http://source01.media.ysten.com/media/new/2013/icntv2/media/2014/12/24/SD593e875e87a94ecdbb9b6ab9608ec6ce.ts",
	 * 				 "md5":"5448074d3a69e3b86405ccb0889894b4",
	 * 				 "mediaId":"647772094",
	 * 				 "fileSize":"206766912",
	 *               "type":"ts"}]}
	 */
	 private String sourceUrl;
	 
	 private String md5;
	 
	 private String mediaId;
	 
	 private String fileSize;
	 
	 private String type;
	
	 private String playUrl;
	    
	 private String status;
	    
	 private String message;
}
