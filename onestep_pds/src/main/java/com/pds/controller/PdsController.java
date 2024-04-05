package com.pds.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
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

import com.pds.service.PdsService;
import com.pds.vo.PdsVO;
import com.spring.command.PageMaker;

@Controller
public class PdsController {
	@Autowired
	PdsService pdsService;
	
	@Resource(name = "imageUploadPath")
	private String uploadDir;

	//목록
	@GetMapping("/list")
	public ModelAndView list(ModelAndView mnv, @ModelAttribute PageMaker pagemaker) throws SQLException{
		String url = "/pds/list";
		
		List<PdsVO> pdsList = pdsService.searchList(pagemaker);
		mnv.addObject("pdsList", pdsList);
		mnv.setViewName(url);
		return mnv;
	}
	@GetMapping("/detail")
	public ModelAndView detail(ModelAndView mnv, int pdsid, String from) throws Exception{
		String url = "/pds/detail";
		PdsVO pds = pdsService.getPds(pdsid);
		
		if(from != null && from.equals("list")) {
			pdsService.increaseViewCnt(pdsid);
			url = "redirect:/detail?pdsid="+pdsid;
		}
		else {
			pds = pdsService.getPds(pdsid);
		}
		
		mnv.addObject("pds",pds);
		mnv.setViewName(url);
		return mnv;
	}
	//글작성폼
	@GetMapping("/registForm")
	public ModelAndView registForm(ModelAndView mnv) throws SQLException{
		String url = "/pds/regist";
		
		mnv.setViewName(url);
		return mnv;
	}
	//글작성
	@PostMapping("/regist")
	public ModelAndView regist(ModelAndView mnv) throws SQLException{
		String url = "/pds/regist_success";
		
		
		mnv.setViewName(url);
		return mnv;
	}
	//글수정폼
	@GetMapping("/modifyForm")
	public ModelAndView modifyForm(ModelAndView mnv) throws SQLException{
		String url = "/pds/modify";
		
		mnv.setViewName(url);
		return mnv;
	}
	//글수정
	@PostMapping("/modify")
	public ModelAndView modify(ModelAndView mnv) throws SQLException{
		String url = "/pds/modify_success";
		
		mnv.setViewName(url);
		return mnv;
	}
	//글삭제
	//파일불러오기
	//파일업로드
	
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
