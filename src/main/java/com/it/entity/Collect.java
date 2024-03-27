package com.it.entity;


public class Collect {

    private int id;
    private int memberid;
    private int movieid;
    private int sheetid;
    private Movie movie;

    public int getSheetid() {
        return sheetid;
    }

    public void setSheetid(int sheetid) {
        this.sheetid = sheetid;
    }

    public Movie getMovie() {
        return movie;
    }

    public void setMovie(Movie movie) {
        this.movie = movie;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getMemberid() {
        return memberid;
    }

    public void setMemberid(int memberid) {
        this.memberid = memberid;
    }

    public int getMovieid() {
        return movieid;
    }

    public void setMovieid(int movieid) {
        this.movieid = movieid;
    }
}
