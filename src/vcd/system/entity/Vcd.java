package vcd.system.entity;

//vcd
public class Vcd {
    private int id;
    private String vcdName;
    private String vcdNo;
    private String creatTime;
    private Double price;
    private String profile;
    private Integer stock;

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getVcdName() {
        return vcdName;
    }

    public void setVcdName(String vcdName) {
        this.vcdName = vcdName;
    }

    public String getVcdNo() {
        return vcdNo;
    }

    public void setVcdNo(String vcdNo) {
        this.vcdNo = vcdNo;
    }

    public String getCreatTime() {
        return creatTime;
    }

    public void setCreatTime(String creatTime) {
        this.creatTime = creatTime;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }
}
