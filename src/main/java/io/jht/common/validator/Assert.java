package io.jht.common.validator;

import org.apache.commons.lang.StringUtils;

import io.jht.common.exception.RRException;

/**
 * 数据校验
 * @author zhang.xin
 * @email zhangxin2198@gmail.com
 * @date 2018-10-21 15:50
 */
public abstract class Assert {

    public static void isBlank(String str, String message) {
        if (StringUtils.isBlank(str)) {
            throw new RRException(message);
        }
    }

    public static void isNull(Object object, String message) {
        if (object == null) {
            throw new RRException(message);
        }
    }
}
