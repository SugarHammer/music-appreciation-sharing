package com.it.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.it.dao.CategoryDAO;
import com.it.dao.CommentDAO;
import com.it.dao.NewsDAO;
import com.it.entity.Category;
import com.it.entity.Comment;
import com.it.entity.News;
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
public class NewsController extends BaseController {

	@Resource
    NewsDAO newsDAO;
    @Resource
    CategoryDAO categoryDAO;
    @Resource
    CommentDAO commentDAO;



	//资讯列表
	@ResponseBody
	@RequestMapping("admin/newsList")
	public HashMap<String,Object> newsList(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum,@RequestParam(defaultValue = "1",value = "pageSize") Integer pageSize,HttpServletRequest request){
		String key = request.getParameter("key");
        String key1 = request.getParameter("key1");
        String orderby = request.getParameter("orderby");
        HashMap<String,Object> res = new HashMap<String,Object>();
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("key", key);
        List<News> newslist = newsDAO.selectAll(map);
		PageHelper.startPage(pageNum, pageSize);
		List<News> list = newsDAO.selectAll(map);
		for(News news:list){
		    String content = Info.delHTMLTag(news.getContent());
		    news.setContent(content);

        }
		PageInfo<News> pageInfo = new PageInfo<News>(list);
		res.put("pageInfo", pageInfo);
		res.put("list", newslist);
		return res;
	}


    //资讯添加
    @ResponseBody
    @RequestMapping("admin/newsAdd")
    public void newsAdd(News news,HttpServletRequest request) {
        news.setSavetime(Info.getDateStr());
        newsDAO.add(news);
    }


    //编辑页面
    @ResponseBody
    @RequestMapping("admin/newsShow")
    public HashMap<String,Object> newsShow(int id,HttpServletRequest request) {
        HashMap<String,Object> res = new HashMap<String,Object>();
        News news = newsDAO.findById(id);
        res.put("news", news);
        return res;
    }


    //资讯编辑
    @ResponseBody
    @RequestMapping("admin/newsEdit")
    public void newsEdit(News news,HttpServletRequest request) {
        newsDAO.update(news);
    }

    //资讯删除
    @ResponseBody
    @RequestMapping("admin/newsDel")
    public void newsDel(int id,HttpServletRequest request) {
	    newsDAO.delete(id);
    }


}
