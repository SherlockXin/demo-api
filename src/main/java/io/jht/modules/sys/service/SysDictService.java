package io.jht.modules.sys.service;

import io.jht.modules.sys.entity.SysDictEntity;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 数据字典表
 * 
 * @author zhang.xin
 * @email 296442062@qq.com
 * @date 2018-11-03 11:57:49
 */
public interface SysDictService {
	
	SysDictEntity queryObject(Long id);
	
	List<SysDictEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(SysDictEntity sysDict);
	
	void update(SysDictEntity sysDict);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
	
	List<SysDictEntity> selectByName(Map<String, Object> map);
	
	HashMap<String, Object> queryListByNames(List<String> nameList);
}
