package net.chinaott.cms.web.common.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import net.chinaott.cms.web.common.service.DictionaryService;

/**
 * Application Lifecycle Listener implementation class InitListener
 * 
 */
public class InitListener implements ServletContextListener
{

    /**
     * Default constructor.
     */
    public InitListener()
    {

    }

    /**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent event)
    {
        WebApplicationContext cxt = WebApplicationContextUtils.getWebApplicationContext(event
                .getServletContext());
        // 初始化数据字典
        DictionaryService dict = (DictionaryService) cxt.getBean("dictionaryService");
        dict.initDictionary();

//        ApplicationContext cxt = new ClassPathXmlApplicationContext("applicationContext.xml");
//        DictionaryService dict = cxt.getBean(DictionaryService.class);
//        dict.initDictionary();
    }

    /**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent event)
    {

    }

}
