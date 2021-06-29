package kr.co.mlec.member.vo;

import javax.validation.constraints.NotBlank;

import org.hibernate.validator.constraints.Length;


public class MemberVO {
	@NotBlank(message = "필수항목입니다")
	private String id;
	@NotBlank(message = "필수항목입니다")
	private String name;
	@NotBlank(message = "필수항목입니다")
	@Length(min=3, max=10, message="최소 3글자이상 10글자 이하를 입력하세요")
	private String password;
	private String type;
	@NotBlank(message = "필수항목입니다")
	private String phone1;
	@NotBlank(message = "필수항목입니다")
	private String phone2;
	@NotBlank(message = "필수항목입니다")
	private String phone3;
	private String nickname;
	private String regDate;
	
	public MemberVO() {
		super();
	}
	

	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", name=" + name + ", password=" + password + ", type=" + type + ", phone1="
				+ phone1 + ", phone2=" + phone2 + ", phone3=" + phone3 + ", nickname=" + nickname + ", regDate=" + regDate
				+ "]";
	}


	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getPhone3() {
		return phone3;
	}
	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
}