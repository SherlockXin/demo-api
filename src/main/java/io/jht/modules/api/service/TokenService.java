package io.jht.modules.api.service;


import java.util.Map;

import io.jht.modules.api.entity.TokenEntity;

/**
 * 用户Token
 * 
 * @author zhang.xin
 * @email zhangxin2198@gmail.com
 * @date 2018-10-21 15:22:07
 */
public interface TokenService {

	TokenEntity queryByUserId(Long userId);

	TokenEntity queryByToken(String token);
	
	void save(TokenEntity token);
	
	void update(TokenEntity token);

	/**
	 * 生成token
	 * @param userId  用户ID
	 * @return        返回token相关信息
	 */
	Map<String, Object> createToken(long userId);

}
