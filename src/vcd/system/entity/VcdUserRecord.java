package vcd.system.entity;

public class VcdUserRecord {
    private String vcdNo;

    private String vcdName;

    private Long vcdBorrowNum;

    private Long vcdReturnNum;



    public void setVcdNo(String vcdNo){
        this.vcdNo = vcdNo;
    }
    public void setVcdName(String vcdName){
        this.vcdName = vcdName;
    }
    public void setVcdBorrowNum(Long vcdBorrowNum) { this.vcdBorrowNum = vcdBorrowNum; }
    public void setVcdReturnNum(Long vcdReturnNum){
        this.vcdReturnNum = vcdReturnNum;
    }

    public String getVcdNo(){ return vcdNo; }

    public String getVcdName(){ return vcdName; }

    //count
    public Long getVcdBorrowNum(){ return vcdBorrowNum; }

    //amount
    public Long getVcdReturnNum(){ return vcdReturnNum; }
}
