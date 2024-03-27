package com.it.dao;


import com.it.entity.Message;

import java.util.HashMap;
import java.util.List;

public interface MessageDAO {
	List<Message> selectAll(HashMap map);
	void add(Message message);
    Message findById(int id);
	void update(Message message);
	void delete(int id);
}
