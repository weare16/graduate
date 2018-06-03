package com.mtecc.rdc.util;

import java.util.Collection;
import java.util.List;

/**
 * 本类是判断是否为空的工具类，主要实现判断类、集合、字符串等等是否为空.
 * @author liu
 */
public final class EmptyUtil {

    /**
     * 判断类是否为空
     * 
     * @param s
     *                被检查的类
     * @return boolean (若类为null返回为true)
     */
    public static final boolean isEmpty(Object obj) {
	return obj == null;
    }

    /**
     * 判断集合是否为空
     * 
     * @param col
     *                被检查的Collection
     * @return boolean (若Collection为null或不包含元素返回为true)
     */
    public static final boolean isEmpty(Collection col) {
	return (col == null) || (col.isEmpty());
    }

    /**
     * 判断List是否为空
     * 
     * @param ls
     *                被检查的list
     * @return boolean (若list为null或不包含元素返回为true)
     */
    public static final boolean isEmpty(List ls) {
	return (ls == null) || (ls.isEmpty());
    }

    /**
     * 判断字符串是否为空
     * 
     * @param s
     *                被检查的字符串
     * @return boolean (若字符串为null、去空后不包含任何元素或为"null"返回为true)
     */
    public static final boolean isEmpty(String s) {
	return (s == null) || (s.trim().length() == 0)
		|| ("null".equals(s.trim()));
    }

    /**
     * 判断整数是否为空
     * 
     * @param N
     *                被检查的整数
     * @return boolean (若整数为null返回为true)
     */
    public static final boolean isEmpty(Integer N) {
	return N == null;
    }

    /**
     * 判断浮点数是否为空
     * 
     * @param F
     *                被检查的浮点数
     * @return boolean (若浮点数为null返回为true)
     */
    public static final boolean isEmpty(Float F) {
	return F == null;
    }

    /**
     * 判断双精度实数是否为空
     * 
     * @param D
     *                被检查的双精度实数
     * @return boolean (若双精度实数为null返回为true)
     */
    public static final boolean isEmpty(Double D) {
	return D == null;
    }

    /**
     * 判断类是否不为空
     * 
     * @param s
     *                被检查的类
     * @return boolean (若类为非null返回为true)
     */
    public static final boolean isUnEmpty(Object obj) {
	return !isEmpty(obj);
    }

    /**
     * 判断集合是否不为空
     * 
     * @param col
     *                被检查的Collection
     * @return boolean (若Collection包含元素返回为true)
     */
    public static final boolean isUnEmpty(Collection col) {
	return !isEmpty(col);
    }

    /**
     * 判断List是否不为空
     * 
     * @param ls
     *                被检查的list
     * @return boolean (若list包含元素返回为true)
     */
    public static final boolean isUnEmpty(List ls) {
	return !isEmpty(ls);
    }

    /**
     * 判断字符串是否不为空
     * 
     * @param s
     *                被检查的字符串
     * @return boolean (若字符串为非null且去空后包含元素且为非"null"返回为true)
     */
    public static final boolean isUnEmpty(String s) {
	return !isEmpty(s);
    }

    /**
     * 判断整数是否不为空
     * 
     * @param N
     *                被检查的整数
     * @return boolean (若整数为非null返回为true)
     */
    public static final boolean isUnEmpty(Integer N) {
	return !isEmpty(N);
    }

    /**
     * 判断浮点数是否不为空
     * 
     * @param F
     *                被检查的浮点数
     * @return boolean (若浮点数为非null返回为true)
     */
    public static final boolean isUnEmpty(Float F) {
	return !isEmpty(F);
    }

    /**
     * 判断双精度实数是否为不为空
     * 
     * @param D
     *                被检查的双精度实数
     * @return boolean (若双精度实数为非null返回为true)
     */
    public static final boolean isUnEmpty(Double D) {
	return !isEmpty(D);
    }

}
