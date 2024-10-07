package net.fullstack7.member;

public class MemberDTO {
	private String memberId;
	private String name;
	private String gender;
	private String school;
	private String hobby;
	
	public MemberDTO() {}

	public MemberDTO(String memberId, String name, String gender) {
		this.memberId = memberId;
		this.name = name;
		this.gender = gender;
	}

	
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public String getHobby() {
		return hobby;
	}

	public void setHobby(String hobby) {
		this.hobby = hobby;
	}

}
