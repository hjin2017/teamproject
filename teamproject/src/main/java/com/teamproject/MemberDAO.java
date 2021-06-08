package com.teamproject;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("meberdao")
public interface MemberDAO {
	void insertMember(MemberVO vo);
	MemberVO getId(String id);
	MemberVO getIdandPass(MemberVO vo);
}
