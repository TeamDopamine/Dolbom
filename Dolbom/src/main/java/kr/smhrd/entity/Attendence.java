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
public class Attendence {
	private int atten_idx;
	private char atten_type;
	private int kger_idx;
	private int class_idx;
	private String atten_time;
	private String atten_memo;
	
	public Attendence() {
		super();
	}
	
	public Attendence(int atten_idx, char atten_type, int kger_idx, int class_idx, String atten_time,
			String atten_memo) {
		super();
		this.atten_idx = atten_idx;
		this.atten_type = atten_type;
		this.kger_idx = kger_idx;
		this.class_idx = class_idx;
		this.atten_time = atten_time;
		this.atten_memo = atten_memo;
	}

	public Attendence(char atten_type, int kger_idx, int class_idx, String atten_time, String atten_memo) {
		super();
		this.atten_type = atten_type;
		this.kger_idx = kger_idx;
		this.class_idx = class_idx;
		this.atten_time = atten_time;
		this.atten_memo = atten_memo;
	}
	
	
	
}
