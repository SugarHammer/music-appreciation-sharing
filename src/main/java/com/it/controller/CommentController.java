package com.it.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.it.dao.*;
import com.it.entity.*;
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
public class CommentController extends BaseController {

    @Resource
    CommentDAO commentDAO;
    @Resource
    MovieDAO movieDAO;
    @Resource
    MemberDAO memberDAO;
    @Resource
    SysuserDAO sysuserDAO;
    @Resource
    PlayrecordDAO playrecordDAO;

    //评论列表
    @ResponseBody
    @RequestMapping("admin/commentList")
    public HashMap<String, Object> commentList(@RequestParam(defaultValue = "1", value = "pageNum") Integer pageNum, @RequestParam(defaultValue = "1", value = "pageSize") Integer pageSize, HttpServletRequest request) {
        String key = request.getParameter("key");
        String movieid = request.getParameter("movieid");
        HashMap<String, Object> res = new HashMap<String, Object>();
        HashMap map = new HashMap();
        map.put("key", key);
        map.put("movieid", movieid);
        List<Comment> objectlist = commentDAO.selectAll(map);
        for (Comment comment : objectlist) {
            Member member = memberDAO.findById(comment.getMemberid());
            Movie movie = movieDAO.findById(comment.getMovieid());
            comment.setMovie(movie);
            comment.setMember(member);
        }
        PageHelper.startPage(pageNum, pageSize);
        List<Comment> list = commentDAO.selectAll(map);
        for (Comment comment : list) {
            Member member = memberDAO.findById(comment.getMemberid());
            Movie movie = movieDAO.findById(comment.getMovieid());
            comment.setMovie(movie);
            comment.setMember(member);
        }
        PageInfo<Comment> pageInfo = new PageInfo<Comment>(list);
        res.put("pageInfo", pageInfo);
        res.put("list", objectlist);

        return res;
    }


    //添加评论
    @ResponseBody
    @RequestMapping("commentAdd")
    public HashMap<String, Object> commentAdd(Comment comment, HttpServletRequest request) {
        Member member = (Member) request.getSession().getAttribute("sessionmember");
        HashMap<String, Object> res = new HashMap<String, Object>();
        HashMap map = new HashMap();
        map.put("memberid", member.getId());
        map.put("movieid", comment.getMovieid());
        List<Playrecord> list = playrecordDAO.selectAll(map);
        if(list.size()==0){
            res.put("data", 300);//无播放记录
        }else{
            List<Comment> plist = commentDAO.selectAll(map);
            if (plist.size() == 0) {
                comment.setMemberid(member.getId());
                comment.setSavetime(Info.getDateStr());
                commentDAO.add(comment);
                res.put("data", 200);//成功

                Movie movie = movieDAO.findById(comment.getMovieid());
                if(movie.getScore()==0){
                    movie.setScore(comment.getScore());
                }else{
                    double score = (movie.getScore()+comment.getScore())/2;
                    movie.setScore(score);
                }
                movieDAO.update(movie);
            } else {
                res.put("data", 400);//已评
            }
        }
        return res;
    }



    /**
     * 评论回复
     *
     * @param id
     * @param hfcontent
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping("admin/commentEdit")
    public HashMap<String, Object> commentEdit(int id, String hfcontent, HttpServletRequest request) {
        Comment comment = commentDAO.findById(id);
        comment.setHfcontent(hfcontent);
        commentDAO.update(comment);
        return null;
    }


    //删除评论
    @ResponseBody
    @RequestMapping("admin/commentDel")
    public HashMap<String, Object> commentDel(int id, HttpServletRequest request) {
        commentDAO.delete(id);
        return null;
    }

}
