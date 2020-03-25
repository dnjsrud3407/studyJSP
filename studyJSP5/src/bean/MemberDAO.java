package bean;
//DB작업 하는 파일
public class MemberDAO {
	//insertMember - 회원가입하는 함수
	public void insertMember(MemberBean mb) {
		System.out.println("전달 받은 주소 : " + mb);
		System.out.println("전달 받은 값 : " + mb.getName());
	}

}
