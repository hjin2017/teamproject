package com.teamproject;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("attdao")
public interface AttendDAO {
	public List<AttendVO> getAllList();
	public AttendVO confirmTodayAttend(String name);
	public void updateAttend(AttendVO vo);
	public List<AttendVO> getAttendList(String id);
}
