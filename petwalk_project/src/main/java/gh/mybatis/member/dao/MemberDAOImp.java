package gh.mybatis.member.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Repository;

import gh.mybatis.member.dto.MemberDTO;
import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class MemberDAOImp implements MemberDAO {

	private static final Logger logger = LoggerFactory.getLogger(MemberDAOImp.class);
	
	@Autowired
	private final SqlSessionTemplate sqlSessionTemplate;


	@Override
	public List<MemberDTO> selectAll() {

		return sqlSessionTemplate.selectList("gh.mybatis.member.selectAll");
	}

	@Override
	public MemberDTO select(String id) {
		return sqlSessionTemplate.selectOne("gh.mybatis.member.select", id);
	}

	@Override
	public void insert(MemberDTO memberDTO) {
		sqlSessionTemplate.insert("gh.mybatis.member.insert", memberDTO);
	}

	@Override
	public void update(MemberDTO memberDTO) {
		sqlSessionTemplate.update("gh.mybatis.member.update", memberDTO);

	}

	@Override
	public void delete(String id) {
		sqlSessionTemplate.delete("gh.mybatis.member.delete", id);

	}

	@Override
	public int memberNumber() {

		return sqlSessionTemplate.selectOne("gh.mybatis.member.memberNumber");
	}



	@Override
	public boolean login(MemberDTO memberDTO) throws Exception {
		String name = sqlSessionTemplate.selectOne("gh.mybatis.member.login", memberDTO);
		return (name == null) ? false : true;
	}

	@Override
	public MemberDTO searchId(String name, String email) {
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("name", name);
		paramMap.put("email", email);
		return sqlSessionTemplate.selectOne("gh.mybatis.member.searchId", paramMap);
	}

	@Override
	public MemberDTO searchPassword(String id, String email) {
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("id", id);
		paramMap.put("email", email);
		return sqlSessionTemplate.selectOne("gh.mybatis.member.searchPassword", paramMap);
	}

	
	// 페이징 처리
	@Override
	public int memberCount() {
		return sqlSessionTemplate.selectOne("gh.mybatis.member.memberCount");
	}

}
