package gh.mybatis.member.service;

import java.util.Enumeration;
import java.util.Hashtable;
import java.util.List;


import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import gh.mybatis.member.dao.MemberDAO;
import gh.mybatis.member.dto.MemberDTO;

@Service
public class MemberServiceImp implements MemberService {
	private final MemberDAO memberDAO;

	@Autowired
	public MemberServiceImp(@Qualifier("memberDAOImp") MemberDAO memberDAO) {
		super();
		this.memberDAO = memberDAO;
		
	}
	@Autowired
	private static Hashtable<String, String> loginUsers = new Hashtable<String, String>();

	@Override
	public List<MemberDTO> memberSelectAll() {

		return memberDAO.selectAll();
	}

	@Override
	public MemberDTO memberSelect(String id) {

		return memberDAO.select(id);
	}

	@Override
	public void memberInsert(MemberDTO memberDTO) {
		try {
			memberDAO.insert(memberDTO);
			// 데이터의 무결성 제약조건 제약조건에 (Column unique)대한 예외를 처리한다
		} catch (DataIntegrityViolationException e) {
			e.printStackTrace();
		}

	}

	@Override
	public void memberUpdate(MemberDTO memberDTO) {
		memberDAO.update(memberDTO);
	}

	@Override
	public void memberDelete(String id) {
		memberDAO.delete(id);
	}

	@Override
	public int memberNumber() {
		return 0;
	}

	@Override
	public int memberCount() {
	
		return memberDAO.memberCount();
	}


	@Override
	public boolean memberLogin(MemberDTO memberDTO, HttpSession session) throws Exception {
		boolean isLogin = isLogin(memberDTO.getId());
		if (!isLogin) {
			boolean result = memberDAO.login(memberDTO);
			if (result) {
				setSession(session, memberDTO);
			}
			return result;
		}
		return !isLogin;
	}
	public boolean isLogin(String id) {
		boolean isLogin = false;

		Enumeration<String> e = loginUsers.keys();
		String key = "";

		while (e.hasMoreElements()) {
			key = (String) e.nextElement();
			if (id.equals(loginUsers.get(key)))
				isLogin = true;
		}

		return isLogin;
	}

	public boolean isUsing(String sessionId) {
		boolean isUsing = false;

		Enumeration<String> e = loginUsers.keys();
		String key = "";
		while (e.hasMoreElements()) {
			key = (String) e.nextElement();
			if (sessionId.equals(loginUsers.get(key)))
				isUsing = true;
		}
		return isUsing;
	}

	public void setSession(HttpSession session, MemberDTO memberDTO) {
		loginUsers.put(session.getId(), memberDTO.getId());
		session.setAttribute("id", memberDTO.getId());
	}

	@Override
	public void memberLogout(HttpSession session) throws Exception {
		loginUsers.remove(session.getId());
		session.invalidate();
	
	}

	@Override
	public MemberDTO memberSearchId(String name, String email) {

		return memberDAO.searchId(name, email);
	}

	@Override
	public MemberDTO memberSearchPassword(String id, String email) {

		return memberDAO.searchPassword(id, email);
	}

	@Override
	public int memberIdCheck(String id) {
		int idcheck = 1;
		if (memberDAO.select(id) == null) {
			idcheck = 0;
		} else {
			idcheck = 1;
		}
		return idcheck;
	}
	

}
