package net.chinaott.cms.core.common.base;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ResultBean implements IResultBean{

	public static final int SUCCESS_CODE = 0;
    public static final int ERROR_CODE = -1;
    public static final int TIME_OUT_CODE = -2;

    private int statusCode; //-1=失败，0=成功
    private String message;
    private Object data;
    private List<Map<String, String>> errors;

    private String forwardUrl;
    private String navTabId;
    private String callbackType;

    public ResultBean(int code, String message) {
        this.statusCode = code;
        this.message = message;
    }

    public static ResultBean SUCCESS(){
        return new ResultBean(SUCCESS_CODE, "操作成功");
    }

    public static ResultBean ERROR(){
        return new ResultBean(ERROR_CODE, "系统繁忙，请稍后再试");
    }

    public static ResultBean TIME_OUT(){
        return new ResultBean(TIME_OUT_CODE, "请重新登录");
    }

    public int getStatusCode() {
        return statusCode;
    }

    public ResultBean setStatusCode(int statusCode) {
        this.statusCode = statusCode;
        return this;
    }

    public String getMessage() {
        return message;
    }

    public ResultBean setMessage(String message) {
        this.message = message;
        return this;
    }

    public Object getData() {
        return data;
    }

    public ResultBean setData(Object data) {
        this.data = data;
        return this;
    }

    public Object getErrors() {
        return errors;
    }

    public ResultBean setErrors(List<Map<String, String>> errors) {
        this.errors = errors;
        return this;
    }

    public ResultBean setErrors(String message) {
        List<Map<String, String>> errors = new ArrayList<Map<String, String>>();
        Map<String, String> map = new HashMap<String, String>();
        map.put("key", "");
        map.put("value", message);
        errors.add(map);
        this.errors = errors;
        return this;
    }

    public String getForwardUrl() {
        return forwardUrl;
    }

    public ResultBean setForwardUrl(String forwardUrl) {
        this.forwardUrl = forwardUrl;
        return this;
    }

    public String getNavTabId() {
        return navTabId;
    }

    public ResultBean setNavTabId(String navTabId) {
        this.navTabId = navTabId;
        return this;
    }

    public String getCallbackType() {
        return callbackType;
    }

    public ResultBean setCallbackType(String callbackType) {
        this.callbackType = callbackType;
        return this;
    }
}
