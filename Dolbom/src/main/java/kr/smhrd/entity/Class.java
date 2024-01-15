package kr.smhrd.entity;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Data // 만능
@Getter // getter메소드
@ToString
@Setter // setter메소드
public class Class {
	private String class_idx;
	private String class_name;
	private String teacher_name;
	private String kg_idx;
}
