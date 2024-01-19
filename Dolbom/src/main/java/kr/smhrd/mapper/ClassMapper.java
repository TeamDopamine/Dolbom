package kr.smhrd.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;

import kr.smhrd.entity.Class;

@Mapper
public interface ClassMapper {
	public List<kr.smhrd.entity.Class> showLoginUserClass(String user_id);
	public void deleteClass(int class_idx);
	public void insertClass(kr.smhrd.entity.Class classEntity);
}
