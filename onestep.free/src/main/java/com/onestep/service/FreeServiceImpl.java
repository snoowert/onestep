package com.onestep.service;

import java.sql.SQLException;
import java.util.List;

import com.onestep.dao.FreeCommentDAO;
import com.onestep.dao.FreeDAO;
import com.onestep.command.PageMaker;
import com.onestep.dto.FreeCommentVO;
import com.onestep.dto.FreeVO;

public class FreeServiceImpl implements FreeService{
	
	private FreeDAO FreeDAO;
	public void setFreeDAO(FreeDAO freeDAO) {
		this.FreeDAO = freeDAO;
	}
	private FreeCommentDAO FreeCommentDAO;
	public void setFreeCommentDAO(FreeCommentDAO freeCommentDAO) {
		this.FreeCommentDAO = freeCommentDAO;
	}

	@Override
	public List<FreeVO> searchList(PageMaker pageMaker) throws SQLException {
		List<FreeVO> freeList = FreeDAO.selectFreeList(pageMaker);
		
		if(freeList !=null) {
			for(FreeVO free : freeList) {
			int freeid = free.getFreeid();
		}
	}
				
		int listTotalCount = FreeDAO.selectFreeListCount(pageMaker);
		pageMaker.setTotalCount(listTotalCount);
		
		return freeList;
	}

	@Override
	public void increaseFreeViewPoint(int freeid) throws SQLException {
		FreeDAO.increaseFreeViewPoint(freeid);
	}

	@Override
	public FreeVO detail(int freeid) throws SQLException {
		return FreeDAO.selectFreeByFreeId(freeid);
	}

	@Override
	public void regist(FreeVO free) throws SQLException {
		int freeid = FreeDAO.selectFreeSeqNext();
		free.setFreeid(freeid);
		FreeDAO.insertFree(free);		
	}

	@Override
	public void modify(FreeVO free) throws SQLException {
		FreeDAO.updateFree(free);
		int freeid = free.getFreeid();
		
	}

	@Override
	public void remove(int freeid) throws SQLException {
		FreeDAO.deleteFree(freeid);
		
	}

	@Override
	public FreeCommentVO readcomment(int commentid) throws SQLException {
		return FreeCommentDAO.selectFreeByCommentId(commentid);
	}

	@Override
	public void registcomment(FreeCommentVO freecomment, int freeid) throws SQLException {
		freecomment.setFreeid(freeid);
		FreeCommentDAO.insertFreeComment(freecomment);
		
	}

	@Override
	public void modifycomment(FreeCommentVO freecomment) throws SQLException {
		FreeCommentDAO.updateFreeComment(freecomment);
				
	}

	@Override
	public void removecomment(int commentid) throws SQLException {
		FreeCommentDAO.deleteFreeComment(commentid);
		
	}

}
