package io.jht.modules.job.dao;

import org.apache.ibatis.annotations.Mapper;

import io.jht.modules.job.entity.ScheduleJobLogEntity;
import io.jht.modules.sys.dao.BaseDao;

/**
 * 定时任务日志
 * 
 * @author zhang.xin
 * @email zhangxin2198@gmail.com
 * @date 2016年12月1日 下午10:30:02
 */
@Mapper
public interface ScheduleJobLogDao extends BaseDao<ScheduleJobLogEntity> {
	
}
