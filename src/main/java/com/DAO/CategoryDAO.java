package com.DAO;

import java.util.List;

import com.entity.Category;


public interface CategoryDAO {
	
	public boolean addCategory(Category c);
	public Category getCategoryByName(String categoryName);
	public Category getCategoryById(int id);
	public List<Category> getAllCategories();//CATEGORY INPUT RATE TO SHOW IN OTHER PAGE
	public List<Category> getAllCategories2();//CATEGORY INPUT RATE TO SHOW IN OTHER PAGE
	 public boolean updateCategory(Category c);
	    public boolean deleteCategory(int id);
}
