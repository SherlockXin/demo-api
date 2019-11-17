package io.jht.modules.sys.service;

import io.jht.common.utils.R;
import io.jht.modules.sys.entity.SysUserTokenEntity;

/**
 * 用户Token
 * 
 * @author zhang.xin
 * @email zhangxin2198@gmail.com
 * @date 2018-10-21 15:22:07
 */
public interface SysUserTokenService {

	SysUserTokenEntity queryByUserId(Long userId);

	SysUserTokenEntity queryByToken(String token);
	
	void save(SysUserTokenEntity token);
	
	void update(SysUserTokenEntity token);

	/**
	 * 生成token
	 * @param userId  用户ID
	 */
	R createToken(long userId);

}
