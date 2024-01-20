package kr.smhrd.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.smhrd.entity.Kindergarten;
import kr.smhrd.entity.Profile;

@Mapper
public interface KindergartenMapper {
	public int updateKindergarten(Profile profile);

	public void insertKindergarten(Kindergarten kindergarten);

	public Kindergarten selectKindergarten(String user_id);

}
