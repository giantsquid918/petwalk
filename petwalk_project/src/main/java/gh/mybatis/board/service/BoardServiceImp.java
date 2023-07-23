package gh.mybatis.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gh.mybatis.board.dao.BoardDAO;
import gh.mybatis.board.dto.BoardDTO;

@Service
public class BoardServiceImp implements BoardService {
	private final BoardDAO boardDAO;

	@Autowired
	public BoardServiceImp(@Qualifier("boardDAOImp") BoardDAO boardDAO) {
		super();
		this.boardDAO = boardDAO;
	}

	@Override
	public List<BoardDTO> boardSelectAll() {
		return boardDAO.selectAll();
	}

	@Override
	public BoardDTO boardSelect(int num) {
		return boardDAO.select(num);
	}

	@Override
	public boolean boardInsert(BoardDTO BoardDTO) {
		try {
			boardDAO.insert(BoardDTO);
			// 데이터의 무결성 제약조건 제약조건에 (Column unique)대한 예외를 처리한다
		} catch (DataIntegrityViolationException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public void boardUpdate(BoardDTO BoardDTO) {
		boardDAO.update(BoardDTO);
	}

	@Override
	public void boardDelete(int num) {
		boardDAO.delete(num);
	}

	@Override
	public int boardCount() {
	
	return boardDAO.boardCount();	
	}
}
