package gh.mybatis.member.controller;
//컨트롤러 객체


import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import gh.mybatis.member.dto.MemberDTO;
import gh.mybatis.member.service.MemberServiceImp;
import lombok.RequiredArgsConstructor;

//빈으로 컨트롤러 스캔을 구성하고 컨트롤러를 구현한다.
@Controller
@RequiredArgsConstructor
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

//의존관계를 자동으로 설정한다.
	@Autowired
	private final MemberServiceImp memberServiceImp;

//전체 회원 정보에 대한 웹 브라우저의 요청을 처리할 URL 매핑명과 처리할 임의의 서블릿 메서드를 설정한다
	@GetMapping("/MemberSelect") // memberSelect

	//뷰에 전달할 객체 정보를 저장하고 객체를 반환하는 메서드를 설정한다.
		public String list(Model model) {
			model.addAttribute("list", memberServiceImp.memberSelectAll());// 전체 회원 정보를 속성으로 추가한다.
			logger.info("list", model);
			model.addAttribute("memberCount", memberServiceImp.memberCount());
			
			return "./member/member_select_all_view"; // 전체 회원 정보를 뷰로 반환한다.
		}

//상세 회원 정보에 대한 웹 브라우저의 요청을 처리할 URL 매핑명과 처리할 임의의 서블릿 메서드를 설정한다
	@GetMapping("/MemberSelectDetail")

//뷰에 전달할 객체 정보를 저장하고 객체를 반환하는 메서드를 선언한다.
	public String detail(Model model, MemberDTO memberDTO) {
		model.addAttribute("memberDTO", memberServiceImp.memberSelect(memberDTO.getId()));// 상세 회원 정보를 속성으로 추가한다. //
																						
		return "./member/member_select_detail_view";// 상세 회원 정보를 뷰로 반환한다.
	}

//회원 정보 등록에 대한 웹 브라우저의 요청을 처리할 URL 매핑명과 처리할 임의의 서블릿 메서드를 설정한다
	@GetMapping("/MemberInsert")
//뷰에 전달할 객체 정보를 저장하고 객체를 반환하는 메서드를 선언한다.
	public String insert() {
		return "./member/member_insert";
	}

//회원 정보 등록에 대한 웹 브라우저의 요청을 처리할 URL 매핑명과 처리할 임의의 서블릿 메서드를 설정한다
	@PostMapping("/MemberInsert")
//뷰에 전달할 객체 정보를 저장하고 객체를 반환하는 메서드를 선언한다.
	public String insert(Model model, MemberDTO memberDTO) {
		model.addAttribute("list", memberServiceImp.memberSelectAll());
		memberServiceImp.memberInsert(memberDTO);
		return "./member/member_insert_view";
	}

//회원 정보 수정에 대한 웹 브라우저의 요청을 처리할 URL 매핑명과 처리할 임의의 서블릿 메서드를 설정한다
	@GetMapping("/MemberUpdate")
//뷰에 전달할 객체 정보를 저장하고 객체를 반환하는 메서드를 선언한다.
	public String update(Model model, MemberDTO memberDTO) {
//상세 회원 정보를 속성으로 추가한다.
		model.addAttribute("memberDTO", memberServiceImp.memberSelect(memberDTO.getId())); 
		return "./member/member_update";
	}

//회원 정보 수정에 대한 웹 브라우저의 요청을 처리할 URL 매핑명과 처리할 임의의 서블릿 메서드를 설정한다
	@PostMapping("/MemberUpdate")
//모델의 이름으로 프로퍼티값을 자동으로 뷰까지 전달하는 @ModelAttribute 어노테이션 생략된 메서드를 선언한다
	public String update(MemberDTO memberDTO) {
		memberServiceImp.memberUpdate(memberDTO);
		return "./member/member_update_view";
	}

	//회원 정보 삭제에 대한 웹 브라우저의 요청을 처리할 URL 매핑명과 처리할 임의의 서블릿 메서드를 설정한다
	@GetMapping("/MemberDelete")
	// 뷰에 전달할 객체 정보를 저장하고 객체를 반환하는 메서드를 선언한다.
	public String delete() {
		return "./member/member_delete";
	}

	//회원 정보 삭제에 대한 웹 브라우저의 요청을 처리할 URL 매핑명과 처리할 임의의 서블릿 메서드를 설정한다
	@PostMapping("/MemberDelete")
	// 모델의 이름으로 프로퍼티값을 자동으로 뷰까지 전달하는 @ModelAttribute 어노테이션 생략된 메서드를 선언한다
	public String delete(MemberDTO memberDTO) {
		memberServiceImp.memberDelete(memberDTO.getId());
		return "./member/member_delete_view";
	}

	@RequestMapping("/Home")
	public String homePage() {

		return "../../index";

	}

	@RequestMapping("/LoginPage")
	public String loginPage() {

		return "./login/login";

	}

	@RequestMapping("/Login")
	public ModelAndView login(@ModelAttribute MemberDTO memberDTO, HttpSession session) throws Exception {
		boolean result = memberServiceImp.memberLogin(memberDTO, session);
		ModelAndView mav = new ModelAndView();
		if (result == true) {
			mav.setViewName("redirect:/Home");

		} else {
			mav.setViewName("/login/login");
		}
		return mav;

	}

	@RequestMapping("/Logout")
	public String logout(HttpSession session) throws Exception {
		memberServiceImp.memberLogout(session);
		return "/login/logout";
	}
	
	
	
	@GetMapping("/SearchId")
	public String searchId() {
		return"./login/id_search";
	}
	
	@PostMapping("/SearchId")
	public String searchId(Model model, MemberDTO memberDTO) {
		model.addAttribute("searchId", memberServiceImp.memberSearchId(memberDTO.getName(), memberDTO.getEmail()));
		return "./login/id_search_view";
	}
	
	@GetMapping("/SearchPassword")
	public String searchPassword() {
		return"./login/password_search";
	}
	
	@PostMapping("/SearchPassword")
	public String searchPassword(Model model, MemberDTO memberDTO) {
		model.addAttribute("searchPassword", memberServiceImp.memberSearchPassword(memberDTO.getId(), memberDTO.getEmail()));
		return "./login/password_search_view";
	}

	  @RequestMapping("/IdCheck")
	   public void idCheck(@RequestParam String id, HttpServletResponse res) throws Exception {
	       int result = 0;
	       if (memberServiceImp.memberIdCheck(id) != 0) {
	           result = 1;
	       }
	       res.getWriter().print(result);
	   }



}