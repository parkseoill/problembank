# problembank
요구사항 : bank라는 DB에 랜덤하게 문제 데이터를 넣어주고  로그인을 사용자 마다 다른 문제 10개가 나와 채점 해주고 점수 조회가 가능.
관리자는 admin이라는 페이지를 통해 데이터를 excell 형식과 같이 자유롭게  추가 및 삭제가 가능하다

TRUNCATE result;
select * from bank;
CREATE table result(
	name varchar(32),
	no int,
	score int
);
ALTER TABLE result MODIFY bankno varchar(32);
select * from result;
UPDATE bank SET id = id-1 WHERE id > 8;


ALTER TABLE bank AUTO_INCREMENT=1;
