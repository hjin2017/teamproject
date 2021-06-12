package com.teamproject;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("meberdao")
public interface MemberDAO {
	void insertMember(MemberVO vo);
	MemberVO getId(String id);
	MemberVO getIdandPass(MemberVO vo);
	List<MemberVO> getStoreInfo(String id);
}
