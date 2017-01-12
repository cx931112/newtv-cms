package net.chinaott.cms.web.utils;

import net.chinaott.cms.web.common.constant.Constant;
import org.apache.commons.lang3.StringUtils;

import java.util.UUID;

/**
 * 
 * <UUID工具类><br />
 * <功能详细描述>
 * 
 * @author wangdx
 * @version [版本号1.0, 2014年10月20日]
 * @see [相关类/方法]
 * @since [产品/模块版本]
 */
public class UuidUtil
{
	/**
	 * 
	 * <获得36位的uuid><br />
	 * <功能详细描述>
	 * 
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	public static String getUUIDfor36()
	{
		return UUID.randomUUID().toString();
	}

	/**
	 * 
	 * <获得32位的uuid><br />
	 * <功能详细描述>
	 * 
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	public static String getUUIDfor32()
	{
		String uuid = UUID.randomUUID().toString();
		uuid = StringUtils.replace(uuid, Constant.SEP_MINUS, "");
		return uuid;
	}

	/**
	 * 
	 * <将32位uuid转换为36位的uuid 如果不是32位，那么直接返回null><br />
	 * <功能详细描述>
	 * 
	 * @param uuid
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	public static String formatUUID32to36(String uuid)
	{
		if (StringUtils.isBlank(uuid) || uuid.length() != 32)
		{
			return uuid;
		}
		StringBuffer id = new StringBuffer();
		id.append(uuid.substring(0, 8));
		id.append(Constant.SEP_MINUS);
		id.append(uuid.substring(8, 12));
		id.append(Constant.SEP_MINUS);
		id.append(uuid.substring(12, 16));
		id.append(Constant.SEP_MINUS);
		id.append(uuid.substring(16, 20));
		id.append(Constant.SEP_MINUS);
		id.append(uuid.substring(20, uuid.length()));

		return id.toString();
	}

	/**
	 * 
	 * <将36位的uuid转换为32位的><br />
	 * <功能详细描述>
	 * 
	 * @param uuid
	 * @return
	 * @see [类、类#方法、类#成员]
	 */
	public static String formatUUID36to32(String uuid)
	{
		if (StringUtils.isBlank(uuid))
		{
			return null;
		}
		return uuid.replace("-", "");
	}
	
}
