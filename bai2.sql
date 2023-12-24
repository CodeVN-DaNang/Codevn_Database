create database bai2;

use bai2;

create table document(
	id int primary key auto_increment,
    code varchar(45) unique,
    -- Tên nhà xuất bản, số bản phát hành.
    publisher varchar(45),
    numPublish int
);

create table book(
	document_id int,
    constraint fk_book foreign key (document_id) references document(id),
    -- tên tác giả, số trang.
    author varchar(45),
    pages int
);

create table magazines(
	document_id int,
    constraint fk_magazines foreign key (document_id) references document(id),
    -- Số phát hành, tháng phát hành.
    issueNum int,
    issueDate date
);

create table papers(
	document_id int,
    constraint fk_papers foreign key (document_id) references document(id),
    -- Ngày phát hành.
    issueDate date
);

-- them moi sach
insert into document(code, publisher, numPublish) values ("S-11", "Kenh14", 12);
insert into book(document_id, author, pages) values (1, "Yen", 100);

insert into document(code, publisher, numPublish) values ("S-12", "Kenh14", 12);
insert into book(document_id, author, pages) values (3, "Do", 100);

SET SQL_SAFE_UPDATES = 0;
delete from book where book.author like "Do";

select * from document join book where document.id = book.document_id and author like "Do";