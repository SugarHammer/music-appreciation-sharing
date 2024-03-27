package com.it.controller;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.it.dao.SectionDAO;
import com.it.entity.Section;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import java.util.HashMap;
import java.util.List;

@Controller
public class SectionController {
    @Resource
    SectionDAO sectionDAO;


    //后台版块列表
    @ResponseBody
	@RequestMapping("admin/sectionList")
	public HashMap<String,Object> sectionList(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum,@RequestParam(defaultValue = "1",value = "pageSize") Integer pageSize,HttpServletRequest request){
		String key = request.getParameter("key");
		HashMap<String,Object> res = new HashMap<String,Object>();
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("key", key);
		List<Section> objectlist = sectionDAO.selectAll(map);
		PageHelper.startPage(pageNum, pageSize);
		List<Section> list = sectionDAO.selectAll(map);
		PageInfo<Section> pageInfo = new PageInfo<Section>(list);
		res.put("pageInfo", pageInfo);
		res.put("list", objectlist);
		return res;
	}
    
	//添加版块
    @ResponseBody
	@RequestMapping("admin/sectionAdd")
	public void sectionAdd(Section section,HttpServletRequest request) {
        section.setDelstatus("0");
		sectionDAO.add(section);
	}

	//删除版块
    @ResponseBody
	@RequestMapping("admin/sectionDel")
	public void sectionDel(Integer id,HttpServletRequest request) {
        sectionDAO.delete(id);
	}

	//查找section到修改页面
    @ResponseBody
	@RequestMapping("admin/sectionShow")
	public HashMap<String,Object> sectionShow(Integer id,HttpServletRequest request) {
    	HashMap<String,Object> res = new HashMap<String,Object>();
		Section section = sectionDAO.findById(id);
		request.setAttribute("section",section);
		res.put("section", section);
		return res;
	}

	//修改版块
    @ResponseBody
	@RequestMapping("admin/sectionEdit")
	public void sectionEdit(Section section,HttpServletRequest request) {
		sectionDAO.update(section);
	}

}
