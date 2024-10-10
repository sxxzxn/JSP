package net.fullstack7.member;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class MemberDAO extends net.fullstack7.common.DBConnPool{
	
	public MemberDAO() {
		super();
	}
	
//	public MemberDAO(String golbalName) {
//		super(golbalName);
//	}
	
//	public MemberDAO(String driver, String url, String id, String pwd) { 
//		super(driver, url, id, pwd);
//	}
	
	/**
	 * @desc 아이디로 회원정보 조회 
	 * 
	 * @param memberId String
	 * @return MemberDTO
	 * 
	 * 
	 * @example getMemberInfo('user1')
	 */
	
	// 아이디로 회원정보 조회
	public MemberDTO getMemberInfo(String memberId) {
		String sql = "SELECT memberId, name, pwd FROM tbl_member WHERE memberId = ?";
		MemberDTO dto = new MemberDTO();
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, memberId);
			
			rs=pstm.executeQuery();
			
			if(rs.next()) {
				dto.setMemberId(memberId);
				dto.setName(rs.getString("name"));
				dto.setPwd(rs.getString("pwd"));
			}
			
		}catch (Exception e) {
			System.out.println("오류확인 : : "+e.getMessage());
		}
		return dto;
	}
	
	//로그인
	public MemberDTO getMemberInfo(String memberId, String pwd) {
		String sql = "SELECT memberId, pwd, name FROM tbl_member WHERE memberId = ? AND pwd = ?";
		MemberDTO dto = new MemberDTO();
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, memberId);
			pstm.setString(2, pwd);
			rs = pstm.executeQuery();
			
			if(rs.next()) {
				dto.setMemberId(memberId);
				dto.setName(rs.getString("name"));
				dto.setPwd(pwd);
			}
//			System.out.println("이름:"+dto.getName());
//			System.out.println("전체정보:"+dto.toString());
//			if(dto != null && dto.getMemberId() != null) {
//				System.out.println("아이디:"+dto.getMemberId());
//				
//			}
			
			
		}catch (Exception e) {
			System.out.println("==================================================");
			System.out.println("회원정보 조회 실패");
			System.out.println(e.getMessage());
			System.out.println("==================================================");
			
		} 
		
		
		return dto;
	}
	
	//전체회원조회
	public List<MemberDTO> getMemberList() {
		String sql = "SELECT memberID, pwd, name FROM tbl_member";
		List<MemberDTO> listDto = new ArrayList<MemberDTO>();
		
		try {
			pstm = con.prepareStatement(sql);
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				
				dto.setMemberId(rs.getString("memberId"));
				dto.setPwd(rs.getString("pwd"));
				dto.setName(rs.getString("name"));
				
				listDto.add(dto);
				
			}
		}catch(Exception e) {
			System.out.println("==================================================");
			System.out.println("전체회원리스트 조회 실패");
			System.out.println(e.getMessage());
			System.out.println("==================================================");
			
		}finally {
			
			close();
		}
		
		return listDto;
	}
	
	// 추후 페이지 
//	public MemberDTO getMemberLis(int pageNo, int pageSize, String searchFiled[], String[] searcgWord, String[] sortField, String[] sortOrder) {
//		return null;
//	}
	
	// 회원가입
	public int setMemberRegist(Map<String, Object> memberRegist) {
		int result = 0;
	    String sql = "insert into tbl_member (memberId, name, pwd) values (?, ?, ?)";

	    try {
	        pstm = con.prepareStatement(sql);
	        
	        pstm.setString(1, (String) memberRegist.get("memberId"));
	        pstm.setString(2, (String) memberRegist.get("name"));
	        pstm.setString(3, (String) memberRegist.get("pwd"));
	        
	        result = pstm.executeUpdate();
	        
	        System.out.println("회원 등록 성공"+ rs);
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	        System.out.println("회원 등록 중 오류 발생: " + e.getMessage());
	    } finally {
	        close(); 
	    }

	    return result;
	}
	
//	// 회원가입
//	public int setMemberRegist(ArrayList<String> memberInfo) {
//	    int result = 0;
//	    String sql = "insert into tbl_member (memberId, name, pwd) values (?, ?, ?)";
//
//	    try {
//	        pstm = con.prepareStatement(sql);
//	        
//	        // ArrayList의 각 요소를 사용
//	        pstm.setString(1, memberInfo.get(0));  // memberId
//	        pstm.setString(2, memberInfo.get(1));  // name
//	        pstm.setString(3, memberInfo.get(2));  // pwd
//	        
//	        result = pstm.executeUpdate();
//	        
//	        System.out.println("회원 등록 성공");
//	        
//	    } catch (Exception e) {
//	        e.printStackTrace();
//	        System.out.println("회원 등록 중 오류 발생: " + e.getMessage());
//	    } finally {
//	        close();
//	    }
//
//	    return result;
//	}
	
	//회원 수정
	public int setMemberModify(Map<String, Object> memberModify) {
		int result = 0;
		String sql = "UPDATE tbl_member SET name = ?, pwd = ? WHERE memberId = ?";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, (String) memberModify.get("name"));
			pstm.setString(2, (String) memberModify.get("pwd"));
			pstm.setString(3, (String) memberModify.get("memberId"));
			result =pstm.executeUpdate();
			
			System.out.println("회원수정성공 : "+ memberModify.get("memberId"));
		}catch(Exception e) {
		        System.out.println("회원 삭제 중 오류 발생: " + e.getMessage());
		}finally {
			close();
		}
		
		return result;
	}
	public int setMemberDelete(String memberId) {
		int result = 0;
		String sql = "DELETE FROM tbl_member where memberId=?";
		
		try {
			pstm=con.prepareStatement(sql);
			pstm.setString(1, memberId);
			result=pstm.executeUpdate();
			
			System.out.println("회원삭제 성공 : " + rs);
			
		}catch(Exception e){
			System.out.println("회원 삭제 중 오류 발생: " + e.getMessage());
		}finally {
			close();
		}
		return result;
	}
	

}
