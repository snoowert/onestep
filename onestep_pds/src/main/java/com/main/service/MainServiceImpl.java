package com.main.service;

import java.util.List;

import com.onestep.command.PageMaker;
import com.onestep.dao.FreeDAO;
import com.onestep.dto.FreeVO;

public class MainServiceImpl implements MainService{
	private FreeDAO freeDAO;
	public void setFreeDAO(FreeDAO freeDAO) {
		this.freeDAO = freeDAO;
	}
	@Override
	public List<FreeVO> selectMain(PageMaker pageMaker) throws Exception {
		// TODO Auto-generated method stub
		return freeDAO.selectFreeList(pageMaker);
	}
	
}
