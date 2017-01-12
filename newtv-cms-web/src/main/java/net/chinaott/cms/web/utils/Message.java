package net.chinaott.cms.web.utils;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * Created with IntelliJ IDEA. User: Chen Date: 12-8-29 Time: 下午9:00 To change this template use File | Settings | File
 * Templates.
 */
public class Message
{
    
    /**
     * 日志
     */
    private static final Logger LOGGER = LoggerFactory.getLogger(Message.class);
    
    public static final String CALLBACKTYPE_CLOSECURRENT = "closeCurrent";
    
    public static final String CALLBACKTYPE_FORWARD = "forward";
    
    private String statusCode = "";
    
    private String code = "";
    
    private String message = "";
    
//    private String navTabId = "";
//    
//    private String rel = "";
//    
//    private String callbackType = "";
//    
//    private String forwardUrl = "";
//    
//    private String confirmMsg = "";
    
    private String objectId;// 对象ID
    
    protected static ObjectMapper jackSon = new ObjectMapper();
    
    public String getObjectId()
    {
        return objectId;
    }
    
    public void setObjectId(String objectId)
    {
        this.objectId = objectId;
    }
    
    public Message()
    {
    }
    
//    public Message(String navTabId)
//    {
//        this.navTabId = navTabId;
//    }
//    
    public String getStatusCode()
    {
        return statusCode;
    }
    
    public void setStatusCode(String statusCode)
    {
        this.statusCode = statusCode;
    }
    
    public String getMessage()
    {
        return message;
    }
    
    public void setMessage(String message)
    {
        this.message = message;
    }
    
//    public String getRel()
//    {
//        return rel;
//    }
//    
//    public void setRel(String rel)
//    {
//        this.rel = rel;
//    }
//    
//    public String getNavTabId()
//    {
//        return navTabId;
//    }
//    
//    public void setNavTabId(String navTabId)
//    {
//        this.navTabId = navTabId;
//    }
//    
//    public String getCallbackType()
//    {
//        return callbackType;
//    }
//    
//    public void setCallbackType(String callbackType)
//    {
//        this.callbackType = callbackType;
//    }
//    
//    public String getForwardUrl()
//    {
//        return forwardUrl;
//    }
//    
//    public void setForwardUrl(String forwardUrl)
//    {
//        this.forwardUrl = forwardUrl;
//    }
//    
//    public String getConfirmMsg()
//    {
//        return confirmMsg;
//    }
//    
//    public void setConfirmMsg(String confirmMsg)
//    {
//        this.confirmMsg = confirmMsg;
//    }
    
    public String getCode()
    {
        return code;
    }
    
    public void setCode(String code)
    {
        this.code = code;
    }
    
    public void printMessage(HttpServletResponse response, Message message)
    {
        PrintWriter writer;
        try
        {
            response.setCharacterEncoding("utf-8");
            writer = response.getWriter();
            writer.print(jackSon.writeValueAsString(message));
            writer.flush();
            writer.close();
        }
        catch (IOException e)
        {
            if (LOGGER.isInfoEnabled())
            {
                LOGGER.info("Exit func[FirmManageContorller.printMessage]" + "-Exception " + e);
            }
        }
    }
}
