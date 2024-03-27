package com.it.dao;

import com.it.entity.Collect;
import com.it.entity.Ddinfo;

import java.util.HashMap;
import java.util.List;

public interface DdinfoDAO {
	List<Ddinfo> selectAll(HashMap map);
	void add(Ddinfo ddinfo);
	void delete(int id);
}
