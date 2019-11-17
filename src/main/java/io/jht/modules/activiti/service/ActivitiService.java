/**
 * 
 */
package io.jht.modules.activiti.service;

import java.util.List;

import io.jht.modules.activiti.entity.ActivitiTaskEntity;


/**
 * @author lian.binxiong
 *
 */
public interface ActivitiService {

	List<ActivitiTaskEntity>  queryPersonalList(String assignee);
}
