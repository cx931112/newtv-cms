package net.chinaott.cms.web.common.tag;

import net.chinaott.cms.web.common.constant.Constant;
import net.chinaott.cms.web.utils.ApplicationContextUtil;
import net.sf.ehcache.Cache;
import net.sf.ehcache.Element;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;
import java.util.Map;

/**
 * 
 * <字典兑换TAG><br />
 * <功能详细描述>
 * 
 * @author wangdx
 * @version [版本号1.0, 2014年9月25日]
 * @see [相关类/方法]
 * @since [产品/模块版本]
 */
public class DictionaryTag extends TagSupport
{
    
    /**
     * 注释内容
     */
    private static final long serialVersionUID = 8207016896610833853L;
    
    private static final Logger LOGGER = LoggerFactory.getLogger(DictionaryTag.class);
    
    @Autowired
    private static Cache cache;
    
    public int doStartTag()
        throws JspTagException
    {
        return SKIP_BODY;
    }
    
    public int doEndTag()
        throws JspTagException
    {
        try
        {
            JspWriter out = this.pageContext.getOut();
            out.print(end().toString());
        }
        catch (IOException ex)
        {
            LOGGER.error("Inner func[DictionaryTag.doEndTag()] catch exception..", ex);
        }
        return SKIP_BODY;
    }
    
    @SuppressWarnings("unchecked")
    public String end()
    {
        cache = ApplicationContextUtil.getContext().getBean(Cache.class);
        String str = "";
        StringBuffer sb = new StringBuffer();
        if (StringUtils.isBlank(separator))
        {
            separator = Constant.SEP_COMMA;
        }
        if (StringUtils.isNotBlank(entity) && StringUtils.isNotBlank(key))
        {
            Element element = cache.get(entity);
            Map<String, String> result = (Map<String, String>)element.getObjectValue();
            String[] keys = StringUtils.split(key, separator);
            for (String ks : keys)
            {
                String value = StringUtils.trimToEmpty(result.get(ks));
                if (StringUtils.isNotBlank(value))
                {
                    sb.append(value).append(",");
                }
            }
            if (StringUtils.isNotBlank(sb.toString()))
            {
                str = StringUtils.substring(sb.toString(), 0, sb.toString().length() - 1);
            }
            if (StringUtils.isBlank(str) && StringUtils.isNotBlank(defaultValue))
            {
                str = defaultValue;
            }
        }
        return str;
    }
    
    private String entity;// 对象名
    
    private String key;// 主键值
    
    private String separator;// 分隔符
    
    private String defaultValue;// 默认值
    
    public String getEntity()
    {
        return entity;
    }
    
    public void setEntity(String entity)
    {
        this.entity = entity;
    }
    
    public String getKey()
    {
        return key;
    }
    
    public void setKey(String key)
    {
        this.key = key;
    }
    
    public String getSeparator()
    {
        return separator;
    }
    
    public void setSeparator(String separator)
    {
        this.separator = separator;
    }
    
    public String getDefaultValue()
    {
        return defaultValue;
    }
    
    public void setDefaultValue(String defaultValue)
    {
        this.defaultValue = defaultValue;
    }
    
}
