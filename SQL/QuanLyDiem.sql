create table Student
(
RN varchar(10) primary key not null,
Name nvarchar(25) not null,
Age int,
Gender bit
)
create table Subject_stu
(
sID varchar(10) primary key not null,
sName varchar(10) not null,
)

create table StudentSubject
(
RN varchar(10) not null,
SID varchar(10) not null,
Date varchar (10) not null,
Mark int not null,
CONSTRAINT Mark
CHECK (Mark BETWEEN 1 AND 10),

constraint RN
foreign key (RN)
references Student (RN),

constraint sID
foreign key (SID)
references Subject_stu (sID)
)
drop table StudentSubject

insert into Student(RN,Name,Age) values ('RN001',N'Mỹ Linh',20)
insert into Student(RN,Name,Age) values ('RN002',N'Đàm Vĩnh Hưng',21)
insert into Student(RN,Name,Age) values ('RN003',N'Kim Tử Long',22)
insert into Student(RN,Name,Age) values ('RN004',N'Tài Linh',23)
insert into Student(RN,Name,Age) values ('RN005',N'Mỹ Lệ',21)
insert into Student(RN,Name,Age) values ('RN006',N'Kim Oanh',20)
select * from Student

insert into Subject(sID,sName) values('SUB001','SQL')
insert into Subject(sID,sName) values('SUB002','LGC')
insert into Subject(sID,sName) values('SUB003','HTML')
insert into Subject(sID,sName) values('SUB004','CF')
select * from Subject

insert into StudentSubject(RN,SID,Mark,Date) values('RN005','SUB003',5,'7/28/2005')
insert into StudentSubject(RN,SID,Mark,Date) values('RN002','SUB002',3,'7/29/2005')
insert into StudentSubject(RN,SID,Mark,Date) values('RN003','SUB003',9,'7/31/2005')
insert into StudentSubject(RN,SID,Mark,Date) values('RN004','SUB001',5,'7/30/2005')
insert into StudentSubject(RN,SID,Mark,Date) values('RN005','SUB004',10,'7/19/2005')
insert into StudentSubject(RN,SID,Mark,Date) values('RN006','SUB001',9,'7/25/2005')
/ cau3/

update Student set Gender = 0 where RN ='RN001'
update Student set Gender = 0 where RN ='RN004'
update Student set Gender = 0 where RN ='RN005'
update Student set Gender = 1 where RN ='RN003'

/cau 4/

insert into Subject(sID,sName) values ('SUB005','Core java')
insert into Subject(sID,sName) values ('SUB006','VB.Net')

select * from Subject

/cau5/
select *
from Subject
where not exists
(
select *
from StudentSubject
where StudentSubject.SID = Subject.SID
)

select SID,sName
from Subject
where SID not in (select SID from StudentSubject)

/cau6/

select su.sID,su.sName,Max(stsu.Mark) as 'Mark Max'
from Subject su
inner join StudentSubject stsu on su.SID = stsu.SID
group by su.sID,su.sName

/cau 7/

select *
from Subject su
where su.SID in (
select stsu.SID
from StudentSubject stsu
Group by stsu.SID
having COUNT(stsu.SID) > =2
)

/cau 8/
/RN,sID,Name, Age, Gender, sName, Mark, Date case when gender='Male' then 1 end/

create view StudentInfo
as
select stsu.RN,su.sID,stu.Name,stu.Age,
(case when stu.Gender =0 then 'Male'
when stu.Gender =1 then 'Female'
when stu.Gender = null then 'Unknow '
end) as 'Gender',
su.sName,stsu.Mark,stsu.Date
from StudentSubject stsu
inner join Student stu on stsu.RN = stu.RN
inner join Subject su on stsu.SID = su.SID

select* from StudentInfo

/cau9/

/khong biet/
CREATE UNIQUE INDEX index_student
ON StudentInfo (RN, sID);

/trigeer/
create trigger casDel
on Student
after delete
as
begin

alter table StudentSubject drop constraint RN;
delete StudentSubject where RN = (select RN from inserted);
delete Student where RN = (select RN from inserted);
alter table StudentSubject add constraint RN foreign key (RN) references Student(RN);

end

drop trigger casDel

delete Student where RN = 'RN007'


/cau 12/

create PROC cau12(@name nvarchar(250),@mark int)
as
begin

if @name=N'*'
begin
delete from StudentSubject;
delete from Student;
end
else
begin
declare @total int ;
declare @id varchar(25);
set @id= (select RN from Student where Name = @name);
set @total= (select Count(*) from Student a inner join StudentSubject b on a.RN = b.RN where a.Name like N''+@name+'' and mark >=@mark);
if @total = 0
begin
delete from StudentSubject where RN=@id;
delete from Student where RN=@id;
end
else
begin
print N'Không làm gì';
end
end

end

exec cau12 'dat',4
select * from StudentSubject
drop proc cau12
/cau 13/


select Name,SUBSTRING(StudentInfo.Name,1,Len(StudentInfo.Name) -Charindex(' ',Reverse(StudentInfo.Name))) as 'tên đệm' from StudentInfo






/cau 16/
select Student.Name
from StudentSubject
inner join Student on StudentSubject.RN = Student.RN
where StudentSubject.Mark > 5
group by Student.Name
having avg(CAST(StudentSubject.Mark as float)) >=8

/cau 17/

select Student.Name
from StudentSubject
inner join Student on StudentSubject.RN = Student.RN
where (
select stsu.Mark
from StudentSubject stsu
where stsu.Mark between 3 and 5
Group by stsu.Mark
having COUNT(stsu.Mark) = 1
) != null
group by Student.Name
having avg(CAST(StudentSubject.Mark as float)) >=6.5


select Name,avg(Mark) as 'dien'
from Student
join StudentSubject on Student.RN = StudentSubject.RN
where Mark >=3 and
(
select count(Mark) from StudentSubject where Mark >= 3 and Mark <5
) = 1
group by Student.RN,Name
having avg(Mark) >=6.5 and min(Mark) >=5

/cau 14/

create table Top3
(
Rank_ int not null,
RN varchar(10) not null,
Name nvarchar(25) not null,
Mark int,
sName varchar(25),
Date_ varchar(20),
constraint RN_
foreign key (RN)
references Student (RN),
)
drop table Top3

insert into Top3(Rank_,RN,Name,Mark,sName,Date_) values (1,'RN005',N'Mỹ Lệ',10,'CF','7/2/2020')
insert into Top3(Rank_,RN,Name,Mark,sName,Date_) values (2,'RN003',N'Kim Tử Long',10,'HTML','7/2/2020')
insert into Top3(Rank_,RN,Name,Mark,sName,Date_) values (3,'RN006',N'Kim Oanh',10,'SQL','7/2/2020')

select * from Top3


/ cau 15/

create trigger tgTop3
on StudentSubject
after insert
as
begin

Declare @Rank int;
Declare @RN varchar(25);
Declare @Name nvarchar(25);
Declare @Mark int;
Declare @Mark_top1 int;
set @Mark_top1 = select Max(Mark) from StudentSubject ;
select @Mark = stsuList.Mark from inserted stsuList;

if(@Mark > @Mark_top1)
begin
RAISERROR (N'lỗi',16,1)
end
else
begin
update Top3 set Rank_ = 1 ;
end
/*
select @RN = stsuList.RN from inserted stsuList;
select @Name = Student.Name from inserted inner join Student on inserted.RN = Student.RN;
insert into Top3(RN,Name,Mark) values (@RN,@Name,@Mark)
*/
end