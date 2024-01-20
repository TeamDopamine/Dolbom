package kr.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import kr.smhrd.entity.Record;

@Mapper
public interface RecordMapper {

	List<Record> recordList();

	public void recordDelete(int idx);

	public Record recordContent(int idx);

	public void updateRecord(Record record);

	public void insertRecord(Record record);

	@Select("SELECT * FROM (SELECT t.*, ROWNUM AS rnum FROM (SELECT * FROM tb_daily_record) t WHERE ROWNUM <= #{offset} + #{pageSize}) WHERE rnum > #{offset} AND rnum <= #{offset} + #{pageSize}")
	List<Record> getRecordWithPaging(@Param("offset") int offset, @Param("pageSize") int pageSize);

	public List<Record> goRecordList();

}
