package com.spring.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.command.AnswerModifyCommand;
import com.spring.command.AnswerRegistCommand;
import com.spring.command.PageMaker;
import com.spring.command.QnAModifyCommand;
import com.spring.command.QnARegistCommand;
import com.spring.dto.AnswerVO;
import com.spring.dto.QnAVO;
import com.spring.service.QnAService;

@Controller
public class QnAController {
	
	@Autowired
	private QnAService qnaService;
	
	@Resource(name = "imageUploadPath")
	private String uploadDir;
	@Resource(name = "fileUploadPath")
	private String fileUploadDir;
	
	@GetMapping("main")
	public ModelAndView list(@ModelAttribute PageMaker pageMaker, ModelAndView mnv) throws Exception{
		String url="/qna/main";
		List<QnAVO> qnaList = qnaService.searchList(pageMaker);
		mnv.addObject("qnaList",qnaList);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@GetMapping("/regist")
	public ModelAndView registForm(ModelAndView mnv) {
		String url = "/qna/regist";
		
		mnv.setViewName(url);
		return mnv;
	}
	
	@PostMapping(value = "/regist", produces ="text/plain;charset=utf-8")
	public ModelAndView regist(QnARegistCommand regCommand,ModelAndView mnv) throws Exception{
		String url ="/qna/regist_success";
		QnAVO qna = regCommand.toQnAVO();
		
		qna.getQnaregdate();
		qnaService.regist(qna);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@GetMapping("/detail")
	public ModelAndView detail(int qnaid, HttpSession session, String from, ModelAndView mnv) throws Exception{
		
		String url = "/qna/detail";
		
		QnAVO qna = null;

		if(from != null && from.equals("list")) {
			qnaService.increaseViewCnt(qnaid);
			url = "redirect:/detail?qnaid="+qnaid;
		}
		else {
			qna = qnaService.getQnA(qnaid);
		}
		
		mnv.addObject("qna", qna);
		mnv.setViewName(url);
		return mnv;
	}
	
	@GetMapping("/modifyForm")
	public ModelAndView modifyForm(int qnaid, ModelAndView mnv) throws Exception{
		String url ="/qna/modify";
		
		QnAVO qna = qnaService.detail(qnaid);
		
		mnv.addObject("qna", qna);
		mnv.setViewName(url);
		return mnv;
	}
	
	@PostMapping("/modify")
	public ModelAndView modify(QnAModifyCommand modifyCommand, ModelAndView mnv) throws Exception{
		String url = "/qna/modify_success";
		
		QnAVO qna = modifyCommand.toQnAVO();
		qnaService.modify(qna);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@GetMapping("/remove")
	public ModelAndView remove(int qnaid, ModelAndView mnv) throws Exception{
		String url ="/qna/remove_success";
		
		ModelAndView qna = new ModelAndView();
		qnaService.remove(qnaid);
		mnv.setViewName(url);
		return mnv;
	}
	
	@GetMapping("/regist_answer")
	public ModelAndView ansregistForm(int qnaid, ModelAndView mnv) throws Exception{
		String url = "/qna/regist_answer";
		
		
		mnv.setViewName(url);
		return mnv;
	}
	
	@PostMapping(value="/regist_answer", produces="text/plain;charset=utf-8")
	public ModelAndView ansregist(AnswerRegistCommand answerReg, ModelAndView mnv) throws Exception{
		String url = "/qna/answer_regist_success";
		AnswerVO answer = answerReg.toAnswerVO();
		int qnaid = answer.getAnswerid();
		
		qnaService.registAnswer(answer, qnaid);
		
		mnv.addObject("qnaid", qnaid);
		mnv.setViewName(url);
		return mnv;
	}
	
	@PostMapping("/removeanswer")
	public ModelAndView removeAnswer(int qnaid, int answerid, ModelAndView mnv) throws Exception{
		String url = "/qna/remove_success";
		ModelAndView answer = new ModelAndView();
		qnaService.remove(answerid);
		mnv.addObject("qnaid", qnaid);
		mnv.setViewName(url);
		return mnv;
	}
	
	@GetMapping("/modify_answer")
	public ModelAndView AnswerModifyForm(int answerid, ModelAndView mnv) throws Exception{
		String url = "/qna/modifyanswer";
		
		AnswerVO answer = qnaService.readanswer(answerid);
		
		mnv.addObject("answer", answer);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@PostMapping(value="modify_answer", produces="text/plain;charset=utf-8")
	public ModelAndView modifyAnswer(AnswerModifyCommand answerMod, ModelAndView mnv) throws Exception{
		String url = "/qna/modifyanswer_success";
		AnswerVO answer = answerMod.toAnswerVO();
		int answerid = answer.getAnswerid();
		
		qnaService.registAnswer(answer, answerid);
		
		mnv.addObject("answer", answer);
		mnv.setViewName(url);
		return mnv;
	}
	
	
	//toastUI
	@PostMapping("/tui-editor/image-upload")
	public ResponseEntity<String> uploadEditorImage(HttpServletRequest request, @RequestParam("image") MultipartFile image) {
     try {

            // 디렉토리가 존재하지 않으면 생성
            File directory = new File(uploadDir);
            if (!directory.exists()) {
                directory.mkdirs();
            }

            // 파일명 생성 (랜덤 UUID + 확장자)
            String filename = UUID.randomUUID().toString() + "." + getFileExtension(image.getOriginalFilename());

            // 업로드할 파일 생성
            File file = new File(uploadDir + File.separator + filename);

            // 이미지 파일 저장
            FileOutputStream outputStream = new FileOutputStream(file);
            outputStream.write(image.getBytes());
            outputStream.close();
            // 파일명 반환
            return ResponseEntity.ok(filename);
        } catch (IOException e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Image upload failed.");
        }
    }

    // 파일명에서 확장자 추출
    private String getFileExtension(String filename) {
        int dotIndex = filename.lastIndexOf(".");
        if (dotIndex == -1) {
            return ""; // 확장자 없음
        }
        return filename.substring(dotIndex + 1);
    }
	
    @GetMapping("/tui-editor/image-print")
    public ResponseEntity<byte[]> serveFile(@RequestParam("filename") String filename) {
        Path filePath = Paths.get(uploadDir).resolve(filename);
        try {
            if (Files.exists(filePath) && Files.isReadable(filePath)) {
                byte[] data = Files.readAllBytes(filePath);
                HttpHeaders headers = new HttpHeaders();
                headers.setContentType(MediaType.IMAGE_JPEG);
                return new ResponseEntity<>(data, headers, HttpStatus.OK);
            } else {
                return new ResponseEntity<>(HttpStatus.NOT_FOUND);
            }
        } catch (IOException e) {
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
	
}
