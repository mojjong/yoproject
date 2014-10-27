package org.yo.web;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.yo.service.BoardService;
import org.yo.vo.BbsVO;
import org.yo.vo.ReplyVO;
import org.yo.web.util.BbsCriteria;
import org.yo.web.util.Criteria;

@Controller
@RequestMapping("/bbs/*")
public class BoardController {
	
	private static Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	private BoardService service;
	
	@RequestMapping("/doA")
	public void doA(@RequestParam(value="p1", defaultValue="") String p1){
		logger.info("doA...............");
		logger.info(p1);
	}
	
	@RequestMapping("/write")
	public String doA(@ModelAttribute("vo") BbsVO vo){	//���������� model ��ü ����
		service.create(vo);
		return "bbs/board";
	}
	
	
	@RequestMapping("/board")
	public String board(@RequestParam(value="page", defaultValue = "1")Integer page, String category, String keyword, Model model){	//���������� model ��ü ����
		Criteria cri = new BbsCriteria();
		
		cri.setCurrentPage(page);
		if(keyword != null && keyword != ""){
			cri.setCategory(category);
			cri.setKeyword(keyword);
			String[] cate = category.split(":");
			
			
			for (String key : cate) {
				cri.addCri(key, keyword);
			}
		}
		
		List<BbsVO> list = service.list(cri);
		
		cri.setCnt(list.get(0).getCnt());
		model.addAttribute("boardList", list);
		model.addAttribute("pageVo", cri);
		return "bbs/newList";
	}
	
	@RequestMapping("/view")
	public String view(Integer bbsno, Model model){
		model.addAttribute("vo", service.read(bbsno));
		model.addAttribute("reList", service.replyList(bbsno));
		return "bbs/viewContent";
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String write(){
		return "bbs/write";
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String writePost(BbsVO vo, Model model){
		service.create(vo.setIsfile("F"));
		model.addAttribute("vo", service.read(vo.getBbsNo()));
		return "bbs/view";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String del(Integer bbsno, Model model){
		service.delete(bbsno);
		return "redirect:/bbs/board";
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modify(Integer bbsno, Model model){
		model.addAttribute("vo", service.read(bbsno));
		return "bbs/modifyContent";
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String update(BbsVO vo, Model model){
		service.update(vo);
		model.addAttribute("vo", service.read(vo.getBbsNo()));
		return "bbs/view";
	}
	
	@RequestMapping(value = "/reModify", method = RequestMethod.GET)
	public String reModify(ReplyVO vo, Model model){
		model.addAttribute("vo", service.replyRead(vo));
		return "bbs/reModifyContent";
	}
	
	@RequestMapping(value = "/reUpdate", method = RequestMethod.POST)
	public String reUpdate(ReplyVO vo, Integer bbsNo, Model model){
		logger.info("첫번째" + bbsNo.toString());
		vo.setBbsNo(bbsNo);
		logger.info("두번째" +vo.toString());
		
		service.replyUpdate(vo);
		return "redirect:/bbs/board";
	}
	
	
	
	@RequestMapping(value = "/reWrite", method = RequestMethod.POST)
	public String reply(ReplyVO vo, Model model){
		
		service.replyCre(vo);
		return "redirect:/bbs/board";
	}
	
	@RequestMapping(value = "/reDelete", method = RequestMethod.GET)
	public String reDelete(Integer replyNo){
		logger.info(replyNo.toString());
		service.replyDelete(replyNo);
		return "redirect:/bbs/board";
	}
	
}
