package com.it.dao;
import java.util.*;

import com.it.entity.Category;


public interface CategoryDAO {
	List<Category> selectAll(HashMap map);
	void add(Category category);
	void update(Category category);
	Category findById(int id);
	void delete(int id);
}
