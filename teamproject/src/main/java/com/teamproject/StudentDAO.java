package com.teamproject;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;


@Mapper
@Repository("stddao")
public interface StudentDAO {
	public List<StudentVO> getAllStudent();
	public void updateImg(StudentVO vo) ;
}
