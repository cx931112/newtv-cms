package net.chinaott.cms.web.log.entity;

/**
 * 
 * <操作类型枚举定义类>
 * 1|增加;2|修改;3|删除;4|审核;5|终审;6|预下线;7|下线终审;8|重新上线;9|回退;10|屏蔽;11|解禁;其他|未知操作
 * @author  lizw
 * @version  [版本号, 2014-11-19]
 * @see  [相关类/方法]
 * @since  [产品/模块版本]
 */
public enum OperationType
{
    ADD("增加"), MODIFY("修改"), REMOVE("删除"), AUDIT("初审"), PRE_ONLINE("预发布"),
    ONLINE("上线终审"), PRE_OFFLINE("预下线"), EMERGENCY_PRE_OFFLINE("紧急预下线"), OFFLINE("下线终审"), 
    REONLINE("重新上线"), ROLL_BACK("回退"),  IS_NOT_SHOW("屏蔽"), IS_SHOW("解禁"),OTHER("其他");

    private OperationType(String value) {  
        this.value = value;
    }
    /**
     * 操作类型名称
     */
    private String value;

    public String getValue()
    {
        return value;
    }
    

}