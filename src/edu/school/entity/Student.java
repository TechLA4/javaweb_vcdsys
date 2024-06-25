package edu.school.entity;
//学生
public class Student {
   
	public Student() {
		super();
	}
	public Student(Integer id, String stuno, String realname, String pwd, String phone, String sex,
			String createDate) {
		super();
		this.id = id;
		this.stuno = stuno;
		this.realname = realname;
		this.pwd = pwd;
		this.phone = phone;
		this.sex = sex;
		this.createDate = createDate;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getStuno() {
		return stuno;
	}
	public void setStuno(String stuno) {
		this.stuno = stuno;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getPhone(){ return phone; }
	public void setPhone(String phone) { this.phone = phone; }

	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	private Integer id;
	private String stuno;
	private String realname;//学生姓名
    private String pwd;//密码

    private String  sex;//性别

	private String phone; //电话号码

    private String  createDate;//录入日期

}
