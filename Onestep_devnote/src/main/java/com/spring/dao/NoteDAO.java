package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.command.PageMaker;
import com.spring.dto.NoteVO;

public interface NoteDAO {
	
	
	 List<NoteVO> selectNoteList(int projectId) throws SQLException;
	 NoteVO selectNoteByNoteId(int noteId) throws SQLException;
	 int selectNoteSeqNext(int noteId) throws SQLException;
	 
	 void insertNote(NoteVO note) throws SQLException;
	 void updateNote(NoteVO note) throws SQLException;
	 void deleteNote(int noteId) throws SQLException;
	 
	 void increaseNoteViewPoint(int noteId) throws SQLException;
	 
	 
	 
	 
}
