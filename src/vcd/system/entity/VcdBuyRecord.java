package vcd.system.entity;

import java.math.BigDecimal;

public class VcdBuyRecord {
    private String vcdNo;

    private String vcdName;

    private Long vcdBuyNum;

    private BigDecimal vcdPrice;


    public void setVcdPrice(BigDecimal vcdPrice) { this.vcdPrice = vcdPrice; }
    public void setVcdNo(String vcdNo){
        this.vcdNo = vcdNo;
    }
    public void setVcdName(String vcdName){
        this.vcdName = vcdName;
    }
    public void setVcdBuyNum(Long vcdBuyNum){
        this.vcdBuyNum = vcdBuyNum;
    }

    public String getVcdNo(){ return vcdNo; }

    public String getVcdName(){ return vcdName; }

    //count
    public Long getVcdBuyNum(){ return vcdBuyNum; }

    //amount
    public BigDecimal getVcdPrice(){ return vcdPrice; }
}
