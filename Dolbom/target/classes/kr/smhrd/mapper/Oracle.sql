drop table member;

drop table com.member;

-- Member 테이블 생성
create table member(
	email varchar(100) not null,
	pw varchar(100) not null,
	tel varchar(100) not null,
	address varchar(100) not null,
	primary key(email)
);

-- test 데이터
insert into member(email, pw, tel, address)
values('admin@smhrd.com', '1234', '010-0000-0000', '서구 금호동');

select * from member;

-- Message 테이블 생성
create table message(
	num int not null auto_increment,
	sendE varchar(100) not null,
	receiveE varchar(100) not null,
	message varchar(2000) not null,
	senddate datetime default now(),
	primary key(num)
);

-- test 데이터
insert into message(sendE, receiveE, message) values('test1', 'test1', 'test1');
insert into message(sendE, receiveE, message) values('test2', 'test2', 'test2');
insert into message(sendE, receiveE, message) values('test3', 'test3', 'test3');

select * from message;

-- board 테이블 생성
create table board(
	idx int not null auto_increment,
	title varchar(100) not null,
	writer varchar(100) not null,
	filename varchar(100) not null,
	content varchar(2000) not null,
	b_date datetime default now(),
	primary key(idx)
);

select * from board;

create table board(
	idx int not null auto_increment primary key,
	title varchar(100) not null,
	writer varchar(100) not null,
	content varchar(1000) not null,
	indate datetime default now()
);

drop table board;

insert into board (title, writer, content)
values ('a','b','c');

select * from board;

insert into board (title, writer, content)
values ('a','b','c');
