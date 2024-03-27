package com.it.dao;


import com.it.entity.Member;

import java.util.HashMap;
import java.util.List;

public interface MemberDAO {
	List<Member> selectAll(HashMap map);
	void add(Member member);
    Member findById(int id);
	void update(Member member);
	void delete(int id);
}
