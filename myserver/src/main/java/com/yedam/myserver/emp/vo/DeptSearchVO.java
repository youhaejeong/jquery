package com.yedam.myserver.emp.vo;

import lombok.Data;

@Data
public class DeptSearchVO {
	private int departmentId;
	private String departmentName;
	private int managerId;
	private int locationId;
}
