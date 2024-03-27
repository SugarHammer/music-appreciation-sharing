package com.it.entity;


import java.util.List;

public class Article {

    private int id;
    private int memberid;
    private String title;
    private String filename;
    private String content;
    private String savetime;
    private int lookcs;
    private String delstatus;
    private int sectionid;
    private String isjh;
    private int dznum;
    private int movieid;

    private List<Reply> replylist;

    private Member member;
    private Movie movie;
    private Section section;

    public int getMovieid() {
        return movieid;
    }

    public void setMovieid(int movieid) {
        this.movieid = movieid;
    }

    public Movie getMovie() {
        return movie;
    }

    public void setMovie(Movie movie) {
        this.movie = movie;
    }

    public int getDznum() {
        return dznum;
    }

    public void setDznum(int dznum) {
        this.dznum = dznum;
    }

    public List<Reply> getReplylist() {
        return replylist;
    }

    public void setReplylist(List<Reply> replylist) {
        this.replylist = replylist;
    }

    public String getIsjh() {
        return isjh;
    }

    public void setIsjh(String isjh) {
        this.isjh = isjh;
    }

    public Section getSection() {
        return section;
    }

    public void setSection(Section section) {
        this.section = section;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Member getMember() {
        return member;
    }

    public void setMember(Member member) {
        this.member = member;
    }

    public int getMemberid() {
        return memberid;
    }

    public void setMemberid(int memberid) {
        this.memberid = memberid;
    }

    public int getSectionid() {
        return sectionid;
    }

    public void setSectionid(int sectionid) {
        this.sectionid = sectionid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }


    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }


    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }


    public String getSavetime() {
        return savetime;
    }

    public void setSavetime(String savetime) {
        this.savetime = savetime;
    }


    public int getLookcs() {
        return lookcs;
    }

    public void setLookcs(int lookcs) {
        this.lookcs = lookcs;
    }

    public String getDelstatus() {
        return delstatus;
    }

    public void setDelstatus(String delstatus) {
        this.delstatus = delstatus;
    }

}
