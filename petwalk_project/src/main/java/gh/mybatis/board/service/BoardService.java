package gh.mybatis.board.service;

import java.util.List;

import gh.mybatis.board.dto.BoardDTO;

public interface BoardService {
	List<BoardDTO> boardSelectAll();

	BoardDTO boardSelect(int num);

	boolean boardInsert(BoardDTO boardDTO);

	void boardUpdate(BoardDTO BoardDTO);

	void boardDelete(int num);

	int boardCount();
}
