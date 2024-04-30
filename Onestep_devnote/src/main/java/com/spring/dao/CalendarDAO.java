package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import com.spring.dto.CalendarVO;

public interface CalendarDAO {
	
	List<CalendarVO> selectCalendarList(int projectId) throws SQLException;
	
}
