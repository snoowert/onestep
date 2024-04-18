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

import com.spring.dto.NoteVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:com/spring/context/root-context.xml")
@Transactional
public class TestNoteDAOImpl {

	@Autowired
	private NoteDAO noteDAO;
	
	@Test
	public void testSelectNoteList() throws SQLException {
		List<NoteVO> noteList = noteDAO.selectNoteList();
		Assert.assertEquals(0, noteList.size());
		
	}

	@Test
	public void testSelectNoteByDnId() throws SQLException {
		int testNoteId = 1;
		NoteVO note = noteDAO.selectNoteByDnId(testNoteId);
		Assert.assertEquals(note.getNoteId(), testNoteId);

	}

	int insertNoteId = 1;

	@Test
	@Rollback
	public void testInsertNote() throws SQLException {
		NoteVO note = new NoteVO();
		note.setMemberId(2);
		note.setNoteId(insertNoteId);
		note.setNoteTitle("AI 자율주행 자동차 프로젝트");
		note.setNoteContent("아두이노 모듈 자동차에 OpenCV 및 Yolov5를 이용하여... ");
		note.setNoteRegDate(new Date());
		note.setNoteViewPoint(0);
		note.setProjectId(1);
		note.setMemberId(1);

		noteDAO.insertNote(note);

		NoteVO test = noteDAO.selectNoteByDnId(note.getNoteId());

		Assert.assertEquals(note.getNoteId(), test.getNoteId());
	}

	@Test
	@Rollback
	public void testUpdateNote() throws SQLException {

		int testNoteId = 1;
		testInsertNote();
		String testNoteTitle = "질문";
		NoteVO targetNote = noteDAO.selectNoteByDnId(insertNoteId);
		
		Assert.assertNotNull(targetNote);
		Assert.assertNotEquals(testNoteTitle, targetNote.getNoteTitle());
		
		targetNote.setNoteTitle(testNoteTitle);
		
		noteDAO.updateNote(targetNote);
		
		NoteVO test = noteDAO.selectNoteByDnId(testNoteId);
		Assert.assertEquals(testNoteTitle, test.getNoteTitle());
		
		
	}

	@Test
	@Rollback
	public void testDeleteNote() throws Exception {
		testInsertNote();
		NoteVO targetNote = noteDAO.selectNoteByDnId(insertNoteId);

		Assert.assertEquals(insertNoteId, targetNote.getNoteId());

		noteDAO.deleteNote(insertNoteId);
		NoteVO deleteNote = noteDAO.selectNoteByDnId(insertNoteId);

		Assert.assertNull(deleteNote);

	}

}
