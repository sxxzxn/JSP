package project.dao;

import java.util.List;

import project.dto.Member;

public interface MemberDAO {
	public List<Member> getAllMemberList();
	public Member getMemberByMemid(String memid);
	public String getMemidByMnamePhone(String mname, String phone);
	public String getPwdByMemidMname(String memid, String mname);
	public Member getMemberByMemidPwd(String memid, String pwd);
	public int insertMember(Member member);
	public int updateMember(Member member);
	public boolean deleteMember(String memid, String pwd);
	public String getAllMemberPrint();
}
