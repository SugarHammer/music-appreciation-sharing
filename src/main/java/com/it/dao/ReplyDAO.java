package com.it.dao;


import com.it.entity.Reply;

import java.util.HashMap;
import java.util.List;

public interface ReplyDAO {
	List<Reply> selectAll(HashMap map);
	void add(Reply reply);
	void delete(int id);
    Reply findById(int id);
}
