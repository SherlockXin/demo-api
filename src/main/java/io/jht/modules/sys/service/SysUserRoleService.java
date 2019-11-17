package io.jht.modules.sys.service;

import java.util.List;

import io.jht.modules.sys.entity.SysRoleEntity;



/**
 * 用户与角色对应关系
 * 
 * @author zhang.xin
 * @email zhangxin2198@gmail.com
 * @date 2016年9月18日 上午9:43:24
 */
public interface SysUserRoleService {
	
	void saveOrUpdate(Long userId, List<Long> roleIdList);
	
	/**
	 * 根据用户ID，获取角色ID列表
	 */
	List<Long> queryRoleIdList(Long userId);
	
	/**
	 * 根据用户ID，获取角色实体列表
	 */
	List<SysRoleEntity> queryRoleList(Long userId);
	
	void delete(Long userId);
}
