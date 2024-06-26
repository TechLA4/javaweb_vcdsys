package vcd.system.entity;

public class Buy {
    private int id;
    private String vcdNo;
    private String stuNo;
    private String gmr;
    private String vcdName;
    private String creatTime;
    private Double price;

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getVcdNo() {
        return vcdNo;
    }

    public void setVcdNo(String vcdNo) {
        this.vcdNo = vcdNo;
    }

    public String getStuNo() {
        return stuNo;
    }

    public void setStuNo(String stuNo) {
        this.stuNo = stuNo;
    }

    public String getGmr() {
        return gmr;
    }

    public void setGmr(String gmr) {
        this.gmr = gmr;
    }

    public String getVcdName() {
        return vcdName;
    }

    public void setVcdName(String vcdName) {
        this.vcdName = vcdName;
    }

    public String getCreatTime() {
        return creatTime;
    }

    public void setCreatTime(String creatTime) {
        this.creatTime = creatTime;
    }
}
