package project.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Notice {
	private int noticeid;
	private String title;
	private String contents;
	private String writer_uid;
	private String reg_date;
	private String mod_date;
	private int view_count;
	private String delete_yn;
	private String fixed_yn;
	
	public boolean doMod() {
		return !reg_date.equals(mod_date);
	}
}
