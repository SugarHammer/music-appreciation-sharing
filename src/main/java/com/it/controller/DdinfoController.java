package com.it.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.it.dao.CategoryDAO;
import com.it.dao.DdinfoDAO;
import com.it.dao.MemberDAO;
import com.it.dao.MovieDAO;
import com.it.entity.Category;
import com.it.entity.Ddinfo;
import com.it.entity.Member;
import com.it.entity.Movie;
import com.it.util.Info;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@Controller
public class DdinfoController {
	@Resource
    DdinfoDAO ddinfoDAO;
    @Resource
    MovieDAO movieDAO;
    @Resource
    CategoryDAO categoryDAO;
    @Resource
    MemberDAO memberDAO;

	
	//订单列表
    @ResponseBody
    @RequestMapping("ddinfoList")
    public HashMap<String,Object> ddinfoList(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum, @RequestParam(defaultValue = "1",value = "pageSize") Integer pageSize, HttpServletRequest request) {
        Member sessionmember = (Member) request.getSession().getAttribute("sessionmember");
        String key = request.getParameter("key");
        HashMap<String,Object> res = new HashMap<String,Object>();
        HashMap map = new HashMap();
        map.put("key", key);
        map.put("memberid", sessionmember.getId());
        List<Ddinfo> categorylist = ddinfoDAO.selectAll(map);
        PageHelper.startPage(pageNum, pageSize);
        List<Ddinfo> list = ddinfoDAO.selectAll(map);
        for(Ddinfo ddinfo:list){
            Movie movie = movieDAO.findById(ddinfo.getMovieid());
            Category category = categoryDAO.findById(movie.getCategoryid());
            movie.setCategory(category);
            ddinfo.setMovie(movie);
            ddinfo.setMember(memberDAO.findById(ddinfo.getMemberid()));
        }
        PageInfo<Ddinfo> pageInfo = new PageInfo<Ddinfo>(list);
        res.put("pageInfo", pageInfo);
        res.put("list", categorylist);
        return res;
    }
    //订单列表  管理员
    @ResponseBody
    @RequestMapping("admin/ddinfoListForAdmin")
    public HashMap<String,Object> ddinfoListForAdmin(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum, @RequestParam(defaultValue = "1",value = "pageSize") Integer pageSize, HttpServletRequest request) {
        String key = request.getParameter("key");
        HashMap<String,Object> res = new HashMap<String,Object>();
        HashMap map = new HashMap();
        map.put("key", key);
        List<Ddinfo> categorylist = ddinfoDAO.selectAll(map);
        PageHelper.startPage(pageNum, pageSize);
        List<Ddinfo> list = ddinfoDAO.selectAll(map);
        for(Ddinfo ddinfo:list){
            Movie movie = movieDAO.findById(ddinfo.getMovieid());
            Category category = categoryDAO.findById(movie.getCategoryid());
            movie.setCategory(category);
            ddinfo.setMovie(movie);
            ddinfo.setMember(memberDAO.findById(ddinfo.getMemberid()));
        }
        PageInfo<Ddinfo> pageInfo = new PageInfo<Ddinfo>(list);
        res.put("pageInfo", pageInfo);
        res.put("list", categorylist);
        return res;
    }
	
	
	//订单添加
    @ResponseBody
	@RequestMapping("ddinfoAdd")
	public HashMap<String,Object> ddinfoAdd(Ddinfo ddinfo,HttpServletRequest request) {
        Member sessionmember = (Member) request.getSession().getAttribute("sessionmember");
        HashMap<String,Object> res = new HashMap<String,Object>();
        HashMap map = new HashMap();
        map.put("memberid", sessionmember.getId());
        map.put("movieid",ddinfo.getMovieid());
        List<Ddinfo> ddinfolist = ddinfoDAO.selectAll(map);
        if(ddinfolist.size()==0){
            ddinfo.setMemberid(sessionmember.getId());
            ddinfo.setSavetime(Info.getDateStr());
            ddinfo.setDdno(Info.getAutoId());
            ddinfo.setFkstatus("已付款");
            ddinfoDAO.add(ddinfo);
            res.put("data", 200);
        }else{
            res.put("data", 400);
        }
        return res;

	}
    //检查 该歌曲是否已购买
    @ResponseBody
    @RequestMapping("checkIsBuy")
    public HashMap<String,Object> checkIsBuy(int movieid,HttpServletRequest request) {
        Member sessionmember = (Member) request.getSession().getAttribute("sessionmember");
        HashMap<String,Object> res = new HashMap<String,Object>();
        HashMap map = new HashMap();
        map.put("memberid", sessionmember.getId());
        map.put("movieid",movieid);
        List<Ddinfo> ddinfolist = ddinfoDAO.selectAll(map);
        if(ddinfolist.size() == 0){
            res.put("data", 200);
        }else{
            res.put("data", 400);
        }
        return res;
    }
	
	//订单删除
    @ResponseBody
	@RequestMapping("admin/ddinfoDel")
	public void ddinfoDel(int id,HttpServletRequest request) {
		ddinfoDAO.delete(id);
	}
	
	

}
