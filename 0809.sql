-- ���̺� ���⼭ ���� ����
create table tbl_board (
    math number(10) -- ����Ŭ�� int �ƴϰ� number
);
commit;
create table tb_a(
    math varchar2(200)
);

select * from  tbl_board;
drop table tbl_board;
create table tbl_board (
    bno number(10) primary key not null,
    title varchar2(100) not null,
    content varchar2(500) not null,
    writer varchar2(100) not null,
    regDate Date,
    updateDate Date
);
create sequence seq_board; -- �ڵ� ������(auto_increment)
insert into tbl_board values(seq_board.nextval, 'a', 'b', 'c', sysdate, sysdate);
select * from tbl_board ORDER by bno asc;
commit;

select * from tbl_board order by bno desc;
select seq_board.nextval from dual;





select  /* index_desc(tbl_board pk_board) */
    rownum rn, bno, content
from tbl_board where rownum <= 10;

select bno, content from
    (select  /*+ index_desc(tbl_board pk_board) */
    rownum rn, bno, content
    from tbl_board where rownum <= 30) where rn>10; -- 1 �������� 10�� (amount)
select rownum from tbl_board; -- 2 ������
-- amount, pageNum
