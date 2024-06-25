package edu.school.entity;

public class VcdBuyRecord {
    private String vcdNo;

    private String vcdName;

    private String vcdBuyNum;

    private String vcdPrice;

    public void setVcdNo(String vcdNo){
        this.vcdNo = vcdNo;
    }
    public void setVcdName(String vcdName){
        this.vcdName = vcdName;
    }
    public void setVcdBuyNum(String vcdBuyNum){
        this.vcdBuyNum = vcdBuyNum;
    }

    public String getVcdNo(){ return vcdNo; }

    public String getVcdName(){ return vcdName; }

    public String getVcdBuyNum(){ return vcdBuyNum; }
}
