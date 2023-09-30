package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.bean.User;
import com.util.ProjectUtil;

public class UserDao {

	public static void registerUser(User u)
	{
		
		try {
			Connection conn=ProjectUtil.createConnection();
			String sql="insert into user(name,email,mobile,password,usertype) values(?,?,?,?,?)";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1, u.getName());
			pst.setString(2, u.getEmail());
			pst.setLong(3, u.getMobile());
			pst.setString(4, u.getPassword());
			pst.setString(5, u.getUsertype());
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public static boolean checkEmail(String email)
	{
		boolean flag=false;
		try {
			Connection conn=ProjectUtil.createConnection();
			String sql="select * from user where email=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1, email);
			ResultSet rs=pst.executeQuery();
			if(rs.next())
			{
				flag=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	public static User loginUser(String email,String password)
	{
		User u=null;
		try {
			Connection conn=ProjectUtil.createConnection();
			String sql="select * from user where email=? and password=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1, email);
			pst.setString(2, password);
			ResultSet rs=pst.executeQuery();
			if(rs.next())
			{
				u=new User();
				u.setUid(rs.getInt("uid"));
				u.setName(rs.getString("name"));
				u.setEmail(rs.getString("email"));
				u.setMobile(rs.getLong("mobile"));
				u.setPassword(rs.getString("password"));
				u.setUsertype(rs.getString("usertype"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return u;
	}
	public static void changePassword(User u)
	{
		try {
			Connection conn=ProjectUtil.createConnection();
			String sql="update user set password=? where uid=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1, u.getPassword());
			pst.setInt(2, u.getUid());
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static void updatePassword(String email,String password)
	{
		try {
			Connection conn=ProjectUtil.createConnection();
			String sql="update user set password=? where email=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1, password);
			pst.setString(2,email);
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static void updateProfile(User u)
	{
		try {
			Connection conn=ProjectUtil.createConnection();
			String sql="update user set name=?,mobile=? where uid=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1, u.getName());
			pst.setLong(2, u.getMobile());
			pst.setInt(3, u.getUid());
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
