package com.arc.test;

import static org.junit.Assert.*;

import java.sql.Connection;

import org.junit.Test;

import com.arc.member.MemberDAO;
import com.arc.member.MemberDTO;
import com.arc.util.DBConnector;

public class MemberDAOTest {
	
	@Test
	public void memberDeleteTest() throws Exception {
		
		MemberDAO memberDAO = new MemberDAO();
		Connection con = DBConnector.getConnection();
		int result = memberDAO.memberDelete(con, "b");
		
		assertEquals(1, result);
	}
	
	//@Test
	public void memberUpdateTest() throws Exception {
		
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setPw("n");
		memberDTO.setName("n");
		memberDTO.setEmail("n@n");
		memberDTO.setPhone("01000000000");
		memberDTO.setId("admin");
		
		MemberDAO memberDAO = new MemberDAO();
		Connection con = DBConnector.getConnection();
		int result = memberDAO.memberUpdate(con, memberDTO);
		
		assertEquals(1, result);
		
	}
	
	//@Test
	public void memberLoginTest() throws Exception {
		MemberDAO memberDAO = new MemberDAO();
		Connection con = DBConnector.getConnection();
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setId("b");
		memberDTO.setPw("b");
		
		memberDTO = memberDAO.memberLogin(con, memberDTO);
		
		assertNotNull(memberDTO);
	}
	
	
	//@Test
	public void memberJoinTest() throws Exception {
		MemberDAO memberDAO = new MemberDAO();
		Connection con = DBConnector.getConnection();
		MemberDTO memberDTO = new MemberDTO();
		
		memberDAO.memberJoin(con, memberDTO);
	}
}
