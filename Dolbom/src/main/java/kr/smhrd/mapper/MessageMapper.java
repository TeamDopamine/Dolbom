package kr.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.smhrd.entity.Message;
import lombok.NonNull;

@Mapper
public interface MessageMapper {

	public int messageSend(Message msg);

	public List<Message> messageList(@NonNull String email);

	public void deleteMessage(int num);

	public void deleteMessageAll(@NonNull String email);

}
