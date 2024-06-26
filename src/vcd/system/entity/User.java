package vcd.system.entity;

//借阅vcd
public class User {


	private String jyr;
	private String ghsj;
	private String jysj;
	private String note;//备注
	private String stuno;
	private Integer flag;
	private int id;
	private String vcdName;
	private String vcdNo;
	private String creatTime;
	private String price;
	private String profile;

	public String getJyr() {
		return jyr;
	}

	public void setJyr(String jyr) {
		this.jyr = jyr;
	}

	public String getGhsj() {
		return ghsj;
	}

	public void setGhsj(String ghsj) {
		this.ghsj = ghsj;
	}

	public String getJysj() {
		return jysj;
	}

	public void setJysj(String jysj) {
		this.jysj = jysj;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getStuno() {
		return stuno;
	}

	public void setStuno(String stuno) {
		this.stuno = stuno;
	}

	public Integer getFlag() {
		return flag;
	}

	public void setFlag(Integer flag) {
		this.flag = flag;
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

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}
}
