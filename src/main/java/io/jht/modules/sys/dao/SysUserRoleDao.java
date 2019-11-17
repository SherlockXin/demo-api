package io.jht.modules.sys.dao;

import org.apache.ibatis.annotations.Mapper;

import io.jht.modules.sys.entity.SysRoleEntity;
import io.jht.modules.sys.entity.SysUserRoleEntity;

import java.util.List;

/**
 * 用户与角色对应关系
 * 
 * @author zhang.xin
 * @email zhangxin2198@gmail.com
 * @date 2016年9月18日 上午9:34:46
 */
@Mapper
public interface SysUserRoleDao extends BaseDao<SysUserRoleEntity> {
	
	/**
	 * 根据用户ID，获取角色ID列表
	 */
	List<Long> queryRoleIdList(Long userId);
	
	/**
	 * 根据用户ID，获取角色实体列表
	 */
	List<SysRoleEntity> queryRoleList(Long userId);
}
