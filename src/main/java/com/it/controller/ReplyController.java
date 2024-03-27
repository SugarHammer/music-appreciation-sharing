package com.it.controller;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.it.dao.ArticleDAO;
import com.it.dao.MemberDAO;
import com.it.dao.ReplyDAO;
import com.it.entity.Article;
import com.it.entity.Member;
import com.it.entity.Reply;

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
public class ReplyController {
    @Resource
    ReplyDAO replyDAO;
    @Resource
    MemberDAO memberDAO;
    @Resource
    ArticleDAO articleDAO;


	//后台评论列表
	@ResponseBody
	@RequestMapping("admin/replyList")
	public HashMap<String,Object> replyList(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum,@RequestParam(defaultValue = "1",value = "pageSize") Integer pageSize,HttpServletRequest request){
		String key = request.getParameter("key");
		String articleid = request.getParameter("articleid");
		HashMap<String,Object> res = new HashMap<String,Object>();
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("key", key);
		map.put("articleid", articleid);
		List<Reply> objectlist = replyDAO.selectAll(map);
		for(Reply reply:objectlist){
			Member member = memberDAO.findById(reply.getMemberid());
			Article article = articleDAO.findById(reply.getArticleid());
			reply.setMember(member);
			reply.setArticle(article);
		}
		PageHelper.startPage(pageNum, pageSize);
		List<Reply> list = replyDAO.selectAll(map);
		for(Reply reply:list){
			Member member = memberDAO.findById(reply.getMemberid());
			Article article = articleDAO.findById(reply.getArticleid());
			reply.setMember(member);
			reply.setArticle(article);
		}
		PageInfo<Reply> pageInfo = new PageInfo<Reply>(list);
		res.put("pageInfo", pageInfo);
		res.put("list", objectlist);
		return res;
	}
	//添加评论
	@ResponseBody
	@RequestMapping("replyAdd")
	public void replyAdd(Reply reply,HttpServletRequest request) {
        Member member = (Member)request.getSession().getAttribute("sessionmember");
        reply.setMemberid(member.getId());
        reply.setSavetime(Info.getDateStr());
		replyDAO.add(reply);
	}

	//删除评论
	@ResponseBody
	@RequestMapping("admin/replyDel")
	public void replyDel(Integer id,HttpServletRequest request) {
	    Reply reply = replyDAO.findById(id);
        replyDAO.delete(id);
	}


}
