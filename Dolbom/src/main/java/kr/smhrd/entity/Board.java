package kr.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@RequiredArgsConstructor
@Getter
@Setter
@ToString
public class Board {

	private int idx;
	@NonNull private String title;
	@NonNull private String writer;
	@NonNull private String filename;
	@NonNull private String content;
	private String b_date;
	
	
}
