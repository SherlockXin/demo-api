package io.jht.modules.job.dao;

import org.apache.ibatis.annotations.Mapper;

import io.jht.modules.job.entity.ScheduleJobEntity;
import io.jht.modules.sys.dao.BaseDao;

import java.util.Map;

/**
 * 定时任务
 * 
 * @author zhang.xin
 * @email zhangxin2198@gmail.com
 * @date 2016年12月1日 下午10:29:57
 */
@Mapper
public interface ScheduleJobDao extends BaseDao<ScheduleJobEntity> {
	
	/**
	 * 批量更新状态
	 */
	int updateBatch(Map<String, Object> map);
}
