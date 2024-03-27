package com.it.controller;

import javax.annotation.Resource;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import com.it.dao.ImgadvDAO;
import com.it.entity.Imgadv;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import java.util.*;

@Controller
public class ImgadvController extends BaseController {

	@Resource
    ImgadvDAO imgadvDAO;
	
	
	//焦点图列表
	@ResponseBody
	@RequestMapping("admin/imgadvList")
	public HashMap<String,Object> imgadvList(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum,@RequestParam(defaultValue = "1",value = "pageSize") Integer pageSize,HttpServletRequest request){
		String key = request.getParameter("key");
		HashMap<String,Object> res = new HashMap<String,Object>();
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("key", key);
		List<Imgadv> imgadvlist = imgadvDAO.selectAll(map);
		PageHelper.startPage(pageNum, pageSize);
		List<Imgadv> list = imgadvDAO.selectAll(map);
		PageInfo<Imgadv> pageInfo = new PageInfo<Imgadv>(list);
		res.put("pageInfo", pageInfo);
		res.put("list", imgadvlist);
		return res;
	}
		
	
	//添加焦点图
	@ResponseBody
	@RequestMapping("admin/imgadvAdd")
	public HashMap<String,Object> imgadvAdd(Imgadv imgadv ,HttpServletRequest request) {
		imgadvDAO.add(imgadv);
		return null;
	}


    //编辑页面
    @ResponseBody
    @RequestMapping("admin/imgadvShow")
    public HashMap<String,Object> imgadvShow(int id,HttpServletRequest request) {
        HashMap<String,Object> res = new HashMap<String,Object>();
        Imgadv imgadv = imgadvDAO.findById(id);
        res.put("imgadv", imgadv);
        return res;
    }


    //焦点图编辑
    @ResponseBody
    @RequestMapping("admin/imgadvEdit")
    public void areaEdit(Imgadv imgadv,HttpServletRequest request) {
        imgadvDAO.update(imgadv);
    }
	
	//删除焦点图
	@ResponseBody
	@RequestMapping("admin/imgadvDel")
	public HashMap<String,Object> imgadvDel(int id,HttpServletRequest request) {
		imgadvDAO.delete(id);
		return null;
	}

}
