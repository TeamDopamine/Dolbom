package kr.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.smhrd.entity.Attendence;

@Mapper
public interface AttendenceMapper {

	public void insertAttendence(Attendence attendence);
	public List<Attendence> showAttendence(Attendence attendence);
	public void updateAttendence(Attendence attendence);

}
