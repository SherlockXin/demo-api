package io.jht.modules.sys.dao;

import org.apache.ibatis.annotations.Mapper;

import io.jht.modules.sys.entity.SysUserTokenEntity;

/**
 * 系统用户Token
 * 
 * @author zhang.xin
 * @email zhangxin2198@gmail.com
 * @date 2018-10-21 15:22:07
 */
@Mapper
public interface SysUserTokenDao extends BaseDao<SysUserTokenEntity> {
    
    SysUserTokenEntity queryByUserId(Long userId);

    SysUserTokenEntity queryByToken(String token);
	
}
