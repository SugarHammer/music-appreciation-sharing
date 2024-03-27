package com.it.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.it.dao.AreaDAO;
import com.it.entity.Area;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@Controller
public class AreaController {
	@Resource
    AreaDAO areaDAO;
	
	
	//后台地区列表
    @ResponseBody
	@RequestMapping("admin/areaList")
	public HashMap<String,Object> areaList(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum,@RequestParam(defaultValue = "1",value = "pageSize") Integer pageSize,HttpServletRequest request) {
        String key = request.getParameter("key");
        HashMap<String,Object> res = new HashMap<String,Object>();
        HashMap<String,String> map = new HashMap<String,String>();
        map.put("key", key);
        List<Area> arealist = areaDAO.selectAll(map);
        PageHelper.startPage(pageNum, pageSize);
        List<Area> list = areaDAO.selectAll(map);
        PageInfo<Area> pageInfo = new PageInfo<Area>(list);
        res.put("pageInfo", pageInfo);
        res.put("list", arealist);
        return res;
	}
	
	
	
	//地区添加
    @ResponseBody
	@RequestMapping("admin/areaAdd")
	public void areaAdd(Area area,HttpServletRequest request) {
		areaDAO.add(area);
	}
	
	
	//编辑页面
    @ResponseBody
	@RequestMapping("admin/areaShow")
	public HashMap<String,Object> areaShow(int id,HttpServletRequest request) {
        HashMap<String,Object> res = new HashMap<String,Object>();
        Area area = areaDAO.findById(id);
        res.put("area", area);
        return res;
	}
	
	
	//地区编辑
    @ResponseBody
	@RequestMapping("admin/areaEdit")
	public void areaEdit(Area area,HttpServletRequest request) {
		areaDAO.update(area);
	}
	
	//地区删除
    @ResponseBody
	@RequestMapping("admin/areaDel")
	public void areaDel(int id,HttpServletRequest request) {
		areaDAO.delete(id);
	}
	
	

}
