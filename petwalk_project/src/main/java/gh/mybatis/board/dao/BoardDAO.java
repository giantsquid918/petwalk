package gh.mybatis.board.dao;

import java.util.List;

import gh.mybatis.board.dto.BoardDTO;

public interface BoardDAO {
	public List<BoardDTO> selectAll();
	public BoardDTO select(int num);
	public void insert(BoardDTO BoardDTO); //파일 업로드
	public void update(BoardDTO BoardDTO);
	public void delete(int num);
	public int boardCount();
}
