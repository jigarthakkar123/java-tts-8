package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bean.User;
import com.util.UserUtil;

public class UserDao {

	public static void insertUser(User u)
	{
		try {
			Connection conn=UserUtil.createConnection();
			String sql="insert into user(fname,lname,email,mobile,address,gender,education,password) values(?,?,?,?,?,?,?,?)";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1, u.getFname());
			pst.setString(2, u.getLname());
			pst.setString(3, u.getEmail());
			pst.setString(4, u.getMobile());
			pst.setString(5, u.getAddress());
			pst.setString(6, u.getGender());
			pst.setString(7, u.getEducation());
			pst.setString(8, u.getPassword());
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static void updateUser(User u)
	{
		try {
			Connection conn=UserUtil.createConnection();
			String sql="update user set fname=?,lname=?,email=?,mobile=?,address=?,gender=?,education=?,password=? where uid=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1, u.getFname());
			pst.setString(2, u.getLname());
			pst.setString(3, u.getEmail());
			pst.setString(4, u.getMobile());
			pst.setString(5, u.getAddress());
			pst.setString(6, u.getGender());
			pst.setString(7, u.getEducation());
			pst.setString(8, u.getPassword());
			pst.setInt(9, u.getUid());
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static void deleteUser(int uid)
	{
		try {
			Connection conn=UserUtil.createConnection();
			String sql="delete from user where uid=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, uid);
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static List<User> getAllUser()
	{
		List<User> list=new ArrayList<User>();
		try {
			Connection conn=UserUtil.createConnection();
			String sql="select * from user";
			PreparedStatement pst=conn.prepareStatement(sql);
			ResultSet rs=pst.executeQuery();
			while(rs.next())
			{
				User u=new User();
				u.setUid(rs.getInt("uid"));
				u.setFname(rs.getString("fname"));
				u.setLname(rs.getString("lname"));
				u.setEmail(rs.getString("email"));
				u.setMobile(rs.getString("mobile"));
				u.setAddress(rs.getString("address"));
				u.setGender(rs.getString("gender"));
				u.setPassword(rs.getString("password"));
				u.setEducation(rs.getString("education"));
				list.add(u);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public static User getUser(int uid)
	{
		User u=null;
		try {
			Connection conn=UserUtil.createConnection();
			String sql="select * from user where uid=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, uid);
			ResultSet rs=pst.executeQuery();
			if(rs.next())
			{
				u=new User();
				u.setUid(rs.getInt("uid"));
				u.setFname(rs.getString("fname"));
				u.setLname(rs.getString("lname"));
				u.setEmail(rs.getString("email"));
				u.setMobile(rs.getString("mobile"));
				u.setAddress(rs.getString("address"));
				u.setGender(rs.getString("gender"));
				u.setPassword(rs.getString("password"));
				u.setEducation(rs.getString("education"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return u;
	}
}
