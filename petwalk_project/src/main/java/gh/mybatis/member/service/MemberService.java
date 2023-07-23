package gh.mybatis.member.service;

import java.util.List;


import javax.servlet.http.HttpSession;

import gh.mybatis.member.dto.MemberDTO;

public interface MemberService {
	List<MemberDTO> memberSelectAll();
MemberDTO memberSelect(String id);
void memberInsert(MemberDTO memberDTO);
void memberUpdate(MemberDTO memberDTO);
void memberDelete(String id);
 int memberNumber( );
 int memberCount( );
 

 boolean memberLogin(MemberDTO memberDTO, HttpSession session)throws Exception;
 void memberLogout(HttpSession session)throws Exception;
 
 MemberDTO memberSearchId(String name, String email);
 MemberDTO memberSearchPassword(String id, String email);
int memberIdCheck(String id);





}
