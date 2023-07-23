package gh.mybatis.board.controller;



import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import gh.mybatis.board.dto.BoardDTO;
import gh.mybatis.board.service.BoardServiceImp;
import lombok.RequiredArgsConstructor;
@Controller
@RequiredArgsConstructor
public class BoardController {
private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
@Autowired
private final BoardServiceImp boardServiceImp;
private String convertToValidAscii(String fileName) {
    // 유효한 ASCII 문자 패턴을 정의합니다 (a-zA-Z0-9 등)
    Pattern validAsciiPattern = Pattern.compile("[\\x20-\\x7E]+");

    StringBuilder convertedName = new StringBuilder();
    for (char ch : fileName.toCharArray()) {
        if (validAsciiPattern.matcher(String.valueOf(ch)).matches()) {
            convertedName.append(ch);
        }
    }
    return new String(convertedName.toString().getBytes(StandardCharsets.UTF_8), StandardCharsets.UTF_8);
  }




@GetMapping("/BoardSelect") //BoardSelect

//뷰에 전달할 객체 정보를 저장하고 객체를 반환하는 메서드를 설정한다.
 public String list(Model model) {
    model.addAttribute("list", boardServiceImp.boardSelectAll());// 전체 게시글 정보를 속성으로 추가한다.
    logger.info("list", model);
    model.addAttribute("boardCount", boardServiceImp.boardCount());
    return "./board/board_select_all_view"; // 전체 게시글 정보를 뷰로 반환한다.
 }

//상세 게시글 정보에 대한 웹 브라우저의 요청을 처리할 URL 매핑명과 처리할 임의의 서블릿 메서드를 설정한다
 @GetMapping("/BoardSelectDetail")
 
//뷰에 전달할 객체 정보를 저장하고 객체를 반환하는 메서드를 선언한다.
 public String detail(Model model, BoardDTO BoardDTO) {
    model.addAttribute("boardDTO", boardServiceImp.boardSelect(BoardDTO.getNum()));// 상세 게시글 정보를 속성으로 추가한다. 
    return "./board/board_select_detail_view";// 상세 게시글 정보를 뷰로 반환한다.
 }

//게시글 정보 등록에 대한 웹 브라우저의 요청을 처리할 URL 매핑명과 처리할 임의의 서블릿 메서드를 설정한다
 @GetMapping("/BoardInsert")
//뷰에 전달할 객체 정보를 저장하고 객체를 반환하는 메서드를 선언한다.
 public String insert() {
    return "./board/board_insert";
 }
 
//게시글 정보 등록에 대한 웹 브라우저의 요청을 처리할 URL 매핑명과 처리할 임의의 서블릿 메서드를 설정한다
 @PostMapping("/BoardInsert")
//뷰에 전달할 객체 정보를 저장하고 객체를 반환하는 메서드를 선언한다.
 public String insert(Model model, @RequestParam("attachedfile") MultipartFile file, HttpServletRequest request) {
	 HttpSession session = request.getSession();
     String loggedInId = (String) session.getAttribute("id");
     
     BoardDTO boardDTO = new BoardDTO();
     boardDTO.setId(loggedInId);

     String saveFolder = "./boardUpload";
     String realFolder = request.getSession().getServletContext().getRealPath(saveFolder);
     String attachedFileName = null;

     try {
         if (!file.isEmpty()) {
             String originalFilename = file.getOriginalFilename();
             String filePath = realFolder + File.separator + originalFilename;
             file.transferTo(new File(filePath));
             attachedFileName = originalFilename;
         }
         boardDTO.setSubject(request.getParameter("subject"));
         boardDTO.setContent(request.getParameter("content"));
         boardDTO.setPay(request.getParameter("pay"));
         boardDTO.setCellnum(request.getParameter("cellnum"));
         boardDTO.setId(request.getParameter("id"));
         boardDTO.setAttachedfile(attachedFileName);

         boolean result = boardServiceImp.boardInsert(boardDTO);
         model.addAttribute("result", result);
     } catch (IOException e) {
         e.printStackTrace();
         model.addAttribute("result", false);
     }

	model.addAttribute("list", boardServiceImp.boardSelectAll());
     return "./board/board_insert_view";
 }

//게시글 정보 수정에 대한 웹 브라우저의 요청을 처리할 URL 매핑명과 처리할 임의의 서블릿 메서드를 설정한다
 @GetMapping("/BoardUpdate")
//뷰에 전달할 객체 정보를 저장하고 객체를 반환하는 메서드를 선언한다.
 public String update(Model model, BoardDTO BoardDTO) {
//상세 게시글 정보를 속성으로 추가한다.
    model.addAttribute("boardDTO", boardServiceImp.boardSelect(BoardDTO.getNum())); 
    return "./board/board_update";
 }

//게시글 정보 수정에 대한 웹 브라우저의 요청을 처리할 URL 매핑명과 처리할 임의의 서블릿 메서드를 설정한다
 @PostMapping("/BoardUpdate")
//모델의 이름으로 프로퍼티값을 자동으로 뷰까지 전달하는 @ModelAttribute 어노테이션 생략된 메서드를 선언한다
 public String update(BoardDTO BoardDTO) {
    boardServiceImp.boardUpdate(BoardDTO);
    return "./board/board_update_view";
 }

 @GetMapping("/BoardDelete")
    public String delete() {
       return "./board/board_delete" ;
    }

 @PostMapping("/BoardDelete")
 //모델의 이름으로 프로퍼티값을 자동으로 뷰까지 전달하는 @ModelAttribute 어노테이션 생략된 메서드를 선언한다
    public String delete(BoardDTO BoardDTO) {
    boardServiceImp.boardDelete(BoardDTO.getNum());
       return "./board/board_delete_view";
    }
 
 @GetMapping("/BoardUpload")
 public void download(Model model, BoardDTO boardDTO, HttpServletRequest request ,HttpServletResponse response) {
     // 상세 게시글 정보를 조회합니다.
     BoardDTO result = boardServiceImp.boardSelect(boardDTO.getNum());
     model.addAttribute("boardDTO", result);

     // 파일 다운로드 처리
     String fileName = result.getAttachedfile();
     String convertedFileName = convertToValidAscii(fileName); // 파일 이름을 유효한 ASCII로 변환
     String savePath = "./boardUpload";
     String downPath = request.getServletContext().getRealPath(savePath);
     String filePath = downPath + File.separator + fileName;
     try {
		fileName = URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "%20");
	} catch (UnsupportedEncodingException e1) {
		e1.printStackTrace();
	}
     
     // 파일 다운로드 처리 로직
     try {
         File file = new File(filePath);
         FileInputStream fis = new FileInputStream(file);
         String mimeType = request.getServletContext().getMimeType(filePath);

         response.setContentType(mimeType);
         response.setContentLength((int) file.length());
         response.setHeader("Content-Disposition", "attachment; filename=\"" + convertedFileName + "\"");

         OutputStream os = response.getOutputStream();
         byte[] buffer = new byte[4096];
         int bytesRead = -1;
         while ((bytesRead = fis.read(buffer)) != -1) {
             os.write(buffer, 0, bytesRead);
         }
         fis.close();
         os.close();
     } catch (Exception e) {
         e.printStackTrace();
     }
 }
}
