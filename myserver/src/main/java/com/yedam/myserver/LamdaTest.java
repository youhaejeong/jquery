package com.yedam.myserver;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import com.yedam.myserver.emp.vo.Employee;

public class LamdaTest {
	
	public static void main(String[] args) {
		List<Employee> list = new ArrayList<>();
		list.add(Employee.builder().email("a@a.mail").salary(1000).build()); // 생성자없이 객체를 만들어주는 lombok의 기능
		list.add(Employee.builder().email("d@d.mail").salary(5000).build());
		list.add(Employee.builder().email("t@t.mail").salary(200).build());
		list.add(Employee.builder().email("f@f.mail").salary(2000).build());
		list.add(Employee.builder().email("b@b.mail").salary(1500).build());
		
		Collections.sort(list, new Comparator<Employee>() { // 익명 클래스 : 클래스 생성과 선언을 동시에
			@Override
			public int compare(Employee o1, Employee o2) {
				return o1.getSalary() - o2.getSalary();
			}}/*익명클래스*/     ); 
		
		// 람다식 : 자바에서의 람다식 -> 부모인터페이스의 오버라이딩이 1개인 경우에만 가능
		Collections.sort(list, (Employee o1, Employee o2) -> o1.getSalary() - o2.getSalary() );
		System.out.println(list);
		for(Employee emp : list) {
			System.out.println(emp.getEmail() + ":" + emp.getSalary());
		}
	}
	
}

//class SalaryComp implements Comparator<Employee> {
//	@Override
//	public int compare(Employee o1, Employee o2) {
//		return o1.getSalary() - o2.getSalary();
//	}
//}

class EmpComp implements Comparator<Employee> {
	
	@Override
	public int compare(Employee o1, Employee o2) { // o1이 클 경우 양수, 작을 경우 음수
		return o1.getEmail().compareTo(o2.getEmail());
	}
}