package io.jht.modules.api.annotation;

import java.lang.annotation.*;

/**
 * api接口，忽略Token验证
 * @author zhang.xin
 * @email zhangxin2198@gmail.com
 * @date 2018-10-21 15:44
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface AuthIgnore {

}
