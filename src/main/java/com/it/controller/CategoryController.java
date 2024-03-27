package com.it.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.it.util.Info;
import com.it.entity.Category;
import com.it.entity.Sysuser;
import com.it.dao.CategoryDAO;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

@Controller
public class CategoryController{
	@Resource
	CategoryDAO categoryDAO;
	
	
	//后台分类列表
    @ResponseBody
	@RequestMapping("admin/categoryList")
	public HashMap<String,Object> categoryList(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum,@RequestParam(defaultValue = "1",value = "pageSize") Integer pageSize,HttpServletRequest request) {
        String key = request.getParameter("key");
        HashMap<String,Object> res = new HashMap<String,Object>();
        HashMap<String,String> map = new HashMap<String,String>();
        map.put("key", key);
        List<Category> categorylist = categoryDAO.selectAll(map);
        PageHelper.startPage(pageNum, pageSize);
        List<Category> list = categoryDAO.selectAll(map);
        PageInfo<Category> pageInfo = new PageInfo<Category>(list);
        res.put("pageInfo", pageInfo);
        res.put("list", categorylist);
        return res;
	}
	
	
	
	//分类添加
    @ResponseBody
	@RequestMapping("admin/categoryAdd")
	public void categoryAdd(Category category,HttpServletRequest request) {
		categoryDAO.add(category);
	}
	
	
	//编辑页面
    @ResponseBody
	@RequestMapping("admin/categoryShow")
	public HashMap<String,Object> categoryShow(int id,HttpServletRequest request) {
        HashMap<String,Object> res = new HashMap<String,Object>();
		Category category = categoryDAO.findById(id);
        res.put("category", category);
        return res;
	}
	
	
	//分类编辑
    @ResponseBody
	@RequestMapping("admin/categoryEdit")
	public void categoryEdit(Category category,HttpServletRequest request) {
		categoryDAO.update(category);
	}
	
	//分类删除
    @ResponseBody
	@RequestMapping("admin/categoryDel")
	public void categoryDel(int id,HttpServletRequest request) {
		categoryDAO.delete(id);
	}
	
	

}
