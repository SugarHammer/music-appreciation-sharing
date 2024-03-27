package com.it.dao;


import com.it.entity.Article;

import java.util.HashMap;
import java.util.List;

public interface ArticleDAO {
	List<Article> selectAll(HashMap map);
	void add(Article article);
	void delete(Integer id);
	Article findById(Integer id);
	void update(Article article);
}
