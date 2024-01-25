package kr.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Data 
@Getter 
@ToString
@Setter 
@AllArgsConstructor
public class Class {
	private int class_idx;
	private String class_name;
	private String teacher_name;
	private int kg_idx;
	
	public Class() {
	}
}
