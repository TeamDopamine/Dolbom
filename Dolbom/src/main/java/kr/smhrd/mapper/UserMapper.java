package kr.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
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
	
	@Select("SELECT * FROM tb_user")
    List<User> getAllUsers();

    // 추가: 페이징을 위한 쿼리
	@Select("SELECT * FROM (SELECT t.*, ROWNUM AS rnum FROM (SELECT * FROM tb_user) t WHERE ROWNUM <= #{offset} + #{pageSize}) WHERE rnum > #{offset} AND rnum <= #{offset} + #{pageSize}")
	List<User> getUsersWithPaging(@Param("offset") int offset, @Param("pageSize") int pageSize);


	
}
