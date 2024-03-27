package com.it.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.it.dao.DzrecordDAO;
import com.it.dao.MovieDAO;
import com.it.entity.Dzrecord;
import com.it.entity.Member;
import com.it.entity.Movie;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@Controller
public class DzrecordController {
	@Resource
    DzrecordDAO dzrecordDAO;
    @Resource
    MovieDAO movieDAO;


	
//	//点赞列表
//    @ResponseBody
//    @RequestMapping("dzrecordList")
//    public HashMap<String,Object> dzrecordList(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum, @RequestParam(defaultValue = "1",value = "pageSize") Integer pageSize, HttpServletRequest request) {
//        Member sessionmember = (Member) request.getSession().getAttribute("sessionmember");
//        String key = request.getParameter("key");
//        HashMap<String,Object> res = new HashMap<String,Object>();
//        HashMap map = new HashMap();
//        map.put("key", key);
//        map.put("memberid", sessionmember.getId());
//        List<Dzrecord> dzrecordlist = dzrecordDAO.selectAll(map);
//        PageHelper.startPage(pageNum, pageSize);
//        List<Dzrecord> list = dzrecordDAO.selectAll(map);
//        for(Dzrecord dzrecord:list){
//            Movie movie = movieDAO.findById(dzrecord.getMovieid());
//            dzrecord dzrecord = dzrecordDAO.findById(movie.getdzrecordid());
//            movie.setdzrecord(dzrecord);
//            dzrecord.setMovie(movie);
//        }
//        PageInfo<dzrecord> pageInfo = new PageInfo<dzrecord>(list);
//        res.put("pageInfo", pageInfo);
//        res.put("list", dzrecordlist);
//        return res;
//    }
//	
	
	
	//点赞添加
    @ResponseBody
	@RequestMapping("dzrecordAdd")
	public HashMap<String,Object> dzrecordAdd(Dzrecord dzrecord,HttpServletRequest request) {
        Member sessionmember = (Member) request.getSession().getAttribute("sessionmember");
        HashMap<String,Object> res = new HashMap<String,Object>();
        Movie movie = movieDAO.findById(dzrecord.getMovieid());
        HashMap map = new HashMap();
        map.put("memberid", sessionmember.getId());
        map.put("movieid",dzrecord.getMovieid());
        List<Dzrecord> dzrecordlist = dzrecordDAO.selectAll(map);
        if(dzrecordlist.size()==0){
            dzrecord.setMemberid(sessionmember.getId());
            dzrecord.setCategroyid(movie.getCategoryid());
            dzrecordDAO.add(dzrecord);
            res.put("data", 200);
        }else{
            res.put("data", 400);
        }
        return res;

	}



	
	//点赞删除
    @ResponseBody
	@RequestMapping("dzrecordDel")
	public void dzrecordDel(int id,HttpServletRequest request) {
		dzrecordDAO.delete(id);
	}
	
	

}
