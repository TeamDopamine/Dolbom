package kr.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import kr.smhrd.entity.Calendar;

@Mapper
public interface CalMapper {
	public void insertCalendar(Calendar dto);
	public List<Calendar> selectCalendar(int loginUserClassIdx); 

}
