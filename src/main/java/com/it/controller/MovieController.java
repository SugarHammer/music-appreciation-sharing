package com.it.controller;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.it.dao.*;
import com.it.entity.*;
import com.it.util.UserCFDemo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
public class MovieController {
	@Resource
    MovieDAO movieDAO;
    @Resource
    CategoryDAO categoryDAO;
    @Resource
    AreaDAO areaDAO;
    @Resource
    MemberDAO memberDAO;
    @Resource
    CollectDAO collectDAO;
    @Resource
    CommentDAO commentDAO;
    @Resource
    PlayrecordDAO playrecordDAO;
    @Resource
    DzrecordDAO dzrecordDAO;

    //用户上传
    @ResponseBody
    @RequestMapping("admin/movieAddforMemebr")
    public void movieAddforMemebr(Movie movie,HttpServletRequest request) {
        Member sessionmember = (Member) request.getSession().getAttribute("sessionmember");
        movie.setMemberid(String.valueOf(sessionmember.getId()));
        movie.setIsfree("是");
        movieDAO.add(movie);
    }
    //用户上传歌曲列表
    @ResponseBody
    @RequestMapping("myUploadList")
    public HashMap<String,Object> myUploadList(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum,@RequestParam(defaultValue = "1",value = "pageSize") Integer pageSize,HttpServletRequest request) {
        Member sessionmember = (Member) request.getSession().getAttribute("sessionmember");
        String key = request.getParameter("key");
        String key1 = request.getParameter("key1");
        String key2 = request.getParameter("key2");
        String key3 = request.getParameter("key3");
        String orderby = request.getParameter("orderby");
        String shstatus = request.getParameter("shstatus");
        HashMap<String,Object> res = new HashMap<String,Object>();
        HashMap map = new HashMap();
        map.put("key", key);
        map.put("key1", key1);
        map.put("key2", key2);
        map.put("key3", key3);
        map.put("orderby", orderby);
        map.put("shstatus", shstatus);
        map.put("memberid", sessionmember.getId());
        List<Movie> movielist = movieDAO.selectAll(map);
        for(Movie movie:movielist){
            Category category = categoryDAO.findById(movie.getCategoryid());
            Area area = areaDAO.findById(movie.getAreaid());
            movie.setCategory(category);
            movie.setArea(area);
            if(!movie.getMemberid().equals("0")){
                movie.setMember(memberDAO.findById(Integer.valueOf(movie.getMemberid())));
            }
        }
        PageHelper.startPage(pageNum, pageSize);
        List<Movie> list = movieDAO.selectAll(map);
        for(Movie movie:list){
            Category category = categoryDAO.findById(movie.getCategoryid());
            Area area = areaDAO.findById(movie.getAreaid());
            movie.setCategory(category);
            movie.setArea(area);
            if(!movie.getMemberid().equals("0")){
                movie.setMember(memberDAO.findById(Integer.valueOf(movie.getMemberid())));
            }
        }
        PageInfo<Movie> pageInfo = new PageInfo<Movie>(list);
        res.put("pageInfo", pageInfo);
        res.put("list", movielist);
        return res;
    }



    @ResponseBody
    @RequestMapping("musicList")
    public HashMap<String,Object> musicList(HttpServletRequest request){
//		String key = request.getParameter("key");
        String sheetid = request.getParameter("sheetid");
        String shstatus = request.getParameter("shstatus");
        HashMap<String,Object> res = new HashMap<String,Object>();
        HashMap<String,String> map = new HashMap<String,String>();
		map.put("shstatus", shstatus);
        map.put("sheetid", sheetid);
        List<Movie> movielist = movieDAO.selectSongs(map);
        List<MusicBean> musiclist = new ArrayList<MusicBean>();
        for(Movie movie:movielist){
            MusicBean musicBean = new MusicBean();
            musicBean.setId(movie.getId());
            musicBean.setTitle(movie.getName());
            musicBean.setSinger(movie.getAuthor());
            musicBean.setSongUrl("http://localhost:8088/vuemusicshareptboot/upload/"+movie.getVideoname());
            musicBean.setImageUrl("http://localhost:8088/vuemusicshareptboot/upload/"+movie.getFilename());
            musiclist.add(musicBean);
        }

        res.put("list", movielist);
        res.put("musiclist", JSONObject.toJSON(musiclist));
        return res;
    }

