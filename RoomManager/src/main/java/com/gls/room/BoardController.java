package com.gls.room;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gls.room.board.BoardService;
import com.gls.room.board.BoardVO;

@Controller
@RequestMapping(value = "board")
public class BoardController {

	@Autowired
	BoardService boardService;
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String boardlist(Model model) {
		model.addAttribute("list", boardService.getBoardList());
		return "boardList";
	}
	@RequestMapping(value = "/reserve", method = RequestMethod.GET)
	public String addPost() {
		System.out.println("Hey there");
		return "reserve";
	}
//
//	@RequestMapping(value = "/list", method = RequestMethod.GET)
//	public String boardlist(Model model, 
//			@RequestParam(required = false, defaultValue = "1") int page,
//			@RequestParam(required = false, defaultValue = "1") int range, 
//			@RequestParam(required = false, defaultValue = "2") int lost,
//			@RequestParam(required = false, defaultValue = "title") String searchType,
//			@RequestParam(required = false) String keyword ) throws Exception {
//
//		// 페이징 계산을 위해 Pagination 클래스에 보내야 할 파라미터에는 '현재 페이지'와 '현재 페이지 범위', 그리고 '게시물의 총
//		// 개수'가 있다.
//		// lost의 경우 2가 all / 1이 found / 0이 lost이다.
//
//		Search search = new Search();
//		search.setSearchType(searchType);
//		search.setKeyword(keyword);
//		
//		int listCnt = 2;
//
//		// 전체 게시글 개수
//		if (lost == 2) { // 전체 게시물
//			listCnt = boardService.getBoardListCnt(search);
//		} else if (lost == 1) { // Found 게시물
//			listCnt = boardService.getBoardListFoundCnt();
//		} else if (lost == 0) { // Lost 게시물
//			listCnt = boardService.getBoardListLostCnt();
//		}
//
//		search.pageInfo(page, range, listCnt, lost);
//
//		// Pagination 객체생성
//		Pagination pagination = new Pagination();
//		pagination.pageInfo(page, range, listCnt, lost);
//		model.addAttribute("pagination", pagination);
//
////		model.addAttribute("list", boardService.getBoardList());
//		if (lost == 2) {
//			model.addAttribute("list", boardService.getBoardList(search));
//		} else if (lost == 1) {
//			model.addAttribute("list", boardService.getBoardListFound(pagination));
//		} else if (lost == 0) {
//			model.addAttribute("list", boardService.getBoardListLost(pagination));
//		}
//		return "list";
//	}
//
//	@RequestMapping(value = "/my_page", method = RequestMethod.GET)
//	public String myPage() {
//		return "my_page";
//	}
//
//	@RequestMapping(value = "/log_out", method = RequestMethod.GET)
//	public String logout() {
//		return "log_out";
//	}
//
//	@RequestMapping(value = "/chat_page", method = RequestMethod.GET)
//	public String chatpage() {
//		return "chat_page";
//	}
//
//	@RequestMapping(value = "/add", method = RequestMethod.GET)
//	public String addPost() {
//		return "addpostform";
//	}

	@RequestMapping(value = "/addok", method = RequestMethod.POST)
	public String addPostOK(@ModelAttribute BoardVO vo, Model model) {
		System.out.println("DEBUGGING in addok");
		if (boardService.insertBoard(vo) == 0)
			System.out.println("데이터 추가 실패");
		else
			System.out.println("데이터 추가 성공!!");
		return "redirect:list";
	}
	

//	@RequestMapping(value = "/editform/{id}", method = RequestMethod.GET)
//	public String editPost(@PathVariable("id") int id, Model model) {
//		BoardVO boardVO = boardService.getBoard(id);
//		model.addAttribute("u", boardVO);
//		return "editform";
//	}
//
//	@RequestMapping(value = "/editok", method = RequestMethod.POST)
//	public String editPostOk(BoardVO vo, RedirectAttributes rttr) {
//		if (boardService.updateBoard(vo) == 0) {
//			System.out.println("데이터 수정 실패 ");
//		}
//
//		else {
//			System.out.println("데이터 수정 성공!!!");
//		}
//
//		return "redirect:list";
//	}
//
//	@RequestMapping(value = "/deleteok/{id}", method = RequestMethod.GET)
//	public String deletePost(@PathVariable("id") int id, RedirectAttributes rttr) {
//		int i = boardService.deleteBoard(id);
//		if (i == 0) {
//			System.out.println("데이터 삭제 실패 ");
//		} else {
//			System.out.println("데이터 삭제 성공!!!");
//			rttr.addFlashAttribute("process_result", "delete success");
//		}
//
//		return "redirect:../list";
//	}

}