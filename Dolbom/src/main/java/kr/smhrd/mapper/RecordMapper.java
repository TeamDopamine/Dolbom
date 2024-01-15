package kr.smhrd.mapper;

import java.util.List;

import kr.smhrd.entity.Record;

public interface RecordMapper {

	List<Record> recordList();

	public void recordDelete(int idx);

	public Record recordContent(int idx);

	public void updateRecord(Record record);

	public void insertRecord(Record record);

}
