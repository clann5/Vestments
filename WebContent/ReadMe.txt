본 포트폴리오를 통해 보여주고자 하는 것
	- jsp 웹 페이지 개발
	- MVC2 구조
	- MyBatis 를 통한 DB호출
	- 데이터의 흐름에 대한 인지
		beforeView -> Controller -> Command(Model) -> DAO(SqlSessionFactory) --(DTO를 통한)
		-> Mapper -> DAO -> Command -> Controller -> AfterView
	- 형상관리도구를 통한 코드 안정성 관리
	- 팀원이 생긴다면 협업할 수 있는 코드스타일(들여쓰기, 주석 등)
	- 삭제한 게시글 보관
	
구현 예정
	- MyPage(MemberView) & 정보 변경(MemberUpdate)
	- captcha 호출
	- fileupload & download