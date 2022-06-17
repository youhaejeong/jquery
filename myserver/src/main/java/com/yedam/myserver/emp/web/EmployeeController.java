package com.yedam.myserver.emp.web;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.yedam.myserver.emp.mapper.EmployeeMapper;
import com.yedam.myserver.emp.vo.Departments;
import com.yedam.myserver.emp.vo.Employee;

@RestController
@CrossOrigin(origins = {"http://127.0.0.1:5500"}) // 다음 주소에서 오는 요청은 받아줌
public class EmployeeController {
	private static final Logger logger = 
			LoggerFactory.getLogger(EmployeeController.class);
	
	@Autowired
	private EmployeeMapper employeeDao;
	
	//사원검색
	//@ResponseBody -> @RestController로 받을 경우 생략가능
	@RequestMapping(value="/empSelect")
	public List<Employee> selectDepartment() {
		return employeeDao.findEmployees();
	}	
	
	//부서와 직업 검색
	@RequestMapping(value="/empDeptJob")
	public Map<String, Object> jobDeptList() {
		Map<String, Object> map = new HashMap<>();
		map.put("jobs", employeeDao.findJobs());
		map.put("depts", employeeDao.findDepartments());
		return map;		
	}	
	
	//사원등록
	@RequestMapping(value="/empInsert", method=RequestMethod.POST )
	public  Employee insertEmployees(Employee bean, HttpServletResponse response) {
		employeeDao.persist(bean);
		return bean;
	}
	
	//사원정보수정
	@RequestMapping(value="/empUpdate", method=RequestMethod.POST )
	public  Employee updateEmployees(Employee bean, HttpServletResponse response) {
		employeeDao.merge(bean);
		return bean;
	}	
	
	//사원삭제
	@RequestMapping(value="/empDelete", method=RequestMethod.POST )
	public  Employee deleteEmployees(Employee bean, HttpServletResponse response) {
		employeeDao.remove(bean);
		return bean;
	}	
	
	// 부서별인원수
	@RequestMapping("empStat")
	public List<Map> empStat(){
		return employeeDao.empStat();
	}
	
}
