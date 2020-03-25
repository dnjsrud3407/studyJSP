package bean;
//자바빈 / MemberDTO
//기억공간을 정의함
// -> 사용(데이터를 할당)하기 위해서는 new 키워드 사용해서 객체 생성해야함.
public class MemberBean {
	//멤버변수_다른 클래스에서 변경하지 못하도록 private로 만!
	private String name;
	
	//메서드()
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}	
}
