package net.chinaott.cms.web.common.advice;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import java.util.Arrays;

/**
 * 
 * <Controller系统日志拦截><br />
 * <功能详细描述>
 * 
 * @author wangdx
 * @version [版本号1.0, 2014年9月22日]
 * @see [相关类/方法]
 * @since [产品/模块版本]
 */
@Aspect
@Order(1)
@Component
public class LogAdvice
{

	/**
	 * 
	 * <前拦截><br />
	 * <功能详细描述>
	 * 
	 * @param joinPoint
	 * @see [类、类#方法、类#成员]
	 */
	@Before(value = "execution(* com.icntv.newtv.module.*.web.*.*(..))")
	public void before(JoinPoint joinPoint)
	{
		Logger log = LoggerFactory.getLogger(joinPoint.getTarget().getClass());
		if (log.isInfoEnabled())
		{
			log.info("Enter func[" + joinPoint.toShortString() + "]. The input parameters for "
					+ Arrays.toString(joinPoint.getArgs()));
		}
	}

	/**
	 * 
	 * <后拦截><br />
	 * <功能详细描述>
	 * 
	 * @param joinPoint
	 * @see [类、类#方法、类#成员]
	 */
	@After(value = "execution(* com.icntv.newtv.module.*.web.*.*(..))")
	public void after(JoinPoint joinPoint)
	{
		Logger log = LoggerFactory.getLogger(joinPoint.getTarget().getClass());
		if (log.isInfoEnabled())
		{
			log.info("Exit func[" + joinPoint.toShortString() + "]");
		}
	}

}
