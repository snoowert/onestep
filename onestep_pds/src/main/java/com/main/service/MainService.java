package com.main.service;

import java.util.List;

import com.onestep.command.PageMaker;
import com.onestep.dto.FreeVO;

public interface MainService {
	//자유게시판 5개
	List<FreeVO> selectMain(PageMaker pageMaker) throws Exception;
	//개발자노트 5개
	
}
