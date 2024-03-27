package com.it.dao;


import com.it.entity.Section;

import java.util.HashMap;
import java.util.List;

public interface SectionDAO {
	List<Section> selectAll(HashMap map);
	void add(Section section);
    Section findById(Integer id);
	void update(Section section);
	void delete(int id);
}
