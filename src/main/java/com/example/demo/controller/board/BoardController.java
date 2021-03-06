package com.example.demo.controller.board;

import com.example.demo.config.SessionMember;
import com.example.demo.domain.board.BoardFileVO;
import com.example.demo.domain.board.BoardVO;
import com.example.demo.domain.Criteria;
import com.example.demo.domain.PageDTO;
import com.example.demo.domain.member.dto.MemberDTO;
import com.example.demo.domain.member.dto.vo.Role;
import com.example.demo.domain.member.entity.Member;
import com.example.demo.service.board.BoardService;
import com.example.demo.service.board.ReplyService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

@Controller
@RequestMapping("/board/")
@AllArgsConstructor
public class BoardController {

    @Autowired
    private BoardService service;

    @Autowired
    private ReplyService replyService;

    @GetMapping("register")
    public String register(Model model, HttpSession httpSession){

        SessionMember socialMember = (SessionMember) httpSession.getAttribute("socialMember");
        SessionMember loginMember = (SessionMember) httpSession.getAttribute("loginMember");

        if(socialMember != null){
            model.addAttribute("member", socialMember);
        } else if (loginMember != null){
            model.addAttribute("member", loginMember);
        }
        return "board/register";
    }

    @PostMapping("register")
    public String register(BoardVO board, RedirectAttributes rttr){

        service.register(board);
        rttr.addFlashAttribute("result", board.getBno());

        return "redirect:list";
    }

    @GetMapping("list") //???????????? ?????? ????????? ????????? ????????????????????? ??????
    public String list(Criteria cri, Model model, HttpSession httpSession){

        SessionMember socialMember = (SessionMember) httpSession.getAttribute("socialMember");
        SessionMember loginMember =(SessionMember) httpSession.getAttribute("loginMember");

        if(socialMember != null){
            model.addAttribute("list", service.getList(cri));
            int total = service.getTotal(cri);
            model.addAttribute("pageMaker", new PageDTO(cri, total));
            return "board/list";
            //????????? ???????????? ??????
        } else if (loginMember == null){
                return "redirect:/login";
        }

        model.addAttribute("list", service.getList(cri));
        //pageDTO??? ????????? ??? ????????? model??? ????????? ????????? ??????
        // PageDTO ??? ???????????? ????????? ?????? ????????? ?????? ????????????, ?????? ??? ????????? ?????? ??????????????? ????????? ??? 123 ??????

       int total = service.getTotal(cri);
        model.addAttribute("pageMaker", new PageDTO(cri, total));

        return "board/list";
    }


    @GetMapping("get")
    public String get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model, HttpSession httpSession){

        model.addAttribute("board", service.get(bno));
        return "board/get";
    }




    @GetMapping("modify")
    public String modify(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model){
        model.addAttribute("board", service.get(bno));

        return "board/modify";
    }

    @PostMapping("modify")
    public String modify(BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr){

        if(service.modify(board)){
            rttr.addFlashAttribute("result", "success");
        }

        return "redirect:list" + cri.getListLink();
    }

    @PostMapping("remove")
    public String remove(@RequestParam("bno") Long bno,Criteria cri, RedirectAttributes rttr ){

        List<BoardFileVO> fileList = service.getFileList(bno);

        if(service.remove(bno)){
            deleteFiles(fileList);

            rttr.addAttribute("result","success");
        }

        return "redirect:list" + cri.getListLink();
    }

    private void deleteFiles(List<BoardFileVO> fileList){
//????????? ?????? ??????
        if(fileList == null || fileList.size() == 0){
            return;
        }

        fileList.forEach(file -> {
            try {
       //?????? ??????
            Path filePath = Paths.get("C:\\upload\\"+ file.getUploadPath()+"\\"+file.getUuid()+"_"+ file.getFileName());

             Files.deleteIfExists(filePath); //boolean
        //???????????? ????????? ????????? ????????????
            if(Files.probeContentType(filePath).startsWith("image"));
                Path thumbNail = Paths.get("C:\\upload\\"+ file.getUploadPath()+"\\s_"+file.getUuid()+"_"+ file.getFileName());

                Files.delete(thumbNail);
            } catch (Exception e) {
                e.printStackTrace();
            }
        });
    }

    //??????????????? ????????? ????????? json????????? ???????????? // $.getJSON("/board/getFileList", - get.jsp
    @GetMapping(value = "getFileList",produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<List<BoardFileVO>> getFileList(Long bno){

        return new ResponseEntity<>(service.getFileList(bno), HttpStatus.OK);
    }




}
