package project.services;



import project.dao.MemberDAO;
import project.dao.OracleMemberDAO;
import project.dto.Member;

public class MemberService {
	MemberDAO memberDao = new OracleMemberDAO();
	
	// 생성자로 DB 지정. ex) oracle, mysql, maria ...
	public MemberService(MemberDAO memberDao) {
		this.memberDao = memberDao;
	}
	
	// 아이디 중복 체크
	public boolean existMemid(String memid) {
		boolean exist = false;
		if (memberDao.getMemberByMemid(memid).getMemid() != null) exist = true;
		return exist;
	}
	
	// 회원가입
	public void insert(Member member) {
		memberDao.insertMember(member);
	}
	
	// 로그인
	public Member login(String memid, String pwd) {
		return memberDao.getMemberByMemidPwd(memid, pwd);
	}
	
	// 아이디 찾기
	public String findMemid(String mname, String phone) {
		return memberDao.getMemidByMnamePhone(mname, phone);
	}
	
	// 비밀번호 찾기
	public String findPwd(String memid, String mname) {
		return memberDao.getPwdByMemidMname(memid, mname);
	}
	
	// 정보 수정
	public void update(Member newMember) {
		memberDao.updateMember(newMember);
	}
	
	// 회원탈퇴
	public boolean delete(String memid, String pwd) {
		return memberDao.deleteMember(memid, pwd);
	}
	
	// 전체 회원 출력
	public String allMemberPrint() {
		return memberDao.getAllMemberPrint();
	}
}