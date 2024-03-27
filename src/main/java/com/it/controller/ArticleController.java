package com.it.controller;



import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.it.dao.*;
import com.it.entity.Article;
import com.it.entity.Member;
import com.it.entity.Reply;
import com.it.entity.Section;

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
public class ArticleController {
    @Resource
    ArticleDAO articleDAO;
    @Resource
    SectionDAO sectionDAO;
    @Resource
    MemberDAO memberDao;
    @Resource
    ReplyDAO replyDAO;
	@Resource
	MovieDAO movieDAO;
    //后台文章列表
	@ResponseBody
	@RequestMapping("admin/articleList")
	public HashMap<String,Object> articleList(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum,@RequestParam(defaultValue = "1",value = "pageSize") Integer pageSize,HttpServletRequest request){
		String key = request.getParameter("key");
		String sectionid = request.getParameter("sectionid");
		String memberid = request.getParameter("memberid");

		HashMap<String,Object> res = new HashMap<String,Object>();
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("key", key);
		map.put("sectionid", sectionid);
		map.put("memberid", memberid);
		System.out.println(map);
		List<Article> objectlist = articleDAO.selectAll(map);
		for(Article article:objectlist){
		    Section section = sectionDAO.findById(article.getSectionid());
		    article.setSection(section);

            HashMap mmm = new HashMap();
            mmm.put("articleid", article.getId());
            List<Reply> replylist = replyDAO.selectAll(mmm);
            article.setReplylist(replylist);

            Member member = memberDao.findById(article.getMemberid());
            article.setMember(member);

        }
		PageHelper.startPage(pageNum, pageSize);
		List<Article> list = articleDAO.selectAll(map);
		for(Article article:list){
		    Section section = sectionDAO.findById(article.getSectionid());
		    article.setSection(section);

            HashMap mmm = new HashMap();
            mmm.put("articleid", article.getId());
            List<Reply> replylist = replyDAO.selectAll(mmm);
            article.setReplylist(replylist);

            Member member = memberDao.findById(article.getMemberid());
            article.setMember(member);

        }
		PageInfo<Article> pageInfo = new PageInfo<Article>(list);
		res.put("pageInfo", pageInfo);
		res.put("list", objectlist);
		return res;
	}

    

	//添加文章
    @ResponseBody
	@RequestMapping("articleAdd")
	public void articleAdd(Article article,HttpServletRequest request) {
        Member member = (Member)request.getSession().getAttribute("sessionmember");
        article.setMemberid(member.getId());
		article.setSavetime(Info.getDateStr());
        article.setIsjh("no");
		articleDAO.add(article);
	}

	//删除文章
    @ResponseBody
	@RequestMapping("admin/articleDel")
	public void articleDel(Integer id,HttpServletRequest request) {
		articleDAO.delete(id);
	}

	//查找article到修改页面
	@ResponseBody
	@RequestMapping("articleDetails")
	public HashMap<String,Object> articleDetails(Integer id,HttpServletRequest request) {
		HashMap<String,Object> res = new HashMap<String,Object>();
		Article article = articleDAO.findById(id);
		article.setLookcs(article.getLookcs()+1);
		articleDAO.update(article);
		article.setContent(Info.delHTMLTag(article.getContent()));
		HashMap map = new HashMap();
		map.put("articleid", article.getId());
		List<Reply> replylist = replyDAO.selectAll(map);
		for(Reply reply:replylist){
            Member mmm = memberDao.findById(reply.getMemberid());
            reply.setMember(mmm);
        }
        article.setReplylist(replylist);
		Member member = memberDao.findById(article.getMemberid());
		article.setMember(member);

		article.setMovie(movieDAO.findById(article.getMovieid()));
		res.put("article", article);
		return res;
	}

	//更新精华
	@ResponseBody
    @RequestMapping("admin/updateisjh")
    public void updateisjh(Integer id,HttpServletRequest request) {
	    Article article = articleDAO.findById(id);
	    if(article.getIsjh().equals("yes")){
            article.setIsjh("no");
        }else{
            article.setIsjh("yes");
        }
        articleDAO.update(article);
    }
    //点赞
	@ResponseBody
	@RequestMapping("articleDZ")
	public HashMap<String,Object> articleDZ(Integer id,HttpServletRequest request) {
		HashMap<String,Object> res = new HashMap<String,Object>();
		Article article = articleDAO.findById(id);
		article.setDznum(article.getDznum()+1);
		articleDAO.update(article);
		res.put("dznum", article.getDznum());
		return res;
	}

}
