package io.jht.modules.activiti.controller;

import java.util.List;
import java.util.Map;

import org.activiti.engine.task.Task;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.jht.common.utils.PageUtils;
import io.jht.common.utils.Query;
import io.jht.common.utils.R;
import io.jht.modules.activiti.entity.ActivitiTaskEntity;
import io.jht.modules.activiti.service.ActivitiService;
import io.jht.modules.job.entity.ScheduleJobEntity;


/**
 * @author lian.binxiong
 *
 */
@RestController
@RequestMapping("/sys/activiti")
public class ActivitiTaskController {
	@Autowired
	private ActivitiService activitiService;
	
	@RequestMapping("/list")
	@RequiresPermissions("sys:activiti:list")
	public R list(@RequestParam Map<String, Object> params){

		String assignee = "张三";
		Query query = new Query(params);
		assignee = (String) params.get("taskAssignee");
		if(assignee == null || assignee.isEmpty()){
			assignee  = "张三";
		}
	
		List<ActivitiTaskEntity> taskList = activitiService.queryPersonalList(assignee);
		int total = 0;
		if(taskList != null){
			total = taskList.size();
		}
		PageUtils pageUtil = new PageUtils(taskList, total, query.getLimit(), query.getPage());

		return R.ok().put("page", pageUtil);
	}
	

}
