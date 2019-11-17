/**
 * 
 */
package io.jht.modules.activiti.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.activiti.engine.ProcessEngine;
import org.activiti.engine.ProcessEngines;
import org.activiti.engine.task.Task;
import org.springframework.stereotype.Service;

import io.jht.modules.activiti.entity.ActivitiTaskEntity;
import io.jht.modules.activiti.service.ActivitiService;

/**
 * @author lian.binxiong
 *
 */
@Service("activitiService")
public class ActivitiServiceImpl implements ActivitiService {
	
    private ProcessEngine processEngine = ProcessEngines.getDefaultProcessEngine();
    

	/* (non-Javadoc)
	 * @see io.jht.modules.activiti.service.ActivitiService#queryPersonalList(java.lang.String)
	 */
	@Override
	public List<ActivitiTaskEntity> queryPersonalList(String assignee) {
        List<Task> list = processEngine.getTaskService()//与正在执行的任务管理相关的Service  
                       .createTaskQuery()//创建任务查询  
                       .taskAssignee(assignee)//指定个人任查询，指定办理人  
                       .list();  
	List<ActivitiTaskEntity>  activitiTaskList = new ArrayList<ActivitiTaskEntity>();
       if(list!=null && list.size()>0){  
           for(Task task:list){  
               System.out.println("任务ID:"+task.getId());  
               System.out.println("任务名称:"+task.getName());  
               System.out.println("任务的创建时间:"+task.getCreateTime());  
               System.out.println("任务的办理人:"+task.getAssignee());  
               System.out.println("流程实例ID:"+task.getProcessInstanceId());  
               System.out.println("执行对象ID:"+task.getExecutionId());  
               System.out.println("流程定义ID:"+task.getProcessDefinitionId());  
               System.out.println("############################################"); 
               
               ActivitiTaskEntity activitiTask = new ActivitiTaskEntity();
               activitiTask.setTaskId(task.getId());
               activitiTask.setTaskName(task.getName());
               activitiTask.setCreateTime(task.getCreateTime());
               activitiTask.setTaskAssignee(task.getAssignee());
               activitiTask.setProcessInstanceId(task.getProcessInstanceId());
               activitiTask.setExecutionId(task.getExecutionId());
               activitiTask.setProcessDefinitionId(task.getProcessDefinitionId());
               activitiTaskList.add(activitiTask);
           }  
       }  
		return activitiTaskList;
	}

}
