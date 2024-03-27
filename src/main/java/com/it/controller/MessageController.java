package com.it.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.it.dao.MemberDAO;
import com.it.dao.MessageDAO;
import com.it.entity.Member;
import com.it.entity.Message;
import com.it.util.Info;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

@Controller
public class MessageController extends BaseController {

	@Resource
    MessageDAO messageDAO;
    @Resource
    MemberDAO memberDAO;


	//留言列表
	@ResponseBody
	@RequestMapping("admin/messageList")
	public HashMap<String,Object> messageList(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum,@RequestParam(defaultValue = "1",value = "pageSize") Integer pageSize,HttpServletRequest request){
		String key = request.getParameter("key");
		HashMap<String,Object> res = new HashMap<String,Object>();
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("key", key);
		List<Message> messagelist = messageDAO.selectAll(map);
		for(Message message:messagelist){
            Member member = memberDAO.findById(message.getMemberid());
            message.setMember(member);
        }
		PageHelper.startPage(pageNum, pageSize);
		List<Message> list = messageDAO.selectAll(map);
        for(Message mes:list){
            Member member = memberDAO.findById(mes.getMemberid());
            mes.setMember(member);
        }
		PageInfo<Message> pageInfo = new PageInfo<Message>(list);
		res.put("pageInfo", pageInfo);
		res.put("list", messagelist);
		return res;
	}


    //留言添加
    @ResponseBody
    @RequestMapping("messageAdd")
    public void messageAdd(Message message,HttpServletRequest request) {
	    Member member = (Member)request.getSession().getAttribute("sessionmember");
	    message.setMemberid(member.getId());
        message.setSavetime(Info.getDateStr());
        messageDAO.add(message);
    }


    //留言编辑
    @ResponseBody
    @RequestMapping("admin/messageEdit")
    public void messageEdit(Message message,HttpServletRequest request) {
        messageDAO.update(message);
    }

    //留言删除
    @ResponseBody
    @RequestMapping("admin/messageDel")
    public void messageDel(int id,HttpServletRequest request) {
	    messageDAO.delete(id);
    }


}
