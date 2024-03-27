package com.it.dao;

import com.it.entity.Collect;
import com.it.entity.Dzrecord;

import java.util.HashMap;
import java.util.List;

public interface DzrecordDAO {
	List<Dzrecord> selectAll(HashMap map);
	void add(Dzrecord dzrecord);
	void delete(int id);
}
