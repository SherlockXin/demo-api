package io.jht.modules.sys.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.jht.modules.sys.entity.SysDictEntity;
import io.jht.modules.sys.service.SysDictService;
import io.jht.common.annotation.SysLog;
import io.jht.common.utils.PageUtils;
import io.jht.common.utils.Query;
import io.jht.common.utils.R;




/**
 * 数据字典表
 * 
 * @author zhang.xin
 * @email 296442062@qq.com
 * @date 2018-11-03 11:57:49
 */
@RestController
@RequestMapping("sysdict")
public class SysDictController {
	@Autowired
	private SysDictService sysDictService;
	
	/**
	 * 列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("sysdict:list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);

		List<SysDictEntity> sysDictList = sysDictService.queryList(query);
		int total = sysDictService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(sysDictList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@RequestMapping("/info/{id}")
	@RequiresPermissions("sysdict:info")
	public R info(@PathVariable("id") Long id){
		SysDictEntity sysDict = sysDictService.queryObject(id);
		
		return R.ok().put("sysDict", sysDict);
	}
	
	/**
	 * 保存
	 */
	@RequestMapping("/save")
	@RequiresPermissions("sysdict:save")
	public R save(@RequestBody SysDictEntity sysDict){
		sysDictService.save(sysDict);
		
		return R.ok();
	}
	
	
	/**
	 * 根据名称查询字典
	 */
	@RequestMapping("/info/selectByName")
//	@RequiresPermissions("sysdict:list")
	public R selectByName(@RequestParam Map<String,Object> params){

		List<SysDictEntity> sysDictList = sysDictService.selectByName(params);
		
		return R.ok().put("dict", sysDictList);
	}
	
	
	/**
	 * @author zhang.xin
	 * 根据名称列表查询字典
	 */
	@SysLog("预查询-查询数据字典")
	@RequestMapping("/listByNames")
//	@RequiresPermissions("sysdict:list")
	public R listByNames(@RequestBody Map<String, Object> models){
		
		List<String> nameList = (ArrayList<String>)models.get("names"); 
		if(nameList == null || nameList.isEmpty()){
			return R.error("上送数据不合法：数据字典名称为空");
		}
		
		HashMap<String, Object> nameMap = sysDictService.queryListByNames(nameList);
		
		return R.ok(nameMap);
	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
	@RequiresPermissions("sysdict:update")
	public R update(@RequestBody SysDictEntity sysDict){
		sysDictService.update(sysDict);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("sysdict:delete")
	public R delete(@RequestBody Long[] ids){
		sysDictService.deleteBatch(ids);
		
		return R.ok();
	}
	
}