	//后台歌曲列表
    @ResponseBody
	@RequestMapping("admin/movieList")
	public HashMap<String,Object> movieList(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum,@RequestParam(defaultValue = "1",value = "pageSize") Integer pageSize,HttpServletRequest request) {
        String key = request.getParameter("key");
        String key1 = request.getParameter("key1");
        String key2 = request.getParameter("key2");
        String key3 = request.getParameter("key3");
        String orderby = request.getParameter("orderby");
        String shstatus = request.getParameter("shstatus");
        HashMap<String,Object> res = new HashMap<String,Object>();
        HashMap<String,String> map = new HashMap<String,String>();
        map.put("key", key);
        map.put("key1", key1);
        map.put("key2", key2);
        map.put("key3", key3);
        map.put("orderby", orderby);
        map.put("shstatus", shstatus);
        List<Movie> movielist = movieDAO.selectAll(map);
        for(Movie movie:movielist){
            Category category = categoryDAO.findById(movie.getCategoryid());
            Area area = areaDAO.findById(movie.getAreaid());
            movie.setCategory(category);
            movie.setArea(area);
            if(!movie.getMemberid().equals("0")){
                movie.setMember(memberDAO.findById(Integer.valueOf(movie.getMemberid())));
            }
        }
        PageHelper.startPage(pageNum, pageSize);
        List<Movie> list = movieDAO.selectAll(map);
        for(Movie movie:list){
            Category category = categoryDAO.findById(movie.getCategoryid());
            Area area = areaDAO.findById(movie.getAreaid());
            movie.setCategory(category);
            movie.setArea(area);
            if(!movie.getMemberid().equals("0")){
                movie.setMember(memberDAO.findById(Integer.valueOf(movie.getMemberid())));
            }
        }
        PageInfo<Movie> pageInfo = new PageInfo<Movie>(list);
        res.put("pageInfo", pageInfo);
        res.put("list", movielist);
        return res;
	}


    //歌曲编辑
    @ResponseBody
    @RequestMapping("admin/musicSH")
    public void musicSH(int id,int flag,HttpServletRequest request) {
        Movie movie = movieDAO.findById(id);
        if(flag == 1){
            movie.setShstatus("通过");
        }else{
            movie.setShstatus("拒绝");
        }
        movieDAO.update(movie);
    }

    @ResponseBody
    @RequestMapping("queryPD")
    public HashMap<String,Object> queryPD(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum,@RequestParam(defaultValue = "1",value = "pageSize") Integer pageSize,HttpServletRequest request) {
        String orderby = request.getParameter("orderby");

        HashMap<String,Object> res = new HashMap<String,Object>();
        HashMap<String,String> map = new HashMap<String,String>();
        map.put("orderby", "score");
        List<Movie> pfpdlist = movieDAO.selectAll(map);
        for(Movie movie:pfpdlist){
            Category category = categoryDAO.findById(movie.getCategoryid());
            Area area = areaDAO.findById(movie.getAreaid());
            movie.setCategory(category);
            movie.setArea(area);
        }
        map.put("orderby", "cs");
        List<Movie> bfpdlist = movieDAO.selectAll(map);
        for(Movie movie:bfpdlist){
            Category category = categoryDAO.findById(movie.getCategoryid());
            Area area = areaDAO.findById(movie.getAreaid());
            movie.setCategory(category);
            movie.setArea(area);
        }

        res.put("pfpdlist", pfpdlist);
        res.put("bfpdlist", bfpdlist);
        return res;
    }
	
	//歌曲添加
    @ResponseBody
	@RequestMapping("admin/movieAdd")
	public void movieAdd(Movie movie,HttpServletRequest request) {
		movieDAO.add(movie);
	}
	
	
	//编辑页面
    @ResponseBody
	@RequestMapping("admin/movieShow")
	public HashMap<String,Object> movieShow(int id,HttpServletRequest request) {
        HashMap<String,Object> res = new HashMap<String,Object>();
        Movie movie = movieDAO.findById(id);
        Category category = categoryDAO.findById(movie.getCategoryid());
        Area area = areaDAO.findById(movie.getAreaid());
        movie.setCategory(category);
        movie.setArea(area);
        HashMap map = new HashMap();
        map.put("movieid",id);
        List<Dzrecord> dzrecordlist = dzrecordDAO.selectAll(map);
        movie.setZan(dzrecordlist.size());
        res.put("movie", movie);
        return res;
	}

	//歌曲编辑
    @ResponseBody
	@RequestMapping("admin/movieEdit")
	public void movieEdit(Movie movie,HttpServletRequest request) {
        System.out.println("a="+movie.getIsfree());
		movieDAO.update(movie);
	}
	
