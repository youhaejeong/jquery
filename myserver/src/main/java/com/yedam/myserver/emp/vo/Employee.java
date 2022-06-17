package com.yedam.myserver.emp.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@JsonInclude(JsonInclude.Include.NON_NULL) // null값은 빼고 저장하도록
@Data // setter/getter 자동생성
@Builder // 생성자없이 값을 초기화 할 수 있음
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Employee {

	private Integer department_id;
	private Integer manager_id;
	private Integer commission_pct;
	private Integer salary;
	private String job_id;
	@JsonFormat(pattern = "yyyy-MM-dd") // date타입일 경우 사용가능
	private Date hire_date;
	@JsonIgnore // phone_number는 변환하지 못하도록 @JsonIgnore 사용
	private String phone_number;
	private String email;
	private String last_name;
	@JsonProperty("fname") // first_name을 fname으로 저장하고 싶을 때 사용
	private String first_name;
	private Integer employee_id;
	
	private Departments department;
	
	
	
}
