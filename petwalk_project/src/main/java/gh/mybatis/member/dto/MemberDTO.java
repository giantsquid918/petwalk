package gh.mybatis.member.dto;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class MemberDTO {
	
	private int rnum;
	private int num;
	private int memberCount;
	private String id;
	private String nickname;
	private String password;
	private String name;
	private String cellnum;
	private String email;
	private String birthday;
	private String joinday;
	
	
}
