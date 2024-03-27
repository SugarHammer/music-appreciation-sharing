package com.it.dao;

import com.it.entity.Collect;
import com.it.entity.Sheet;

import java.util.HashMap;
import java.util.List;

public interface SheetDAO {
	List<Sheet> selectAll(HashMap map);
	void add(Sheet collect);
	void delete(int id);
}
