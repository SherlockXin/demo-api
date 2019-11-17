package io.jht.common.utils;

/**
 * Redis所有Keys
 *
 * @author zhang.xin
 * @email zhangxin2198@gmail.com
 * @date 2017-07-18 19:51
 */
public class RedisKeys {

    public static String getSysConfigKey(String key){
        return "sys:config:" + key;
    }
}
