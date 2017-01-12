package net.chinaott.cms.web.utils;

import java.beans.BeanInfo;
import java.beans.IntrospectionException;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.FatalBeanException;
import org.springframework.util.Assert;

public class BeanUtil extends BeanUtils
{
    /**
     * Logger for this class
     */
    private static final Logger logger = LoggerFactory.getLogger(BeanUtil.class);
    
    /**
     * 说明：将source中的属性值赋给target中的属性，如果为null或空字符串，不再copy 前提：相关属性是public，且定义了相关的getter，setter方法（内省）
     * 应用：spring的数据绑定配合dao持久化时，如果页面传递为空，再调用attachdirty方法会把数据库里的值全部置null 而且spring的beanUtils类会把所有属性一股脑拷贝，不管是不是空或null
     * 
     * @author mahc
     */
    public static void copyIgnoreNulls(Object source, Object target)
    {
        BeanInfo beanInfo = null;
        try
        {
            beanInfo = Introspector.getBeanInfo(source.getClass());
        }
        catch (IntrospectionException e)
        {
            return;
        }
        PropertyDescriptor[] propertieDescritors = beanInfo.getPropertyDescriptors();
        for (PropertyDescriptor propertyDescriptor : propertieDescritors)
        {
            Method readMethod = propertyDescriptor.getReadMethod();
            Method writeMethod = propertyDescriptor.getWriteMethod();
            if (writeMethod != null && readMethod != null)
            {
                if (!Modifier.isPublic(readMethod.getDeclaringClass().getModifiers()))
                    readMethod.setAccessible(true);
                Object value = null;
                try
                {
                    value = readMethod.invoke(source, new Object[0]);
                }
                catch (Exception e)
                {
                    logger.error("------------>getter方法读取失败");
                    continue;
                }
                if (!Modifier.isPublic(writeMethod.getDeclaringClass().getModifiers()))
                    writeMethod.setAccessible(true);
                if (value != null && !"".equals(value.toString()))
                {
                    // 关键在此处的判断，如果为空，不再copy
                    try
                    {
                        writeMethod.invoke(target, new Object[] {value});
                    }
                    catch (Exception e)
                    {
                        logger.error("------------>setter方法写入失败");
                        continue;
                    }
                }
                else
                {
                }
            }
        }
    }
    
    /**
     * <页面如果将字段置为"" 但不是null ,则将该字段copy到对象. >
     * 
     * @param source
     * @param target
     */
    public static void copyIgnoreNull(Object source, Object target)
    {
        Assert.notNull(source, "Source must not be null");
        Assert.notNull(target, "Target must not be null");

        Class<?> actualEditable = target.getClass();
        PropertyDescriptor[] targetPds = getPropertyDescriptors(actualEditable);

        for (PropertyDescriptor targetPd : targetPds) {
            if (targetPd.getWriteMethod() != null ) {
                PropertyDescriptor sourcePd = getPropertyDescriptor(source.getClass(), targetPd.getName());
                if (sourcePd != null && sourcePd.getReadMethod() != null) {
                    try {
                        Method readMethod = sourcePd.getReadMethod();
                        if (!Modifier.isPublic(readMethod.getDeclaringClass().getModifiers())) {
                            readMethod.setAccessible(true);
                        }
                        Object value = readMethod.invoke(source);
                        Method writeMethod = targetPd.getWriteMethod();
                        if (!Modifier.isPublic(writeMethod.getDeclaringClass().getModifiers())) {
                            writeMethod.setAccessible(true);
                        }
                        if (value != null)
                        {
                            writeMethod.invoke(target, value);
                        }
                    }
                    catch (Throwable ex) {
                        throw new FatalBeanException("Could not copy properties from source to target", ex);
                    }
                }
            }
        }
    }
    
    /** 
     * 将一个 Map 对象转化为一个 JavaBean 
     * @param type 要转化的类型 
     * @param map 包含属性值的 map 
     * @return 转化出来的 JavaBean 对象 
     * @throws IntrospectionException
     *             如果分析类属性失败 
     * @throws IllegalAccessException 
     *             如果实例化 JavaBean 失败 
     * @throws InstantiationException 
     *             如果实例化 JavaBean 失败 
     * @throws InvocationTargetException
     *             如果调用属性的 setter 方法失败 
     */ 
    public static Object convertMap(Class type, Map map) 
            throws IntrospectionException, IllegalAccessException, 
            InstantiationException, InvocationTargetException { 
        BeanInfo beanInfo = Introspector.getBeanInfo(type); // 获取类属性 
        Object obj = type.newInstance(); // 创建 JavaBean 对象 

        // 给 JavaBean 对象的属性赋值 
        PropertyDescriptor[] propertyDescriptors =  beanInfo.getPropertyDescriptors(); 
        for (int i = 0; i< propertyDescriptors.length; i++) { 
            PropertyDescriptor descriptor = propertyDescriptors[i]; 
            String propertyName = descriptor.getName(); 

            if (map.containsKey(propertyName)) { 
                // 下面一句可以 try 起来，这样当一个属性赋值失败的时候就不会影响其他属性赋值。 
                Object value = map.get(propertyName); 

                Object[] args = new Object[1]; 
                args[0] = value; 

                descriptor.getWriteMethod().invoke(obj, args); 
            } 
        } 
        return obj; 
    } 

    /** 
     * 将一个 JavaBean 对象转化为一个  Map 
     * @param bean 要转化的JavaBean 对象 
     * @return 转化出来的  Map 对象 
     * @throws IntrospectionException 如果分析类属性失败
     * @throws IllegalAccessException 如果实例化 JavaBean 失败 
     * @throws InvocationTargetException 如果调用属性的 setter 方法失败
     */ 
    public static Map convertBean(Object bean) 
            throws IntrospectionException, IllegalAccessException, InvocationTargetException { 
        Class type = bean.getClass(); 
        Map returnMap = new HashMap(); 
        BeanInfo beanInfo = Introspector.getBeanInfo(type); 

        PropertyDescriptor[] propertyDescriptors =  beanInfo.getPropertyDescriptors(); 
        for (int i = 0; i< propertyDescriptors.length; i++) { 
            PropertyDescriptor descriptor = propertyDescriptors[i]; 
            String propertyName = descriptor.getName(); 
            if (!propertyName.equals("class")) { 
                Method readMethod = descriptor.getReadMethod(); 
                Object result = readMethod.invoke(bean, new Object[0]); 
                if (result != null) { 
                    returnMap.put(propertyName, result); 
                } else { 
                    returnMap.put(propertyName, ""); 
                } 
            } 
        } 
        return returnMap; 
    } 
}
