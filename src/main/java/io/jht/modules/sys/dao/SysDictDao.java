package io.jht.modules.sys.dao;

import io.jht.modules.sys.entity.SysDictEntity;
import io.jht.modules.sys.dao.BaseDao;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

/**
 * 数据字典表
 * 
 * @author zhang.xin
 * @email 296442062@qq.com
 * @date 2018-11-03 11:57:49
 */
@Mapper
public interface SysDictDao extends BaseDao<SysDictEntity> {
	
	List<SysDictEntity> queryListByName(Map<String, Object> map);
	List<SysDictEntity> queryAllList();
	SysDictEntity queryByNameAndKey(@Param("name") String name,@Param("key") String key);
	List<SysDictEntity> queryByNameAndKeys(@Param("name") String name,@Param("keyList") String[] keyList);
	List<SysDictEntity> queryListByNames(Object[] name);
	
}
