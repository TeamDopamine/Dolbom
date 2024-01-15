package kr.smhrd.entity;

import java.sql.Date;

import lombok.Data;

@Data
public class User {
	private String user_id;
	private String user_pw;
	private String user_nick;
	private String user_phone;
	private String user_addr;
	private String user_type;
	private Date joined_at;

	
}