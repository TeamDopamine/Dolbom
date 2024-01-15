package kr.smhrd.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.smhrd.entity.User;

@Mapper
public interface UserMapper {

	public void userInsert(User user);

	public User userSelect(User user);
	
	@Select("select * from tb_user where user_id=#{user_id}")
	public User idCheck(String inputID);

}
