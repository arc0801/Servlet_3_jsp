package com.arc.point;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class PointDAO {

	//insert
	public int insert(Connection con, PointDTO pointDTO) throws Exception {
		int result = 0;
		
		String sql = "insert into point values(point_seq.nextval, ?, ?, ?, ?, ?, ?)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, pointDTO.getName());
		st.setInt(2, pointDTO.getKor());
		st.setInt(3, pointDTO.getEng());
		st.setInt(4, pointDTO.getMath());
		st.setInt(5, pointDTO.getTotal());
		st.setDouble(6, pointDTO.getAvg());
		
		result = st.executeUpdate();
		
		st.close();
		
		return result;
	}
	
	//delete
	public int delete(Connection con, int num) throws Exception {
		int result = 0;
		
		String sql = "delete point where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		
		result = st.executeUpdate();
		
		st.close();
		
		return result;
	}
	
	//selectOne
	
}
