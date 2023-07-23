package gh.mybatis.board.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import gh.mybatis.board.dto.BoardDTO;
import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class BoardDAOImp implements BoardDAO {

	private static final Logger logger = LoggerFactory.getLogger(BoardDAOImp.class);
	@Autowired
	private final SqlSessionTemplate SqlSessionTemplate;

	@Override
	public List<BoardDTO> selectAll() {
		return SqlSessionTemplate.selectList("gh.mybatis.board.selectAll");
	}

	@Override
	public BoardDTO select(int num) {
		return SqlSessionTemplate.selectOne("gh.mybatis.board.select", num);
	}

	@Override
	public void insert(BoardDTO BoardDTO) {
		SqlSessionTemplate.insert("gh.mybatis.board.insert", BoardDTO);
	}

	@Override
	public void update(BoardDTO BoardDTO) {
		SqlSessionTemplate.update("gh.mybatis.board.update", BoardDTO);
	}

	@Override
	public void delete(int num) {
		SqlSessionTemplate.delete("gh.mybatis.board.delete", num);
	}

	@Override
	public int boardCount() {
		
		return SqlSessionTemplate.selectOne("gh.mybatis.board.boardCount");
	}

}
