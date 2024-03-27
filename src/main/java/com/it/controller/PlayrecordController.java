package com.it.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.it.dao.MovieDAO;
import com.it.dao.PlayrecordDAO;
import com.it.entity.Member;
import com.it.entity.Movie;
import com.it.entity.Playrecord;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@Controller
public class PlayrecordController {
	@Resource
    PlayrecordDAO playrecordDAO;
    @Resource
    MovieDAO movieDAO;

	
	//后台播放记录列表
    @ResponseBody
	@RequestMapping("playrecordList")
	public HashMap<String,Object> playrecordList(int movieid,HttpServletRequest request) {
        Member sessionmember = (Member) request.getSession().getAttribute("sessionmember");
        HashMap<String,Object> res = new HashMap<String,Object>();
        HashMap map = new HashMap();
        map.put("memberid", sessionmember.getId());
        map.put("movieid",movieid);
        List<Playrecord> playrecordlist = playrecordDAO.selectAll(map);
        res.put("list", playrecordlist);
        return res;
	}
	
	
	
	//播放记录添加
    @ResponseBody
	@RequestMapping("playrecordAdd")
	public HashMap<String,Object> playrecordAdd(Playrecord playrecord,HttpServletRequest request) {
        Member sessionmember = (Member) request.getSession().getAttribute("sessionmember");
        HashMap<String,Object> res = new HashMap<String,Object>();
        HashMap map = new HashMap();
        map.put("memberid", sessionmember.getId());
        map.put("movieid",playrecord.getMovieid());
        List<Playrecord> playrecordlist = playrecordDAO.selectAll(map);
        //if(playrecordlist.size()==0){
            playrecord.setMemberid(sessionmember.getId());
            playrecordDAO.add(playrecord);
            res.put("data", 200);
        //}else{
         //   res.put("data", 400);
        //}

        Movie movie = movieDAO.findById(playrecord.getMovieid());
        movie.setCs(movie.getCs()+1);
        movieDAO.update(movie);
        return res;

	}
	
	
	//播放记录删除
    @ResponseBody
	@RequestMapping("admin/playrecordDel")
	public void playrecordDel(int id,HttpServletRequest request) {
		playrecordDAO.delete(id);
	}
	
	

}
