package kr.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Calendar {

	private int CAL_IDX;
	private String CAL_TITLE;
 	private String CAL_CONTENT;
 	private String STARTED_AT;
 	private String ENDED_AT;
	private String CAL_COLOR;
	private String CAL_IMPORTANCE;
	private String USER_ID;
	private int CLASS_IDX; 
	
}


