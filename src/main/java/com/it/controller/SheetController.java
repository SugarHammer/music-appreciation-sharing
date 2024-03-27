package com.it.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.it.dao.CategoryDAO;
import com.it.dao.CollectDAO;
import com.it.dao.MovieDAO;
import com.it.dao.SheetDAO;
import com.it.entity.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@Controller
public class SheetController {
	@Resource
    SheetDAO sheetDAO;
    @Resource
    MovieDAO movieDAO;
    @Resource
    CategoryDAO categoryDAO;

    @Resource
    CollectDAO collectDAO;
	
	//歌单列表
    @ResponseBody
    @RequestMapping("sheetList")
    public HashMap<String,Object> sheetList(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum, @RequestParam(defaultValue = "1",value = "pageSize") Integer pageSize, HttpServletRequest request) {
        Member sessionmember = (Member) request.getSession().getAttribute("sessionmember");
        String key = request.getParameter("key");
        HashMap<String,Object> res = new HashMap<String,Object>();
        HashMap map = new HashMap();
        map.put("key", key);
        map.put("memberid", sessionmember.getId());
        List<Sheet> categorylist = sheetDAO.selectAll(map);
        for(Sheet s:categorylist){
            HashMap m = new HashMap();
            m.put("memberid", sessionmember.getId());
            m.put("sheetid",s.getId());
            List<Collect> collectList = collectDAO.selectAll(m);
            for(Collect c:collectList){
                c.setMovie(movieDAO.findById(c.getMovieid()));
            }
            s.setCollectList(collectList);
        }
        PageHelper.startPage(pageNum, pageSize);
        List<Sheet> list = sheetDAO.selectAll(map);
        PageInfo<Sheet> pageInfo = new PageInfo<Sheet>(list);
        res.put("pageInfo", pageInfo);
        res.put("list", categorylist);
        return res;
    }
	
	
	
	//歌单添加
    @ResponseBody
	@RequestMapping("sheetAdd")
	public HashMap<String,Object> sheetAdd(Sheet sheet,HttpServletRequest request) {
        Member sessionmember = (Member) request.getSession().getAttribute("sessionmember");
        HashMap<String,Object> res = new HashMap<String,Object>();
        sheet.setMemberid(sessionmember.getId());
        sheet.setDelstatus("0");
        sheetDAO.add(sheet);
        res.put("data", 200);
        return res;

	}
	
	
	//歌单删除
    @ResponseBody
	@RequestMapping("sheetDel")
	public void sheetDel(int id,HttpServletRequest request) {
		sheetDAO.delete(id);
	}
	
	

}
