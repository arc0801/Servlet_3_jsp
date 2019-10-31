package com.arc.test;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.util.ArrayList;
import org.junit.Test;

import com.arc.notice.NoticeDAO;
import com.arc.notice.NoticeDTO;
import com.arc.util.DBConnector;

public class NoticeDAOTest {

	@Test
	public void delete() throws Exception {
		
		NoticeDAO noticeDAO = new NoticeDAO();
		Connection con = DBConnector.getConnection();
		int result = noticeDAO.delete(con, 30);
		
		assertEquals(1, result);
	}
	
	
	//@Test
	public void updateTest() throws Exception {
		
		NoticeDTO noticeDTO = new NoticeDTO();
		noticeDTO.setNum(30);
		noticeDTO.setTitle("11");
		noticeDTO.setContents("11");
		
		NoticeDAO noticeDAO = new NoticeDAO();
		Connection con = DBConnector.getConnection();
		int result = noticeDAO.update(con, noticeDTO);
		
		assertEquals(1, result);
	}
	
	//@Test
	public void writeTest() throws Exception {
		
		NoticeDAO noticeDAO = new NoticeDAO();
		Connection con = DBConnector.getConnection();
		for(int i=0;i<5;i++) {
			NoticeDTO noticeDTO = new NoticeDTO();
			noticeDTO.setWriter("writer"+i);
			noticeDTO.setTitle("title"+i);
			noticeDTO.setContents("contents"+i);
			noticeDAO.write(con, noticeDTO);
			Thread.sleep(500);
		}
		
		con.close();
		
	}
	
	//@Test
	public void selectListTest() throws Exception {
		
		NoticeDAO noticeDAO = new NoticeDAO();
		Connection con = DBConnector.getConnection();
		ArrayList<NoticeDTO> ar = noticeDAO.selectList(con);
		
		assertNotEquals(0, ar.size());
	}
	
	//@Test
	public void selectOneTest() throws Exception {
		
		NoticeDAO noticeDAO = new NoticeDAO();
		Connection con = DBConnector.getConnection();
		NoticeDTO noticeDTO = noticeDAO.selectOne(con, 12);
		
		assertNotNull(noticeDTO);
	}

}
