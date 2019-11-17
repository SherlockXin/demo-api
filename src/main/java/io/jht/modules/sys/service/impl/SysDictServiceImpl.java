package io.jht.modules.sys.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import io.jht.modules.sys.dao.SysDictDao;
import io.jht.modules.sys.entity.SysDictEntity;
import io.jht.modules.sys.service.SysDictService;



@Service("sysDictService")
public class SysDictServiceImpl implements SysDictService {
	@Autowired
	private SysDictDao sysDictDao;
	
	@Override
	public SysDictEntity queryObject(Long id){
		return sysDictDao.queryObject(id);
	}
	
	@Override
	public List<SysDictEntity> queryList(Map<String, Object> map){
		return sysDictDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return sysDictDao.queryTotal(map);
	}
	
	@Override
	public void save(SysDictEntity sysDict){
		sysDictDao.save(sysDict);
	}
	
	@Override
	public void update(SysDictEntity sysDict){
		sysDictDao.update(sysDict);
	}
	
	@Override
	public void delete(Long id){
		sysDictDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		sysDictDao.deleteBatch(ids);
	}

	@Override
	public List<SysDictEntity> selectByName(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * @author zhang.xin
	 * @param nameList
	 * @return
	 */
	@Override
	public HashMap<String, Object> queryListByNames(List<String> nameList) {
		HashMap<String,Object> nameMap = new HashMap<String,Object>();
		List<SysDictEntity> list = sysDictDao.queryListByNames(nameList.toArray());
		for(SysDictEntity dictEn:list ){
			List<SysDictEntity> dicts = (List<SysDictEntity>) nameMap.get(dictEn.getName());
			if(dicts == null){
				dicts = new ArrayList<SysDictEntity>();
			}
			dicts.add(dictEn);
			nameMap.put(dictEn.getName(), dicts);
		}
		return nameMap;
	}
	
}
