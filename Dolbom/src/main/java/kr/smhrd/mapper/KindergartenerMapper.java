package kr.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.smhrd.entity.Kindergartener;

@Mapper
public interface KindergartenerMapper {
	public List<Kindergartener> findKinderOfClass(long class_idx);

}
