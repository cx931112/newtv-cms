package net.chinaott.cms.web.common.constant;

/**
 * <静态常量类>
 * 
 * @author lizw
 * @version [2.0, 2014年9月17日]
 */
public final class Constant
{
	private Constant()
	{
	}

	public static final String OPRDATATYPE_USER = "用户";

	public static final String OPRDATATYPE_ROLE = "角色";

	public static final String OPRDATATYPE_BUTTON = "按钮";

	public static final String OPRDATATYPE_SYSTEMCONFIG = "系统配置";

	public static final String OPRDATATYPE_MENU = "菜单";

	public static final String OPRDATATYPE_SYSTEMDIC = "字典配置";
	
	public static final String OPRDATATYPE_PROGRAM = "节目管理";

	public static final String OPRDATATYPE_ACTOR = "影人管理";
	/**
	 * 字符串0
	 */
	public static final String STRING_0 = "0";

	/**
	 * 系统文件分隔符
	 */
	public static final String FILE_SER = "/";

	/**
	 * 分隔符 ,
	 */
	public static final String SEP_COMMA = ",";


	/**
	 * 分隔符 -
	 */
	public static final String SEP_MINUS = "-";

	/**
	 * 影人状态 未屏蔽
	 */
	public static final Integer ACTOR_IS_SHOW = 1;

	/**
	 * 影人状态 屏蔽
	 */
	public static final Integer ACTOR_IS_NOT_SHOW = 0;
	

	
	/**
	 * 上传海报存放相对路径
	 */
	public static final  String UPLOAD_DIR = "static/images/upload/poster";
	
	
	/*------------------------------------四川_mongodb数据表--------------------------------------*/
	/**
	 *四川 运营商代码和型号代码对照表
	 */
	public static final String SICHUAN_CARRIER_AND_MODEL = "c_carrier_and_model";
	/**
	 * 四川串号表
	 */
	public static final String SICHUAN_C_ICNTV_ID = "c_icntv_id";
	
	
	/*------------------------------------shanghai_mongodb数据表--------------------------------------*/
	
	/**
	 *上海运营商代码和型号代码对照表
	 */
	public static final String SHANGHAI_CARRIER_AND_MODEL = "c_model_and_group";
	/**
	 * 上海串号表
	 */
	public static final String SHANGHAI_C_ICNTV_ID = "c_icntv_id";
	
	
	/*-----------------------------------------错误代码---------------------------------------------*/
	
	
	/**
	 * 插入成功
	 */
	public static final Integer ICNTV_ID_SUCCESS = 1;
	/**
	 * 好段重复
	 */
	public static final Integer ICNTV_ID_ISEXIST = 10;
	/**
	 * 插入参数为空
	 */
	public static final Integer ICNTV_ID_DATA_NULL = 11;
	
	
	/*-----------------------------------------四川系统字典表类型---------------------------------------------*/
	public static final String SICHUAN_BATCH_CODE = "BATCH_CODE";//批次
	public static final String SICHUAN_CARRIER_CODE = "CARRIER_CODE";//厂商
	public static final String SICHUAN_CITY_CODE = "CITY_CODE";//城市
	public static final String SICHUAN_MODEL_CODE = "MODEL_CODE";//型号
	public static final String SICHUAN_PLATFORM_ID = "PLATFORM_ID";//平台号
	public static final String SICHUAN_PROVINCE_CODE = "PROVINCE_CODE";//省份
	public static final String SICHUAN_SP_CODE = "SP_CODE";//运营机构
	public static final String SICHUAN_STB_TYPE = "STB_TYPE";//终端类型

	public static final long SICHUAN_IMPORT_SUM = 300000;//四川导入数量限制
	
	/*-----------------------------------------上海系统字典表类型---------------------------------------------*/
	public static final String SHANGHAI_BATCH_CODE = "SHANGHAI_BATCH_CODE";//批次
	public static final String SHANGHAI_CARRIER_CODE = "SHANGHAI_CARRIER_CODE";//厂商
	public static final String SHANGHAI_CITY_CODE = "SHANGHAI_CITY_CODE";//城市
	public static final String SHANGHAI_MODEL_CODE = "SHANGHAI_MODEL_CODE";//型号
	public static final String SHANGHAI_PLATFORM_ID = "SHANGHAI_PLATFORM_ID";//平台号
	public static final String SHANGHAI_PROVINCE_CODE = "SHANGHAI_PROVINCE_CODE";//省份
	public static final String SHANGHAI_SP_CODE = "SHANGHAI_SP_CODE";//运营机构
	public static final String SHANGHAI_STB_TYPE = "SHANGHAI_STB_TYPE";//终端类型
	public static final String SHANGHAI_GROUP_CODE = "SHANGHAI_GROUP_CODE";//终端类型

	public static final long SHANGHAI_IMPORT_SUM = 300000;//上海导入数量限制

    /*节目状态*/
	public static final String CHECKUP = "CHECKUP";//待审核
    public static final String EDIT = "EDIT";//编辑
    public static final String ONLINE = "ONLINE";//已上线
    public static final String OFFLINE = "OFFLINE";//已下线
    public static final String DELETED = "DELETED";//已删除
    public static final String CHECKUPNOPASS = "CHECKUPNOPASS";//初审不通过
    public static final String PREONLINE = "CHECKUPFINAL";//待终审
    public static final String CHECKUPFINALNOPASS = "CHECKUPFINALNOPASS";//终审不通过
    public static final String DISPATHING = "dispatching";//分发中
    
    /**
     * 节目状态实体类类名
     */
    public static final String PROGRAMSTATUS = "ProgramStatus";
    /**
     * 审核通过
     */
    public static final Integer AUDIT_PASS = 1;
    /**
     * 审核不通过
     */
    public static final Integer AUDIT_NOPASS = 0;
    
    /**
     * 下发CDN地址
     */
    public static final String CDN_TASK_URL = "addTask_url_path";
    
    
    
  
}
