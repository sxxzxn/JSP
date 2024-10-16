package net.fullstack7.member;

import net.fullstack7.common.DBConnPool;
import net.fullstack7.utils.CommonDateUtil;

public class MemberDAO extends DBConnPool {
	
	private CommonDateUtil dateUtil;

	public MemberDAO() {
		super();
		dateUtil = new CommonDateUtil();

	}
	
	// 로그인
	//1. 메서드 작성
	public MemberDTO login(MemberDTO dto) {
	    // 2. SQL 작성
	    String sql = "SELECT memberId, pwd, name FROM tbl_member WHERE memberId = ? AND pwd = ?";

	    try {
	        // 3. Connection 객체 준비 및 PreparedStatement 생성
	        pstm = con.prepareStatement(sql);

	        // 4. PreparedStatement에 매개변수 설정
	        pstm.setString(1, dto.getMemberId());
	        pstm.setString(2, dto.getPwd());

	        // 5. 쿼리 실행 및 ResultSet에 결과 담기
	        rs = pstm.executeQuery();

	        // 6. 결과 확인 및 DTO에 값 설정
	        if (rs.next()) {
	            dto.setMemberId(rs.getString("memberId"));
	            dto.setPwd(rs.getString("pwd")); 
	            dto.setName(rs.getString("name"));
	        } else {
	            System.out.println("로그인 실패 DAO");
	            dto = null;
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	        e.getMessage();
	    }
	    // 7. DTO( 메서드 매개변수 ) 반환
	    return dto;
	}
	
	
//  로그인 추후 수정하기
//	public MemberDTO getMemberInfo(String user_id, String pwd) {
//		MemberDTO dto = new MemberDTO();
//		String sql = "SELECT memberId, name, pwd, regDate FROM tbl_member WHERE memberId = ?";
//
//		// 아이디/비밀번호 체크 플래그
//		boolean check_id_flag = false;
//		boolean check_pwd_flag = false;
//		
//		
//		try {
//			pstm = con.prepareStatement(sql);
//			pstm.setString(1, user_id);
//			rs = pstm.executeQuery();
//			if ( rs.next() ) {
//				check_id_flag = true;
//				
//				if ( pwd.equals(rs.getString("pwd")) ) {
//					check_pwd_flag = true;
//				}
//
//				if ( check_id_flag && check_pwd_flag ) {
//					dto.setMemberId(user_id);
//					dto.setPwd(pwd);
//					dto.setName(rs.getString("name"));
//					dto.setRegDate(dateUtil.toLocalDateTime(rs.getTimestamp("regDate")));
//				} else {
//					dto = null;
//				}
//			}
//		} catch(Exception e) {
//			
//		}
//		return null;
//	}
	
//	// 개인 회원정보 수정
//	public int memberModify(MemberDTO dto) {
//		//1. sql 작성( int 니까 결과 받을 변수하나 초기화하기)
//		//2. con객체 준비 및 prest 생성
//		//3. sql속 매개 변수 설정
//		//4. 쿼리 실행 및 row에 값 담기
//		//5. row 실행 확인
//		//6. row 값 반환
//
//		int row = 0;
//		String sql = "UPDATE SET tbl_member pwd = ? addr1 = ? addr2 = ? birthday = ?  where memberId =? ";
//		
//		try {
//			pstm = con.prepareStatement(sql);
//				pstm.setString(1, dto.getPwd());
//		        pstm.setString(2, dto.getAddr1());
//		        pstm.setString(3, dto.getAddr2());
//		        pstm.setString(4, dto.getBirthday()); 
//		        pstm.setString(5, dto.getMemberId());
//			row = pstm.executeUpdate();
//			if(row>0) {
//				System.out.println("회원정보 수정");
//			}else {
//				System.out.println("회원정보 수정 실패");
//			}
//			
//		}catch(Exception e) {
//			e.printStackTrace();
//			System.out.println(e.getMessage()+"회원수정 실패");
//		}
//
//		return row;
//	}
//
//
//	// 관리자 -> 전체회원목록
//	public List<MemberDTO> memberInfo(int limit, int offset) {
//		List<MemberDTO> memList = new ArrayList<MemberDTO>();
//		String sql = "SELECT memberId, name, jumin, addr1, addr2, birthday, jobCode, mileage, regDate, role FROM tbl_member ORDER BY regDate desc LIMIT ? OFFSET ?";
//		  try {
//		        
//		        // PreparedStatement 준비
//		        pstm = con.prepareStatement(sql);
//		        pstm.setInt(1, limit);  
//		        pstm.setInt(2, offset); 
//		        
//		        // SQL 실행 및 결과 처리
//		        rs = pstm.executeQuery();
//		        while (rs.next()) {
//		            MemberDTO member = new MemberDTO();
//		            member.setMemberId(rs.getString("memberId"));
//		            member.setName(rs.getString("name"));
//		            member.setJumin(rs.getString("jumin"));
//		            member.setAddr1(rs.getString("addr1"));
//		            member.setAddr2(rs.getString("addr2"));
//		            member.setBirthday(rs.getString("birthday"));
//		            member.setJobCode(rs.getString("jobCode"));
//		            member.setMileage(rs.getInt("mileage"));
//		            member.setRegDate(rs.getTimestamp("regDate").toLocalDateTime());
//		            
//		            memList.add(member);
//		        }
//		    } catch (Exception e) {
//		        e.printStackTrace();
//		    } 
//		    return memList;
//		}
//	
//	// 전체회원수 확인
//		public int getMemberCnt(String searchKeyword) {
////			System.out.println("getTotalPageCnt()시작");
//			int total = 0;
//			String sql="";
//
//	        if ( searchKeyword != null && !searchKeyword.isEmpty()) {
//	            sql = "SELECT COUNT(memberId) FROM tbl_member WHERE memberId LIKE ?";
//	        } else {
//	            sql = "SELECT COUNT(memberId) FROM tbl_member";
//	        }
//			try {
//				pstm = con.prepareStatement(sql);
//				if (searchKeyword != null && !searchKeyword.isEmpty()) {
//	                pstm.setString(1, "%" + searchKeyword + "%");
//	            }
//	            rs = pstm.executeQuery();
//	            if (rs.next()) {
//	            	total = rs.getInt(1);
//	            	System.out.println("전체회원수"+total);
//
//				}
//			}catch(Exception e) {
//				e.printStackTrace();
//				System.out.println("getMemberCnt 오류 : " + e.getMessage());
//			}
//			return total;
//		}
//	
//	// 관리자 회원탈퇴 , 일반회원 탈퇴
//	public int memberDeleteList(int[] idxArray) {
//		 String sql = "DELETE FROM tbl_member WHERE idx = ?";
//		    int row = 0; // 삭제된 총 행 수
//
//		    try {
//		        pstm = con.prepareStatement(sql);
//
//		        for (int idx : idxArray) {
//		            pstm.setInt(1, idx);
//		            row += pstm.executeUpdate(); // 각 삭제된 행 수를 누적
//		        }
//		        
//		        if (row > 0) {
//		            System.out.println(row + "명 회원탈퇴 성공");
//		        }
//		    } catch (Exception e) {
//		        System.out.println("회원 삭제 실패");
//		        e.printStackTrace();
//		        System.out.println("memberDeleteList 메서드 에러메시지 확인: " + e.getMessage());
//		    }
//		    return row; 
//		}
	}
	
	
	
	


