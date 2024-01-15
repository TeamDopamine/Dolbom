package kr.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data // 만능
@AllArgsConstructor
@Getter // getter메소드
@ToString
@Setter // setter메소드
public class Profile {
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_addr;
	private String user_tel;
	
}
