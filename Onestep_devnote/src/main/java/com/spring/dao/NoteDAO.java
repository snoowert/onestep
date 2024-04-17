package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.dto.NoteVO;

public interface NoteDAO {
	
	
	 public List<NoteVO> selectNoteList() throws SQLException;
	 public NoteVO selectNoteByNoteId(int noteId) throws SQLException;
	 public void insertNote(NoteVO note) throws SQLException;
	 public void updateNote(NoteVO note) throws SQLException;
	 public void deleteNote(int noteId) throws SQLException;
	 
	 public void increaseNoteViewPoint(int noteId) throws SQLException;
	 
	 
	 
	 
}
