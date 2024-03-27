package com.it.dao;

import com.it.entity.Collect;

import java.util.HashMap;
import java.util.List;

public interface CollectDAO {
	List<Collect> selectAll(HashMap map);
	void add(Collect collect);
	void delete(int id);
}
