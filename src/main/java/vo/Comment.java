package vo;

public class Comment {
	private String c_no;
	private String b_no;
	private String u_no;
	private String c_text;
	private String c_joindate;
	
	public Comment() {

	}
	
	public Comment(String b_no,String u_no,String c_text) {
		
	}

	public String getC_no() {
		return c_no;
	}
	
	public void setC_no(String c_no) {
		this.c_no = c_no;
	}
	
	public String getB_no() {
		return b_no;
	}
	
	public void setB_no(String b_no) {
		this.b_no = b_no;
	}
	
	public String getU_no() {
		return u_no;
	}
	
	public void setU_no(String u_no) {
		this.u_no = u_no;
	}
	
	public String getC_text() {
		return c_text;
	}
	
	public void setC_text(String c_text) {
		this.c_text = c_text;
	}
	
	public String getC_joindate() {
		return c_joindate;
	}
	
	public void setC_joindate(String c_joindate) {
		this.c_joindate = c_joindate;
	}

	@Override
	public String toString() {
		return "Comment [c_no=" + c_no + ", b_no=" + b_no + ", u_no=" + u_no + ", c_text=" + c_text + ", c_joindate="
				+ c_joindate + "]";
	}

	

}
