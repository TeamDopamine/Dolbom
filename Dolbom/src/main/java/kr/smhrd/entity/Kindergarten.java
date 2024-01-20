package kr.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Data
@RequiredArgsConstructor
@Getter
@Setter
public class Kindergarten {
	private int kg_idx;
	@NonNull private String kg_name;
	@NonNull private String kg_addr;
	@NonNull private String kg_tel;
	@NonNull private int kg_personnel;
	@NonNull private String user_id;
	
	
	
	public Kindergarten(int kg_idx, @NonNull String kg_name, @NonNull String kg_addr, @NonNull String kg_tel,
			@NonNull int kg_personnel, @NonNull String user_id) {
		super();
		this.kg_idx = kg_idx;
		this.kg_name = kg_name;
		this.kg_addr = kg_addr;
		this.kg_tel = kg_tel;
		this.kg_personnel = kg_personnel;
		this.user_id = user_id;
	}



	public Kindergarten() {
		super();
	}
	

}
