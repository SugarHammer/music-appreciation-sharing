package com.it.dao;

import com.it.entity.Sysuser;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface SysuserDAO {
	List<Sysuser> selectAll(HashMap map);
	Sysuser findById(Integer id);
	void update(Sysuser sysuser);
	void add(Sysuser sysuser);


}
