package io.jht.modules.oss.dao;

import org.apache.ibatis.annotations.Mapper;

import io.jht.modules.oss.entity.SysOssEntity;
import io.jht.modules.sys.dao.BaseDao;

/**
 * 文件上传
 * 
 * @author zhang.xin
 * @email zhangxin2198@gmail.com
 * @date 2017-03-25 12:13:26
 */
@Mapper
public interface SysOssDao extends BaseDao<SysOssEntity> {
	
}
