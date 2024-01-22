package kr.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import kr.smhrd.entity.KgerList;

@Mapper
public interface KgerListMapper {

	List<KgerList> kgerList();
	
	public int kgerDelete(int idx);

	@Select("SELECT * FROM (SELECT t.*, ROWNUM AS rnum FROM (SELECT * FROM tb_kindergartener) t WHERE ROWNUM <= #{offset} + #{pageSize} AND CLASS_IDX = #{class_idx}) WHERE rnum > #{offset} AND rnum <= #{offset} + #{pageSize}")
	List<KgerList> getKgerListWithPaging(@Param("offset") int offset, @Param("pageSize") int pageSize, @Param("class_idx") int class_idx);

	public List<KgerList> goKgerList(int class_idx);

}
 