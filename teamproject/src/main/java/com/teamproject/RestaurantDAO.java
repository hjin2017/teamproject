package com.teamproject;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;


@Mapper
@Repository("dao")
public interface RestaurantDAO {
	public List<RestaurantVO> getAllRestautant();
	public List<RestaurantVO> getdistance(int [] num);
}
