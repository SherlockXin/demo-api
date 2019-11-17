package io.jht.modules.api.dao;

import org.apache.ibatis.annotations.Mapper;

import io.jht.modules.api.entity.TokenEntity;
import io.jht.modules.sys.dao.BaseDao;

/**
 * 用户Token
 * 
 * @author zhang.xin
 * @email zhangxin2198@gmail.com
 * @date 2018-10-21 15:22:07
 */
@Mapper
public interface TokenDao extends BaseDao<TokenEntity> {
    
    TokenEntity queryByUserId(Long userId);

    TokenEntity queryByToken(String token);
	
}
