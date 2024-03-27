package com.it.dao;

import java.util.*;

import com.it.entity.News;

public interface NewsDAO {
	List<News> selectAll(HashMap map);
	void add(News news);
	News findById(int id);
	void update(News news);
	void delete(int id);
}
