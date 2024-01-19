package kr.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Data // 만능
@Getter // getter메소드
@ToString
@Setter // setter메소드
@AllArgsConstructor
public class Class {
	private int class_idx;
	private String class_name;
	private String teacher_name;
	private int kg_idx;
	
	public Class() {
	}
}
