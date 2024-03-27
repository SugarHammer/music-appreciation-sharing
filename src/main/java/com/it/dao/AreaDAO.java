package com.it.dao;

import com.it.entity.Area;

import java.util.HashMap;
import java.util.List;


public interface AreaDAO {
	List<Area> selectAll(HashMap map);
	void add(Area area);
	void update(Area area);
    Area findById(int id);
	void delete(int id);
}
