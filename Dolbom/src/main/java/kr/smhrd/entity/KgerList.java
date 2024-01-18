package kr.smhrd.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;


@Data
@AllArgsConstructor
@NoArgsConstructor
@RequiredArgsConstructor
@Getter
@Setter
public class KgerList {
	private int KGER_IDX;
	@NonNull private String KGER_NAME;
	@NonNull private String KGER_GENDER;
	@NonNull private String KGER_BIRTHDATE;
	@NonNull private String KGER_ADDR;
	@NonNull private String KGER_PARENT_NAME;
	@NonNull private String KGER_PARENT_PHONE;
	private int KG_IDX;
	private int CLASS_IDX;
	@NonNull private String USER_ID;
}
