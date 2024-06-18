package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;

public class UserDAOimpl implements UserDAO{
	
	private Connection conn;

	public UserDAOimpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean userRegister(User user) {
		boolean f = false;
		
		try {
			String sql ="insert into user(name,email,phone,password,loginName) values(?,?,?,?,?)";
		    PreparedStatement ps = conn.prepareStatement(sql);
		    ps.setString(1, user.getName());
		    ps.setString(2, user.getEmail());
		    ps.setString(3, user.getPhone());
		    ps.setString(4, user.getPassword());
		    ps.setString(5, user.getLoginName());
		    
		    int i = ps.executeUpdate();
		    if(i==1) {
		    	f=true;
		    }
		}
		catch(Exception e) {
			e.printStackTrace();
			return false;
			
		}
		
		return f;
	}

	@Override
	public User login(String email, String password) {
		
		User user = null;
		
		try {
			
			String sql = "Select * from user where email=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				
				user = new User();
				user.setUserid(rs.getInt(1));
				user.setName(rs.getString(2));
				user.setEmail(rs.getString(3));
				user.setPhone(rs.getString(4));
				user.setPassword(rs.getString(5));
				user.setLoginName(rs.getString(6));
				user.setRole(rs.getString(7));
				user.setLoginStatus(rs.getString(8));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
		
	
	}

	@Override
	public boolean checkExistingEmail(String email) {
		try {
            String sql = "SELECT * FROM user WHERE email=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

	@Override
	public boolean checkExistingLoginName(String loginName) {
	    try {
	        String sql = "SELECT * FROM user WHERE loginName=?";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setString(1, loginName);
	        ResultSet rs = ps.executeQuery();
	        return rs.next();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return false;
	}
	@Override
	public boolean checkExistingPhone(String phone) {
	    try {
	        String sql = "SELECT * FROM user WHERE phone=?";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setString(1, phone);
	        ResultSet rs = ps.executeQuery();
	        return rs.next();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return false;
	}

	
	
	
	
	
	

}
