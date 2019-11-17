package io.jht.modules.sys.entity;

import java.io.Serializable;
import java.util.Date;



/**
 * 数据字典表
 * 
 * @author zhang.xin
 * @email 296442062@qq.com
 * @date 2018-11-03 11:57:49
 */
public class SysDictEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//参数id
	private Long id;
	//参数名
	private String name;
	//键值
	private String key;
	//值
	private String value;
	//备注
	private String remark;

	/**
	 * 设置：参数id
	 */
	public void setId(Long id) {
		this.id = id;
	}
	/**
	 * 获取：参数id
	 */
	public Long getId() {
		return id;
	}
	/**
	 * 设置：参数名
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * 获取：参数名
	 */
	public String getName() {
		return name;
	}
	/**
	 * 设置：键值
	 */
	public void setKey(String key) {
		this.key = key;
	}
	/**
	 * 获取：键值
	 */
	public String getKey() {
		return key;
	}
	/**
	 * 设置：值
	 */
	public void setValue(String value) {
		this.value = value;
	}
	/**
	 * 获取：值
	 */
	public String getValue() {
		return value;
	}
	/**
	 * 设置：备注
	 */
	public void setRemark(String remark) {
		this.remark = remark;
	}
	/**
	 * 获取：备注
	 */
	public String getRemark() {
		return remark;
	}
}
