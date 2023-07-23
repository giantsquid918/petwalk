package gh.mybatis.member.dao;


import java.util.List;
import gh.mybatis.member.dto.MemberDTO;

public interface MemberDAO {

	public List<MemberDTO> selectAll();
	public MemberDTO select(String id);
	public void  insert(MemberDTO memberDTO);
	public  void update(MemberDTO memberDTO);
	public void delete(String id);

	public boolean login(MemberDTO memberDTO) throws Exception;
	public MemberDTO searchId(String name, String email);
	public MemberDTO searchPassword(String id, String email);

	public int memberNumber( );
	public int memberCount( );   // 회원수 조회



}