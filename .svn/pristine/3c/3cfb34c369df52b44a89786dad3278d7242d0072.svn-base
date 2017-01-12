package net.chinaott.cms.web.utils;

import com.google.common.collect.Lists;
import net.chinaott.cms.core.system.entity.SystemConfig;
import net.chinaott.cms.web.module.system.service.SystemConfigService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.util.List;
import java.util.NoSuchElementException;
import java.util.concurrent.ConcurrentHashMap;

/**
 * <系统参数配置类>
 * 
 * @author chenc
 * @version [版本号, 2014年2月12日]
 * @see [相关类/方法]
 * @since [产品/模块版本]
 */
@Component
public class SystemConfigLoader implements InitializingBean
{
    private static Logger logger = LoggerFactory.getLogger(SystemConfigLoader.class);
    
    // 缓存
    private static ConcurrentHashMap<String, String> cache = new ConcurrentHashMap<String, String>();
    
    @Autowired
    private SystemConfigService systemConfigService;
    
    @Override
    public void afterPropertiesSet()
        throws Exception
    {
        logger.info("init cache begin.");
        initialize();
        logger.info("init cache end.");
    }
    
    public void refresh()
    {
        logger.info("refresh cache begin.");
        initialize();
        logger.info("refresh cache end.");
    }
    
    private void initialize()
    {
        ConcurrentHashMap<String, String> temp = new ConcurrentHashMap<String, String>();
        
        if (!CollectionUtils.isEmpty(cache))
        {
            temp.putAll(cache);
            cache.clear();
        }
        
        List<SystemConfig> configList = systemConfigService.queryAllSystemConfig();
        
        if (CollectionUtils.isEmpty(configList))
        {
            logger.warn("load system config error, no config here. ");
            cache.putAll(temp);
            temp.clear();
            return;
        }
        
        for (SystemConfig sc : configList)
        {
            cache.put(sc.getConfigName(), sc.getConfigValue());
        }
    }
    
    /**
     * <获取属性值,获取错误则返回默认值>
     * 
     * @param key
     * @param defaultValue
     * @return
     * @see [类、类#方法、类#成员]
     */
    public String getStringValue(String key, String defaultValue)
    {
        String value = getValue(key);
        return value != null ? value : defaultValue;
    }
    
    /**
     * <获取属性值>
     * 
     * @param key
     * @return
     * @see [类、类#方法、类#成员]
     */
    public String getStringValue(String key)
    {
        String value = getValue(key);
        if (value == null)
        {
            throw new NoSuchElementException();
        }
        return value;
    }
    
    /**
     * <获取属性值,获取错误则返回默认值>
     * 
     * @param key
     * @param defaultValue
     * @return
     * @see [类、类#方法、类#成员]
     */
    public Integer getIntegerValue(String key, Integer defaultValue)
    {
        String value = getValue(key);
        return value != null ? Integer.valueOf(value) : defaultValue;
    }
    
    /**
     * <获取属性值>
     * 
     * @param key
     * @return
     * @see [类、类#方法、类#成员]
     */
    public Integer getIntegerValue(String key)
    {
        String value = getValue(key);
        if (value == null)
        {
            throw new NoSuchElementException();
        }
        return Integer.valueOf(value);
    }
    
    /**
     * <获取属性值,获取错误则返回默认值>
     * 
     * @param key
     * @param defaultValue
     * @return
     * @see [类、类#方法、类#成员]
     */
    public Long getLongValue(String key, Long defaultValue)
    {
        String value = getValue(key);
        return value != null ? Long.valueOf(value) : defaultValue;
    }
    
    /**
     * <获取属性值>
     * 
     * @param key
     * @return
     * @see [类、类#方法、类#成员]
     */
    public Long getLongValue(String key)
    {
        String value = getValue(key);
        if (value == null)
        {
            throw new NoSuchElementException();
        }
        return Long.valueOf(value);
    }
    
    /**
     * <获取布尔属性值,获取错误则返回默认值>
     * 
     * @param key
     * @param defaultValue
     * @return
     * @see [类、类#方法、类#成员]
     */
    public boolean getBooleanValue(String key, boolean defaultValue)
    {
        String value = getValue(key);
        return value != null ? Boolean.valueOf(value) : defaultValue;
    }
    
    /**
     * <获取字符串列表值>
     * @param key
     * @return
     * @see [类、类#方法、类#成员]
     */
    public List<String> getListValue(String key)
    {
        String value = getValue(key);
        if (value == null)
        {
            throw new NoSuchElementException();
        }
        
        String[] strArr = StringUtils.commaDelimitedListToStringArray(value);
        return Lists.newArrayList(strArr);
    }
    
    private String getValue(String key)
    {
        return cache.get(key);
    }
}