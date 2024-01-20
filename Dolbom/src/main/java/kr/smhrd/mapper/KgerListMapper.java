package kr.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import kr.smhrd.entity.KgerList;

@Mapper
public interface KgerListMapper {

	List<KgerList> kgerList();
	
	public void kgerDelete(int idx);

	@Select("SELECT * FROM (SELECT t.*, ROWNUM AS rnum FROM (SELECT * FROM tb_kindergartener) t WHERE ROWNUM <= #{offset} + #{pageSize}) WHERE rnum > #{offset} AND rnum <= #{offset} + #{pageSize}")
	List<KgerList> getKgerListWithPaging(@Param("offset") int offset, @Param("pageSize") int pageSize);

	public List<KgerList> goKgerList();

	
}