	//歌曲删除
    @ResponseBody
	@RequestMapping("admin/movieDel")
	public void movieDel(int id,HttpServletRequest request) {
		movieDAO.delete(id);
	}




    //猜你喜欢  协同过滤方法
    @ResponseBody
    @RequestMapping("loveRecommend")
    public HashMap<String,Object> loveRecommend(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum,HttpServletRequest request){
        Member sessionmember = (Member) request.getSession().getAttribute("sessionmember");
        HashMap<String,Object> res = new HashMap<String,Object>();
        //会员集合
        List<Member> ulist = memberDAO.selectAll(null);
        String[] uarray=new String[ulist.size()];
        for(int i=0;i<ulist.size();i++){
            uarray[i]=String.valueOf(ulist.get(i).getId());
        }
//
//			for(int m=0;m<uarray.length;m++){
//				System.out.println(uarray[m]+"  ");
//			}

        //音乐集合
        HashMap map = new HashMap();
        map.put("shstatus", "通过");
        List<Movie> productlist = movieDAO.selectAll(map);
        String[] dyarray=new String[productlist.size()];
        for(int i=0;i<productlist.size();i++){
            dyarray[i]=String.valueOf(productlist.get(i).getId());
        }

//
//			for(int m=0;m<dyarray.length;m++){
//				System.out.println(dyarray[m]+"  ");
//			}

        //评分
        int [][] arr2 = new int[ulist.size()][];
        int count = 0;
        //System.out.println("arr2.length=="+arr2.length);
        for(int i=0;i<arr2.length;i++){
            Member mb = ulist.get(i);
            //System.out.println("userobj"+i+"    "+userobj);
            //创建一维数组
            int[] tmpArr = new int[productlist.size()];
            //创建二维数组
            for(int j=0;j < tmpArr.length;j++){
                int pf = 0;
                Movie product = productlist.get(j);
                HashMap m1 = new HashMap();
                m1.put("movieid", product.getId());
                m1.put("memberid", mb.getId());
                //收藏 权重 2
                List<Collect> collectlist = collectDAO.selectAll(m1);
                if(collectlist.size()>0){
                    pf += collectlist.size() * 2;
                }
                //评论权重  按分计数
                List<Comment> commentlist = commentDAO.selectAll(m1);
                for(Comment c:commentlist){
                    pf += c.getScore();
                }
                //播放权重 一次+1
                List<Playrecord> playlist = playrecordDAO.selectAll(m1);
                pf += playlist.size();

                tmpArr[j] = pf;
                //System.out.println("dyobj"+j+"    "+dyobj);
                //tmpArr[j] = (++count);
            }
            arr2[i] = tmpArr;
        }
        for(int m=0;m<arr2.length;m++){
            for(int n=0;n<arr2[m].length;n++){
                System.out.print(arr2[m][n]+"  ");
            }
            System.out.println();
        }

        UserCFDemo u = new UserCFDemo();
        u.users = uarray;
        u.movies = dyarray;
        u.allUserMovieStarList = arr2;
        u.membernum = ulist.size();
        u.mvnum = productlist.size();
        List<String> rtnlist = u.mvlist(String.valueOf(sessionmember.getId()));
        String aa = "";
        List<Movie> tjproductlist = new ArrayList<Movie>();
        for(int m = 0;m< rtnlist.size();m++){
            Movie p = movieDAO.findById(Integer.valueOf(rtnlist.get(m)));
            tjproductlist.add(p);
            System.out.println("推荐的音乐==="+p.getName());
        }
        for(Movie movie:tjproductlist){
            Category category = categoryDAO.findById(movie.getCategoryid());
            Area area = areaDAO.findById(movie.getAreaid());
            movie.setCategory(category);
            movie.setArea(area);
        }

        res.put("list", tjproductlist);
        return res;
    }



    @ResponseBody
    @RequestMapping("admin/lineTj")
    public HashMap<String,Object> lineTj(HttpServletRequest request) {
        HashMap<String,Object> res = new HashMap<String,Object>();
        String key = request.getParameter("key");
        List<Category> clist = categoryDAO.selectAll(null);
        ArrayList nlist = new ArrayList();
        ArrayList slist = new ArrayList();
        for(Category category:clist){
            nlist.add(category.getName());
            HashMap map = new HashMap();
            map.put("categroyid",category.getId());
            List<Dzrecord> dzlist = dzrecordDAO.selectAll(map);
            slist.add(dzlist.size());
        }
        res.put("nlist", nlist);
        res.put("slist", slist);
        return res;
    }
}
