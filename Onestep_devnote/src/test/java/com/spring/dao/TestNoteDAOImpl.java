package com.spring.dao;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.spring.command.PageMaker;
import com.spring.dto.NoteVO;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:com/spring/context/root-context.xml")
@Transactional
public class TestNoteDAOImpl {
	
	@Autowired
	NoteDAO noteDAO;
	
	@Test
	public void testSelectNoteList() throws SQLException {
	
		 PageMaker pageMaker  = new PageMaker();
		 pageMaker.setPage(1);
		 pageMaker.setPerPageNum(10);
		 
		 List<NoteVO> noteList = noteDAO.selectNoteList(pageMaker);
		 Assert.assertEquals(1, noteList.size());
		 
		
	}
	
	@Test
	public void testSelectNoteByNoteId() throws SQLException {
		
		int testnoteid = 1;
		NoteVO note = noteDAO.selectNoteByNoteId(testnoteid);
		Assert.assertEquals(note.getNoteId(), testnoteid);
	}
	
	int insertnoteid = 2;
	
	
	@Test
	@Rollback
	public void testInsertNote() throws SQLException {
		NoteVO note = new NoteVO();
		note.setNoteId(insertnoteid);
		note.setNoteTitle("이거 모르겠어용");
		note.setNoteContent("여기서 왜 nullpoint exception이 뜨는 걸까용");
		note.setNoteRegDate(new Date());
		note.setNoteViewPoint(0);
		note.setMemberId(1);
		note.setProjectId(37);
		
		noteDAO.insertNote(note);
		
		NoteVO getNote = noteDAO.selectNoteByNoteId(note.getNoteId());
		
		Assert.assertEquals(note.getNoteId(), getNote.getNoteId());
	}
	
	@Test
	@Rollback
	public void testUpdateNote() throws SQLException {
		NoteVO note = noteDAO.selectNoteByNoteId(1);
		note.setNoteTitle("진짜모르겠어요이겅");
		note.setNoteContent("nullpointexception?!!?");
		
		noteDAO.updateNote(note);
		Assert.assertEquals(note.getNoteTitle(), noteDAO.selectNoteByNoteId(1).getNoteTitle());
	}
	
	@Test
	@Rollback
	public void testDeletedNote() throws SQLException {
		
		noteDAO.deleteNote(1);
		NoteVO note = noteDAO.selectNoteByNoteId(1);	
	}
	
	
	

}
