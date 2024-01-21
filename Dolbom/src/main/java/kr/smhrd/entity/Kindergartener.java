package kr.smhrd.entity;

import lombok.Data;

@Data
public class Kindergartener {
    private int kger_Idx;
    private String kger_Name;
    private char kger_Gender;
    private String kger_Birthdate;
    private String kger_Addr;
    private String kger_Parent_Name;
    private String kger_Parent_Phone;
    private int kg_Idx;
    private int class_Idx;
    private String user_Id;
    
    public Kindergartener() {
        // 기본 생성자
    }

    // 필요에 따라 다른 생성자 추가
}

