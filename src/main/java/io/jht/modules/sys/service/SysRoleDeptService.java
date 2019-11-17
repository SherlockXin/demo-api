package io.jht.modules.sys.service;

import java.util.List;


/**
 * 角色与部门对应关系
 * 
 * @author zhang.xin
 * @email zhangxin2198@gmail.com
 * @date 2017年6月21日 23:42:30
 */
public interface SysRoleDeptService {
	
	void saveOrUpdate(Long roleId, List<Long> deptIdList);
	
	/**
	 * 根据角色ID，获取部门ID列表
	 */
	List<Long> queryDeptIdList(Long roleId);
	
}
