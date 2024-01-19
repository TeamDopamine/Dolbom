package kr.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import kr.smhrd.entity.Calendar;

@Mapper
public interface CalMapper {
	
	public void insertCalendar(Calendar dto);
		
//	정현지 : 
//	@Select("SELECT * FROM TB_CALENDAR WHERE CAL_TITLE = '테스트3' AND TO_CHAR(STARTED_AT,'YYYY-MM-DD')=#{} AND ENDED AND USER_ID?")
//	public CalDto selectIsNull(CalDto dto);

	public List<Calendar> selectCalendar(); 

}
