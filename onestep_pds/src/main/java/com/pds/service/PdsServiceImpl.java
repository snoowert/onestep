package com.pds.service;

import java.sql.SQLException;
import java.util.List;

import com.pds.dao.PdsDAO;
import com.pds.dao.PdsFileDAO;
import com.pds.vo.PdsFileVO;
import com.pds.vo.PdsVO;
import com.spring.command.PageMaker;

public class PdsServiceImpl implements PdsService{
	PdsDAO pdsDAO;
	public void setPdsDAO(PdsDAO pdsdao) {
		this.pdsDAO = pdsdao;
	}
	PdsFileDAO pdsfileDAO;
	public void setPdsFileDAO(PdsFileDAO pdsfiledao) {
		this.pdsfileDAO = pdsfiledao;
	}
	@Override
	public List<PdsVO> searchList(PageMaker pageMaker) throws SQLException {
		// TODO Auto-generated method stub
		List<PdsVO> PdsList = pdsDAO.selectSearchPdsList(pageMaker);
		return PdsList;
	}

	@Override
	public void regist(PdsVO pds) throws SQLException {
		// TODO Auto-generated method stub
		pdsDAO.insertPds(pds);
	}

	@Override
	public void increaseViewCnt(int pdsid) throws SQLException {
		// TODO Auto-generated method stub
		pdsDAO.increaseViewPoint(pdsid);
	}

	@Override
	public PdsVO getPds(int pdsid) throws SQLException {
		// TODO Auto-generated method stub
		return pdsDAO.selectPdsByPdsid(pdsid);
	}

	@Override
	public void modify(PdsVO pds) throws SQLException {
		// TODO Auto-generated method stub
		pdsDAO.updatePds(pds);
	}

	@Override
	public void remove(int pdsid) throws SQLException {
		// TODO Auto-generated method stub
		pdsDAO.deletePds(pdsid);
	}

	@Override
	public PdsFileVO getAttachByAno(int pdsfileid) throws SQLException {
		// TODO Auto-generated method stub
		return pdsfileDAO.selectPdsFileById(pdsfileid);
	}

	@Override
	public void removeAttachByAno(int pdsfileid) throws SQLException {
		// TODO Auto-generated method stub
		pdsfileDAO.deletePdsFile(pdsfileid);
	}

}
