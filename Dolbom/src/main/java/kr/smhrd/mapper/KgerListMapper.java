package kr.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.smhrd.entity.KgerList;

@Mapper
public interface KgerListMapper {

	List<KgerList> kgerList();
	
	public void kgerDelete(int idx);
}
