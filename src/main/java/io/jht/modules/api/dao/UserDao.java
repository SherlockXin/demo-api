package io.jht.modules.api.dao;

import org.apache.ibatis.annotations.Mapper;

import io.jht.modules.api.entity.UserEntity;
import io.jht.modules.sys.dao.BaseDao;

/**
 * 用户
 * 
 * @author zhang.xin
 * @email zhangxin2198@gmail.com
 * @date 2018-10-21 15:22:06
 */
@Mapper
public interface UserDao extends BaseDao<UserEntity> {

    UserEntity queryByMobile(String mobile);
}
