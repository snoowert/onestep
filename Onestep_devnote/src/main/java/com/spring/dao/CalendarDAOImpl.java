package com.spring.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spring.dto.CalendarVO;

public class CalendarDAOImpl implements CalendarDAO{

	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public List<CalendarVO> selectCalendarList(int projectId) throws SQLException {
		return sqlSession.selectList("Calendar-Mapper.selectCalendarList", projectId);

	}


}