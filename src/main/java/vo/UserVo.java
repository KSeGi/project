package vo;

import java.sql.Date;

public class UserVo {
	private int u_no;
	private String u_id;
	private String u_pw;
	private	String u_name;
	private String u_nickname;
	private String u_email;
	private String u_tell;
	private String address;
	private String u_grade;
	private Date u_joindate;
	
	public UserVo() {

	}
	
	
	public int getU_no() {
		return u_no;
	}
	public void setU_no(int u_no) {
		this.u_no = u_no;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getU_pw() {
		return u_pw;
	}
	public void setU_pw(String u_pw) {
		this.u_pw = u_pw;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public String getU_nickname() {
		return u_nickname;
	}
	public void setU_nickname(String u_nickname) {
		this.u_nickname = u_nickname;
	}
	public String getU_email() {
		return u_email;
	}
	public void setU_email(String u_email) {
		this.u_email = u_email;
	}
	public String getU_tell() {
		return u_tell;
	}
	public void setU_tell(String u_tell) {
		this.u_tell = u_tell;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getU_grade() {
		return u_grade;
	}
	public void setU_grade(String u_grade) {
		this.u_grade = u_grade;
	}
	public Date getU_joindate() {
		return u_joindate;
	}
	public void setU_joindate(Date u_joindate) {
		this.u_joindate = u_joindate;
	}
	
	
}
