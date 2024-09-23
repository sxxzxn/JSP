package dao;

public class StudentDAO {
	
	StudentDAO(){}
	// 프로퍼티는 프라이빗을 권장한다
	// -> 다른곳에서 바로 호출하지 못하도록
	private String no;
	private String name;
	private int age;
	private String dept;
	private int grade;
	
	// 서블릿에서 호출해야하니까 public
	// 서블릿 : 클라이언트의 요청을 처리하고 그 결과 를 반환하는 기술
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	
	

}
