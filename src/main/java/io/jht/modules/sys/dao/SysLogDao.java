package io.jht.modules.sys.dao;

import org.apache.ibatis.annotations.Mapper;

import io.jht.modules.sys.entity.SysLogEntity;

/**
 * 系统日志
 * 
 * @author zhang.xin
 * @email zhangxin2198@gmail.com
 * @date 2017-03-08 10:40:56
 */
@Mapper
public interface SysLogDao extends BaseDao<SysLogEntity> {
	
}
