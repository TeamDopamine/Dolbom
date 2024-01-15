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
public class Record {
	private int record_idx;
	@NonNull private String edu_name;
	@NonNull private String user_id;
	private int edu_headcount;
	@NonNull private String edu_subject;
	@NonNull private String edu_content;
	@NonNull private String edu_time;
	@NonNull private String edu_photo;
	@NonNull private String edu_etc;
	private int class_idx;
}
