package gh.mybatis.board.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardDTO {
	
	private int num;
	private int rnum;
	private String id;
	private String name;
	private String subject;
	private String pay;
	private String cellnum;
	private String content;	
	private String attachedfile;	//파일 업로드
	private String oldfile;
	private String writeday;


}
