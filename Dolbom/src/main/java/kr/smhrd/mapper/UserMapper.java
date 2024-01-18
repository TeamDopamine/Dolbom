package kr.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.smhrd.entity.Profile;
import kr.smhrd.entity.User;

@Mapper
public interface UserMapper {

	public void userInsert(User user);

	public User userSelect(User user);

	@Select("select * from tb_user where user_id=#{user_id}")
	public User idCheck(String inputID);

	public int updateUser(Profile profile);

	public List<User> goAdmin();

	public void deleteUser(String user_id);

}