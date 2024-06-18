package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.Category;
import com.entity.Slots;

public class CategoryDAOimpl implements CategoryDAO {
	
	private Connection conn;
	

	public CategoryDAOimpl(Connection conn) {
		super();
		this.conn = conn;
	}


	@Override
	public boolean addCategory(Category c) {
		
		boolean f = false;
	
		try {
			
	            // Check if the slot with the same name already exists
	            if (getCategoryByName(c.getCategory_name()) != null) {
	                return false; // Slot with the same name already exists
	            }
	            
			String sql = "insert into category(category_name, status) values(?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, c.getCategory_name());
			ps.setString(2, c.getStatus());
			
			int i = ps.executeUpdate();
			if(i==1) {
				f = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
				return f;
	}
	
	//to check whether same name data already exists in database or not
	 @Override
	    public Category getCategoryByName(String categoryName) {
	        Category category = null;
	        try {
	            String query = "SELECT * FROM category WHERE category_name = ?";
	            PreparedStatement statement = conn.prepareStatement(query);
	            statement.setString(1, categoryName);
	            
	            ResultSet resultSet = statement.executeQuery();
	            if (resultSet.next()) {
	                category = new Category();
	                category.setId(resultSet.getInt("categoryid"));
	                category.setCategory_name(resultSet.getString("category_name"));
	                category.setStatus(resultSet.getString("status"));
	            }
	            
	            resultSet.close();
	            statement.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return category;
	    }
	//ADMIN INPUT CATEGORY TO SHOW IN OTHER PAGE
	 public List<Category> getAllCategories() {
	        List<Category> categories = new ArrayList<>();
	        try {
	            String query = "SELECT * FROM category where status=? ";
	            
	            PreparedStatement statement = conn.prepareStatement(query);
	            statement.setString(1, "Active");
	            ResultSet resultSet = statement.executeQuery();
	            while (resultSet.next()) {
	                Category category = new Category();
	                category.setId(resultSet.getInt("categoryid"));
	                category.setCategory_name(resultSet.getString("category_name"));
	                category.setStatus(resultSet.getString("status"));
	                categories.add(category);
	            }
	            
	            resultSet.close();
	            statement.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return categories;
	    }
	 


	@Override
	public List<Category> getAllCategories2() {
		List<Category> categories = new ArrayList<>();
        try {
            String query = "SELECT * FROM category";
            
            PreparedStatement statement = conn.prepareStatement(query);
            
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Category category = new Category();
                category.setId(resultSet.getInt("categoryid"));
                category.setCategory_name(resultSet.getString("category_name"));
                category.setStatus(resultSet.getString("status"));
                categories.add(category);
            }
            
            resultSet.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categories;
    }
 


	@Override
	public Category getCategoryById(int id) {
		Category c = null;

		try {
			String sql = "SELECT * FROM category WHERE categoryid=?";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				c = new Category();
				c.setId(rs.getInt("categoryid"));
				c.setCategory_name(rs.getString("category_name"));
				c.setStatus(rs.getString("status"));

			}

		} catch (Exception e) {
			e.printStackTrace();

		}
		return c;
	}

	@Override
	public boolean updateCategory(Category c) {
		boolean f = false;
		try {
			String sql = "UPDATE category SET category_name=?, status=? WHERE categoryid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, c.getCategory_name());
			ps.setString(2, c.getStatus());
			ps.setInt(3, c.getId()); // Set the value for the third parameter (slotid)

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}



	@Override
	public boolean deleteCategory(int id) {
		
		boolean f = false;
		try {
			String sql = "DELETE FROM category WHERE categoryid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

}


	
	


