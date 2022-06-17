package com.yedam.myserver.users.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.yedam.myserver.users.mapper.UserMapper;
import com.yedam.myserver.users.vo.UserVO;

@CrossOrigin(origins = {"*"}, maxAge = 3600)
@RestController
public class UserController {

	@Autowired UserMapper mapper;
	
	// 전체조회
//	@GetMapping("/userSelectAll")
	@GetMapping("/users")
	public List<UserVO> userSelect() {
		return mapper.find();
	}
	
	// 단건조회
//	@GetMapping("/userSelect")
	@GetMapping("/users/{id}")
	public UserVO userSelectList(@PathVariable String id, UserVO vo) { // {id}와 String id 변수명이 같아야 함. 다를 경우 PathVariable(다른이름)
		vo.setId(id); // 기본키값 필요, PathVariable 어노테이션으로 읽을 수 있음
		return mapper.findById(vo);
	}
	
	
	// 등록 (query string, json string 둘 다 가능)
//	@PostMapping("/userInsert")
	@PostMapping("/users")
	public UserVO userInsert(UserVO vo) {
		 mapper.persist(vo);
		 return vo;
	}
	
	// 수정 -> 모든 파라미터는 json string으로만 받을 수 있음. RequestBody어노테이션 필수
//	@PutMapping("/userUpdate")
	@PutMapping("/users")
	public UserVO userUpdate(@RequestBody UserVO vo) {
		 mapper.merge(vo);
		 return vo;
	}	
	
	// 삭제
//	@DeleteMapping("/userDelete")
	@DeleteMapping("/users/{id}")
	public UserVO userDelete(@PathVariable String id, UserVO vo) {
		 vo.setId(id); // 기본키값 필요, PathVariable 어노테이션으로 읽을 수 있음
		 mapper.remove(vo);
		 return vo;
	}		
}
