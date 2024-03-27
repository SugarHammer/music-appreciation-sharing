package com.it.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

import com.it.dao.MemberDAO;
import com.it.entity.Member;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;


@Controller
public class MemberController {
    @Resource
    MemberDAO memberDAO;


    //判断用户是否登录
    @ResponseBody
    @RequestMapping("checkmember")
    public HashMap<String, Object> checkmember(HttpServletRequest request) {
        HashMap<String, Object> res = new HashMap<String, Object>();
        Member sessionmember = (Member) request.getSession().getAttribute("sessionmember");
        if (sessionmember != null) {
            Member member = memberDAO.findById(sessionmember.getId());
            res.put("sessionmember", member);
            res.put("data", 200);

        } else {
            res.put("data", 400);
        }
        return res;
    }

    //退出
    @ResponseBody
    @RequestMapping("memberExit")
    public void memberexit(HttpServletRequest request) {
        request.getSession().removeAttribute("sessionmember");
    }

    //登录
    @ResponseBody
    @RequestMapping("Login")
    public HashMap<String, Object> Login(Member member, HttpServletRequest request) {
        HashMap<String, Object> res = new HashMap<String, Object>();
        HashMap<String, String> map = new HashMap<String, String>();
        map.put("uname", member.getUname());
        map.put("upass", member.getUpass());
        List<Member> list = memberDAO.selectAll(map);
        if (list.size() == 0) {
            res.put("data", 400);
        } else {
            Member mmm = list.get(0);

            request.getSession().setAttribute("sessionmember", mmm);
            res.put("sessionmember", mmm);
            res.put("data", 200);
        }
        return res;
    }

    //找回密码
    @ResponseBody
    @RequestMapping("forget")
    public HashMap<String, Object> forget(Member member, HttpServletRequest request) {
        HashMap<String, Object> res = new HashMap<String, Object>();
        HashMap<String, String> map = new HashMap<String, String>();
        map.put("uname", member.getUname());
        map.put("tel", member.getTel());
        List<Member> list = memberDAO.selectAll(map);
        if (list.size() == 0) {
            res.put("data", 400);
        } else {
            Member mmm = list.get(0);
            res.put("mm", mmm.getUpass());
            res.put("data", 200);
        }
        return res;
    }


    //检查用户名的唯一性
    @ResponseBody
    @RequestMapping("checkUname")
    public HashMap<String, Object> checkUname(String uname, HttpServletRequest request, HttpServletResponse response) {
        HashMap<String, Object> res = new HashMap<String, Object>();
        HashMap<String, String> map = new HashMap<String, String>();
        map.put("uname", uname);
        List<Member> list = memberDAO.selectAll(map);
        if(list.size()==0){
            res.put("data", 200);
        }else{
            res.put("data", 400);
        }
        return  res;
    }


    //后台用户列表
    @ResponseBody
    @RequestMapping("admin/memberList")
    public HashMap<String, Object> memberList(@RequestParam(defaultValue = "1", value = "pageNum") Integer pageNum, @RequestParam(defaultValue = "1", value = "pageSize") Integer pageSize, HttpServletRequest request) {
        String key = request.getParameter("key");
        HashMap<String, Object> res = new HashMap<String, Object>();
        HashMap<String, String> map = new HashMap<String, String>();
        map.put("key", key);
        List<Member> memberlist = memberDAO.selectAll(map);
        PageHelper.startPage(pageNum, pageSize);
        List<Member> list = memberDAO.selectAll(map);
        PageInfo<Member> pageInfo = new PageInfo<Member>(list);
        res.put("pageInfo", pageInfo);
        res.put("list", memberlist);
        return res;
    }


    //用户注册
    @ResponseBody
    @RequestMapping("Register")
    public HashMap<String, Object> Register(Member member, HttpServletRequest request) {
        HashMap<String, Object> res = new HashMap<String, Object>();
        memberDAO.add(member);
        res.put("data", 200);
        return res;
    }


    //修改个人信息
    @ResponseBody
    @RequestMapping("memberEdit")
    public HashMap<String, Object> memberEdit(Member member, HttpServletRequest request) {
        HashMap<String, Object> res = new HashMap<String, Object>();
        memberDAO.update(member);
        res.put("data", 200);
        return res;
    }


    /**
     * 用户信息
     * @param id
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping("memberShow")
    public HashMap<String, Object> memberShow(int id, HttpServletRequest request) {
        HashMap<String, Object> res = new HashMap<String, Object>();
        Member member = memberDAO.findById(id);
        res.put("member", member);
        return res;
    }


    //删除用户
    @ResponseBody
    @RequestMapping("admin/memberDel")
    public void memberDel(int id, HttpServletRequest request) {
        memberDAO.delete(id);
    }




}
