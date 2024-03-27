package com.it.dao;

import com.it.entity.Movie;

import java.util.HashMap;
import java.util.List;


public interface MovieDAO {
	List<Movie> selectAll(HashMap map);
	List<Movie> selectSongs(HashMap map);
	void add(Movie movie);
	void update(Movie movie);
    Movie findById(int id);
	void delete(int id);
}
