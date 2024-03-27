package com.it.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.it.dao.CategoryDAO;
import com.it.dao.CollectDAO;
import com.it.dao.MovieDAO;
import com.it.entity.Category;
import com.it.entity.Collect;
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
public class CollectController {
	@Resource
    CollectDAO collectDAO;
    @Resource
    MovieDAO movieDAO;
    @Resource
    CategoryDAO categoryDAO;


	
	//收藏列表
    @ResponseBody
    @RequestMapping("collectList")
    public HashMap<String,Object> collectList(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum, @RequestParam(defaultValue = "1",value = "pageSize") Integer pageSize, HttpServletRequest request) {
        Member sessionmember = (Member) request.getSession().getAttribute("sessionmember");
        String key = request.getParameter("key");
        HashMap<String,Object> res = new HashMap<String,Object>();
        HashMap map = new HashMap();
        map.put("key", key);
        map.put("memberid", sessionmember.getId());
        List<Collect> categorylist = collectDAO.selectAll(map);
        PageHelper.startPage(pageNum, pageSize);
        List<Collect> list = collectDAO.selectAll(map);
        for(Collect collect:list){
            Movie movie = movieDAO.findById(collect.getMovieid());
            Category category = categoryDAO.findById(movie.getCategoryid());
            movie.setCategory(category);
            collect.setMovie(movie);
        }
        PageInfo<Collect> pageInfo = new PageInfo<Collect>(list);
        res.put("pageInfo", pageInfo);
        res.put("list", categorylist);
        return res;
    }
	
	
	
	//收藏添加
    @ResponseBody
	@RequestMapping("collectAdd")
	public HashMap<String,Object> collectAdd(Collect collect,HttpServletRequest request) {
        Member sessionmember = (Member) request.getSession().getAttribute("sessionmember");
        HashMap<String,Object> res = new HashMap<String,Object>();
        HashMap map = new HashMap();
        map.put("memberid", sessionmember.getId());
        map.put("movieid",collect.getMovieid());
        map.put("sheetid",collect.getSheetid());

        List<Collect> collectlist = collectDAO.selectAll(map);
        if(collectlist.size()==0){
            collect.setMemberid(sessionmember.getId());
            collectDAO.add(collect);
            res.put("data", 200);
        }else{
            res.put("data", 400);
        }
        return res;

	}



	
	//收藏删除
    @ResponseBody
	@RequestMapping("collectDel")
	public void collectDel(int id,HttpServletRequest request) {
		collectDAO.delete(id);
	}
	
	

}
