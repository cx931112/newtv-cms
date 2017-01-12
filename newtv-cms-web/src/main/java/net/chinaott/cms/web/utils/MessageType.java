package net.chinaott.cms.web.utils;

/**
 * <返回json信息code代码>
 * 
 * @author liwei
 * @version [1.0, 2013年12月31日]
 */
public enum MessageType
{
    
    /**
     * 1，【Success 成功，Error 失败，TimeOut 超时， Close 关闭当前页】 
     * 2，【 UNKNOWN_ERROR 未知错误，INVALID_PARAMETER 请求参数无效 INTERNAL_ERROR
     *      内部错误，DATA_UNAVAILABLE 数据不存在，OPERATE_SUCCESS 操作成功】
     */
    SUCCESS("200"), ERROR("300"), TIMEOUT("301"), CLOSE("closeCurrent"), UNKNOWN_ERROR("1"), 
    INVALID_PARAMETER("2"), INTERNAL_ERROR("3"), DATA_UNAVAILABLE("4"), OPERATE_SUCCESS("成功");
    
    public String value;
    
    MessageType(String value)
    {
        this.value = value;
    }
}