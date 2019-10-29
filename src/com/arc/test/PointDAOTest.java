package com.arc.test;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Random;

import org.junit.Test;

import com.arc.point.PointDAO;
import com.arc.point.PointDTO;
import com.arc.util.DBConnector;

public class PointDAOTest {
	
	@Test
	public void insertTest() throws Exception {
		PointDAO pointDAO = new PointDAO();
		Connection con = DBConnector.getConnection();
		for(int i=0;i<10;i++) {
			Random rs = new Random();
			PointDTO pointDTO = new PointDTO();
			pointDTO.setName("name"+i);
			pointDTO.setKor(rs.nextInt(101));
			pointDTO.setEng(rs.nextInt(101));
			pointDTO.setMath(rs.nextInt(101));
			pointDTO.setTotal(pointDTO.getKor()+pointDTO.getEng()+pointDTO.getMath());
			pointDTO.setAvg(pointDTO.getTotal()/3.0);
			pointDAO.insert(con, pointDTO);
			Thread.sleep(500);
		}
		
		con.close();
		
	}
	
	//@Test
	public void selectList() throws Exception {
		
		PointDAO pointDAO = new PointDAO();
		Connection con = DBConnector.getConnection();
		ArrayList<PointDTO> ar = pointDAO.selectList(con);
		
		assertNotEquals(0, ar.size());
		
		//assertNotNull(ar.get(0));
	}
	
	//@Test
	public void selectOneTest() throws Exception {
		
		PointDAO pointDAO = new PointDAO();
		Connection con = DBConnector.getConnection();
		PointDTO pointDTO = pointDAO.selectOne(con, 21);
		
		assertNotNull(pointDTO);
	}
	
	//@Test
	public void test2() throws Exception {
		
		Connection con = DBConnector.getConnection();
		
		assertNotNull(con);
	}
	
	//@Test
	public void test() throws Exception {

		PointDAO pointDAO = new PointDAO();
		Connection con = DBConnector.getConnection();
		int result = pointDAO.delete(con, 1356);
		
		//System.out.println(result);
				
		//단정문
		assertEquals(1, result);
	}

}
