package com.it.dao;

import com.it.entity.Playrecord;

import java.util.HashMap;
import java.util.List;

public interface PlayrecordDAO {
	List<Playrecord> selectAll(HashMap map);
	void add(Playrecord playrecord);
	void delete(int id);
}
