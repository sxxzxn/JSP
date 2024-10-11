import java.util.List;

import com.kosa.dao.DeptDao;
import com.kosa.dto.Dept;

/*
MVC 패턴 (너 잘하는 것만 해라)
Model : 데이터 >> dto(vo) , dao(CURD)함수 , service >> java(pojo)
View  : 현재 cmd(console) , WEB(html , jsp  view template)
Controller : 웹을 기준 (jsp , servlet) >> request , response 객체 >> cmd(console)




*/
public class Program {

	public static void main(String[] args) {
		//main 함수 (View) 영역
		
		//DAO객체 요청
		DeptDao dao = new DeptDao(); //6개의 함수
		
		System.out.println("[전체조회]*******");
		List<Dept> deptlist =dao.getDeptAllList();
		//화면구성
		if(deptlist != null) {
			deptPrint(deptlist);
		}
		//조건조회
		System.out.println("[조건조회]*******");
		Dept dept =dao.getDeptListByDeptNo(10);
		if(dept != null) {
			deptPrint(dept);
		}else {
			//.....
		}
		System.out.println("[데이터 삽입]*******");
		Dept insertdept = new Dept();
		insertdept.setDeptno(100);
		insertdept.setDname("IT");
		insertdept.setLoc("SEOUL"); 
		
		int row = dao.insertDept(insertdept);
		if(row > 0) {
			System.out.println("insert rowcount : " + row);
		}
		
		System.out.println("[방금전 insert 데이터 전체조회]*******");
		deptlist =dao.getDeptAllList();
		//화면구성
		if(deptlist != null) {
			deptPrint(deptlist);
		}
		
		System.out.println("[방금전 insert 데이터 수정하기]*******");
		Dept updatedept = new Dept();
		updatedept.setDeptno(100);
		updatedept.setDname("IT_UP");
		updatedept.setLoc("SEOUL_UP");
		
		row = dao.updateDept(updatedept);
		if(row > 0) {
			System.out.println("update rowcount : " + row);
		}
		
		System.out.println("[방금전 update 데이터 전체조회]*******");
		deptlist =dao.getDeptAllList();
		//화면구성
		if(deptlist != null) {
			deptPrint(deptlist);
		}
		
		System.out.println("[방금전 update 데이터 삭제하기]*******");
		row = dao.deleteDept(100);
		if(row > 0) {
			System.out.println("delete rowcount : " + row);
		}
		
		System.out.println("[방금전 delete 데이터 전체조회]*******");
		deptlist =dao.getDeptAllList();
		//화면구성
		if(deptlist != null) {
			deptPrint(deptlist);
		}
	}
	public static void deptPrint(Dept dept) {
		System.out.println(dept.toString());
	}
	public static void deptPrint(List<Dept> list) {
		for(Dept data : list) {
			System.out.println(data.toString()); // for 문 계속 사용x 
		}
	}

}