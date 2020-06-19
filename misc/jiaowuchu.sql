SHOW CHARACTER SET;

-- 建库

CREATE DATABASE JiaoWu
CHARACTER SET 'utf8'
COLLATE 'utf8_general_ci';

USE JiaoWu;

-- 建表

-- 学生表
CREATE TABLE `Student`(
    `s_id` VARCHAR(20),
    `s_name` VARCHAR(20) NOT NULL DEFAULT '',
    `s_birth` VARCHAR(20) NOT NULL DEFAULT '',
    `s_sex` VARCHAR(10) NOT NULL DEFAULT '',
    PRIMARY KEY(`s_id`)
);

-- 课程表
CREATE TABLE `Course`(
    `c_id`  VARCHAR(20),
    `c_name` VARCHAR(20) NOT NULL DEFAULT '',
    `t_id` VARCHAR(20) NOT NULL,
    PRIMARY KEY(`c_id`)
);
-- 教师表
CREATE TABLE `Teacher`(
    `t_id` VARCHAR(20),
    `t_name` VARCHAR(20) NOT NULL DEFAULT '',
    PRIMARY KEY(`t_id`)
);
-- 成绩表
CREATE TABLE `Score`(
    `s_id` VARCHAR(20),
    `c_id`  VARCHAR(20),
    `s_score` INT(3),
    PRIMARY KEY(`s_id`,`c_id`)
);
-- 插入学生表测试数据
insert into Student values('01' , '赵雷' , '1990-01-01' , '男');
insert into Student values('02' , '钱电' , '1990-12-21' , '男');
insert into Student values('03' , '孙风' , '1990-05-20' , '男');
insert into Student values('04' , '李云' , '1990-08-06' , '男');
insert into Student values('05' , '周梅' , '1991-12-01' , '女');
insert into Student values('06' , '吴兰' , '1992-03-01' , '女');
insert into Student values('07' , '郑竹' , '1989-07-01' , '女');
insert into Student values('08' , '王菊' , '1990-01-20' , '女');

-- 课程表测试数据
insert into Course values('01' , '语文' , '02');
insert into Course values('02' , '数学' , '01');
insert into Course values('03' , '英语' , '03');
 
-- 教师表测试数据
insert into Teacher values('01' , '张三');
insert into Teacher values('02' , '李四');
insert into Teacher values('03' , '王五');
 
-- 成绩表测试数据
insert into Score values('01' , '01' , 80);
insert into Score values('01' , '02' , 90);
insert into Score values('01' , '03' , 99);
insert into Score values('02' , '01' , 70);
insert into Score values('02' , '02' , 60);
insert into Score values('02' , '03' , 80);
insert into Score values('03' , '01' , 80);
insert into Score values('03' , '02' , 80);
insert into Score values('03' , '03' , 80);
insert into Score values('04' , '01' , 50);
insert into Score values('04' , '02' , 30);
insert into Score values('04' , '03' , 20);
insert into Score values('05' , '01' , 76);
insert into Score values('05' , '02' , 87);
insert into Score values('06' , '01' , 31);
insert into Score values('06' , '03' , 34);
insert into Score values('07' , '02' , 89);
insert into Score values('07' , '03' , 98);

SELECT * FROM Student;
SELECT * FROM Teacher;
SELECT * FROM Course;
SELECT * FROM Score;

create view student as select * from Student;
create view teacher as select * from Teacher;
create view course as select * from Course;
create view score as select * from Score;

-- 1、查询"01"课程比"02"课程成绩高的学生的信息及课程分数  

select a.*, b.s_score as 01_score, c.s_score as 02_score
from Student a 
	join Score b on a.s_id=b.s_id and b.c_id ='01'
	left join Score c on a.s_id=c.s_id and c.c_id='02'
where b.s_score > c.s_score or c.s_score is null;

/*
select a.*, b.s_score as 01_score, c.s_score as 02_score from 
    Student a 
    join Score b on a.s_id=b.s_id and b.c_id='01'
    left join Score c on a.s_id=c.s_id and c.c_id='02' or c.c_id = NULL where b.s_score>c.s_score；
*/ 

-- 2、查询"01"课程比"02"课程成绩低的学生的信息及课程分数

select a.*, b.s_score as 01_score, c.s_score as 02_score
from Student a 
	left join Score b on a.s_id=b.s_id and b.c_id ='01'
	join Score c on a.s_id=c.s_id and c.c_id='02'
where b.s_score < c.s_score or b.s_score is null;

/* 
select a.* ,b.s_score as 01_score,c.s_score as 02_score from 
    student a left join score b on a.s_id=b.s_id and b.c_id='01' or b.c_id=NULL 
     join score c on a.s_id=c.s_id and c.c_id='02' where b.s_score<c.s_score
*/ 
 
-- 3、查询平均成绩大于等于60分的同学的学生编号和学生姓名和平均成绩

select a.s_id, a.s_name, round(avg(b.s_score), 2) as avg_score
from Student a
	join Score b on a.s_id = b.s_id
    group by b.s_id
	having avg_score>=60;

/*
select b.s_id,b.s_name,ROUND(AVG(a.s_score),2) as avg_score from 
    student b 
    join score a on b.s_id = a.s_id
    GROUP BY b.s_id,b.s_name HAVING ROUND(AVG(a.s_score),2)>=60;
*/ 
 
-- 4、查询平均成绩小于60分的同学的学生编号和学生姓名和平均成绩
        -- (包括有成绩的和无成绩的)

select a.s_id, a.s_name, round(avg(b.s_score), 2) as avg_score
from Student a
	left join Score b on a.s_id = b.s_id
    group by b.s_id
	having avg_score<60
union
select a.s_id, a.s_name, NULL as avg_score
from Student a
	where a.s_id not in (
				select distinct s_id from Score);
                
/* 
select b.s_id,b.s_name,ROUND(AVG(a.s_score),2) as avg_score from 
    student b 
    left join score a on b.s_id = a.s_id
    GROUP BY b.s_id,b.s_name HAVING ROUND(AVG(a.s_score),2)<60
    union
select a.s_id,a.s_name,0 as avg_score from 
    student a 
    where a.s_id not in (
                select distinct s_id from score);
*/ 
 
-- 5、查询所有同学的学生编号、学生姓名、选课总数、所有课程的总成绩

select a.s_id, a.s_name, count(b.c_id) as c_cnt, sum(b.s_score) as sc_sum
from Student a
	left join Score b on a.s_id=b.s_id
group by a.s_id;

/*
select a.s_id,a.s_name,count(b.c_id) as sum_course,sum(b.s_score) as sum_score from 
    student a 
    left join score b on a.s_id=b.s_id
    GROUP BY a.s_id,a.s_name;
*/ 
 
-- 6、查询"李"姓老师的数量 
select count(t_id)
from Teacher
where t_name like '李%';

/*
select count(t_id) from teacher where t_name like '李%';
*/
 
-- 7、查询学过"张三"老师授课的同学的信息 

select a.* 
from Student a join Score b 
	on b.s_id=a.s_id and b.c_id in (
		select c.c_id 
		from Course c join Teacher t 
			on t.t_id=c.t_id and t.t_name='张三'
    );

# this is slower
select a.* 
from Student a join Score b 
	on b.s_id=a.s_id and b.c_id in (
		select c.c_id 
		from Course c
        where c.t_id=(select t_id from Teacher 
						where t_name='张三')
    ); 
    
# easier to read
select s.* from student s, score sc, course c, teacher t
where s.s_id = sc.s_id
	and c.c_id = sc.c_id
    and c.t_id = t.t_id
    and t.t_name = '张三';
    
/*
select a.* from 
    student a 
    join score b on a.s_id=b.s_id where b.c_id in(
        select c_id from course where t_id =(
            select t_id from teacher where t_name = '张三'));
*/
 
-- 8、查询没学过"张三"老师授课的同学的信息 

select r.*
from Student a 
	join Score b   on a.s_id=b.s_id
	join Course c  on b.c_id=c.c_id
    join Teacher t on c.t_id=t.t_id and t.t_name='张三'
    right join Student r on a.s_id=r.s_id
    where a.s_id is null;

/*
select * from 
    student c 
    where c.s_id not in(
        select a.s_id from student a join score b on a.s_id=b.s_id where b.c_id in(
            select c_id from course where t_id =(
                select t_id from teacher where t_name = '张三')));
*/

-- 9、查询学过编号为"01"并且也学过编号为"02"的课程的同学的信息
select a.*
from student a
	join score s on a.s_id=s.s_id
		and s.c_id in ('01', '02')
	group by a.s_id
    having count(*)=2;
    
select a.*
from student a
	join score s on a.s_id=s.s_id and s.c_id='01'
    join score ss on a.s_id=ss.s_id and ss.c_id='02';

# the best, from the website
select a.* from student a,score b,score c 
    where a.s_id = b.s_id 
		and a.s_id = c.s_id 
        and b.c_id='01' 
        and c.c_id='02';
 
-- 10、查询学过编号为"01"但是没有学过编号为"02"的课程的同学的信息

# this should be faster
select l.* from
	(select a.* from student a join score s using(s_id) where c_id='01') l
	left join 
	(select a.* from student a join score s using(s_id) where c_id='02') r
	using(s_id) where r.s_id is null;

select a.* from 
    student a 
    where a.s_id in (select s_id from score where c_id='01' ) and a.s_id not in(select s_id from score where c_id='02');

-- 11、查询没有学全所有课程的同学的信息

select s.*
	from student s
    left join score sc using(s_id) 
    group by s_id
    having count(s_id)<(select count(distinct c_id) from course);

/* # this is wrong
select s.* from 
    student s where s.s_id in(
        select s_id from score where s_id not in(
            select a.s_id from score a 
                join score b on a.s_id = b.s_id and b.c_id='02'
                join score c on a.s_id = c.s_id and c.c_id='03'
            where a.c_id='01'));
*/

-- 12、查询至少有一门课与学号为"01"的同学所学相同的同学的信息 

select * from student
where s_id in (
	select s_id from score 
		where c_id in (
			select c_id from score where s_id='01')
	);
 
-- 13、查询和"01"号的同学学习的课程完全相同的其他同学的信息 

with cte as (
	select s_id, group_concat(c_id) as courses from score
    group by s_id )
select a.* 
from student a 
	join cte using(s_id)
    join (select courses from cte where s_id='01') r
    using(courses)
	where s_id<>'01';

/* but this is wrong
select a.* from student a where a.s_id in(
    select distinct s_id from score 
    where s_id!='01' and c_id in (
		select c_id from score where s_id='01') # s_id can select more courses than 01
		group by s_id 
		having count(1)= (select count(1) from score where s_id='01')
	);
 */
 
-- 14、查询没学过"张三"老师讲授的任一门课程的学生姓名 

select s.s_name from student s
where s.s_id not in (
	select sc.s_id from score sc, course c, teacher t
    where sc.c_id = c.c_id
		and c.t_id = t.t_id
        and t.t_name = "张三"
);

select s.s_name from student s
where s.s_id not in (
	select sc.s_id from score sc 
		join course c using(c_id)
		join teacher t using (t_id)
	where t.t_name = "张三"
);
        
select s_name from student where s_id not in (
    select s_id from score where c_id = 
                (select c_id from course where t_id =(
                    select t_id from teacher where t_name = '张三')) 
                group by s_id);

 
-- 15、查询两门及其以上不及格课程的同学的学号，姓名及其平均成绩 

select s_id, s_name, round(avg(s_score),2) as avg_score 
from student join score using(s_id)
where s_score<60
group by s_id
having count(*)>1;

/*
select a.s_id,a.s_name,ROUND(AVG(b.s_score)) from 
    student a 
    left join score b on a.s_id = b.s_id
    where a.s_id in(
            select s_id from score where s_score<60 GROUP BY  s_id having count(1)>=2)
    GROUP BY a.s_id,a.s_name;
*/
 
-- 16、检索"01"课程分数小于60，按分数降序排列的学生信息

select s.*, s_score
from student s join score using(s_id)
where c_id='01' and s_score<60
order by s_score desc;

/*
select a.*,b.c_id,b.s_score from 
    student a,score b 
    where a.s_id = b.s_id and b.c_id='01' and b.s_score<60 ORDER BY b.s_score DESC;
*/
 
-- 17、按平均成绩从高到低显示所有学生的所有课程的成绩以及平均成绩

select 
	s.s_id, c.c_name, sc.s_score, 
	avg(sc.s_score) over (partition by sc.s_id) avg_sc  # cannot use round
from student s 
	join score sc using(s_id)
    join course c using(c_id)
order by avg_sc desc;

select 
	s.s_id, c.c_name, sc.s_score, 
    round(r.avg_sc,2) as avg_sc 
from student s
	join score sc using(s_id)
    join course c using(c_id)
	left join (
		select s_id, avg(s_score) as avg_sc from score 
		group by s_id) r using(s_id)
	order by r.avg_sc desc;

/*
select a.s_id,(select s_score from score where s_id=a.s_id and c_id='01') as 语文,
                (select s_score from score where s_id=a.s_id and c_id='02') as 数学,
                (select s_score from score where s_id=a.s_id and c_id='03') as 英语,
            round(avg(s_score),2) as 平均分 from score a  GROUP BY a.s_id ORDER BY 平均分 DESC;
*/
 
-- 18.查询各科成绩最高分、最低分和平均分：以如下形式显示：课程ID，课程name，最高分，最低分，平均分，及格率，中等率，优良率，优秀率
-- 及格为>=60，中等为：70-80，优良为：80-90，优秀为：>=90

select 
	c.c_id 课程ID,
    c.c_name 课程name, 
    max(s_score) 最高分,
    min(s_score) 最低分,
    round(avg(s_score),2) 平均分,
    round(100*(sum(case when s_score>=60 then 1 else 0 end))/count(*),2) as 及格率,
    round(100*(sum(case when s_score between 70 and 80 then 1 else 0 end))/count(*),2) as 中等率,
    round(100*(sum(case when s_score between 80 and 90 then 1 else 0 end))/count(*),2) as 优良率,
    round(100*(sum(case when s_score>=90 then 1 else 0 end))/count(*),2) as 优秀率
    from course c left join score sc using(c_id) 
    group by c_id;

-- 19、按各科成绩进行排序，并显示排名(实现不完全)

select c_id, s_id, s_score,
	rank() over(partition by c_id order by s_score desc) rank_nb 
from score;

-- no rank() for mysql<8.0, using self-join
select a.c_id, a.s_id, a.s_score, count(b.s_score)+1 as rank_nb
from score as a 
	left join score as b 
	on a.c_id = b.c_id and a.s_score<b.s_score 
group by a.c_id, a.s_id 
order by a.c_id, rank_nb;

-- 20、查询学生的总成绩并进行排名

select s_id, total,
	dense_rank() over(order by total desc) as rank_nb
from (select s_id, sum(s_score) as total
		from score
        group by s_id) q;

# This is wrong, and it is similar to row_number() instead of dense_rank()
select s_id, total, @k:=@k+1 as rank_nb 
from
(select s_id, sum(s_score) as total from score
	group by s_id
	order by total desc) l,
(select @k:=0) r;

select 
	s_id,
    @i:=@i+1 as i, # row_number()
    @k:=(case when @dum=sum_score then @k else @i end) as rank_nb,
    @dum:=sum_score as sum_sc
from ( 
		select s_id, SUM(s_score) as sum_score 
		from score GROUP BY s_id ORDER BY sum_score DESC
        ) l,
    (
		select @k:=0, @i:=0, @dum:=0
        ) r
;
    
-- 21、查询不同老师所教不同课程平均分从高到低显示

select 	t_id, t_name, c_id, 
		round(avg(s_score), 2) avg_sc
from teacher
	join course using(t_id)
    join score using(c_id)
group by t_id, c_id
order by avg_sc desc;
 
 /*
    select a.t_id,c.t_name,a.c_id,ROUND(avg(s_score),2) as avg_score 
    from course a
        left join score b on a.c_id=b.c_id 
        left join teacher c on a.t_id=c.t_id
        GROUP BY a.c_id,a.t_id,c.t_name ORDER BY avg_score DESC;
*/
        
-- 22、查询所有课程的成绩第2名到第3名的学生信息及该课程成绩

# use dense_rank or row_number
with cte as 
(select c_id, s_id, s_score,
		dense_rank() over(partition by c_id order by s_score desc) as rank_nb
from score)
select c_id, s_id, s_score, rank_nb, s_name, s_birth, s_sex
from student s right join cte using(s_id)
where rank_nb between 2 and 3
order by c_id
;

# below is the same as row_number 
select d.*,c.排名,c.s_score,c.c_id 
from (	select a.s_id,a.s_score,a.c_id,@i:=@i+1 as 排名 
		from score a,(select @i:=0)s where a.c_id='01'
        order by a.s_score desc
		) c
		left join student d on c.s_id=d.s_id
where 排名 BETWEEN 2 AND 3
UNION
select d.*,c.排名,c.s_score,c.c_id 
from (	select a.s_id,a.s_score,a.c_id,@j:=@j+1 as 排名 
		from score a,(select @j:=0)s where a.c_id='02'
        order by a.s_score desc
		) c
		left join student d on c.s_id=d.s_id
where 排名 BETWEEN 2 AND 3
UNION
select d.*,c.排名,c.s_score,c.c_id
	from (	select a.s_id,a.s_score,a.c_id,@k:=@k+1 as 排名 
			from score a,(select @k:=0)s where a.c_id='03'
            order by a.s_score desc
            ) c
		left join student d on c.s_id=d.s_id
where 排名 BETWEEN 2 AND 3;
 
 
-- 23、统计各科成绩各分数段人数：课程编号,课程名称,[100-85],[85-70],[70-60],[0-60]及所占百分比

select c.c_name, c.c_id, 
		sum(case when s_score>85 then 1 else 0 end) as '[100-85)',
        round(100*sum(case when s_score>85 then 1 else 0 end)/count(sc.c_id), 0) as percent,
        sum(case when s_score>70 and s_score <=85 then 1 else 0 end) as '[85-70)',
        round(100*sum(case when s_score>70 and s_score <=85 then 1 else 0 end)/count(sc.c_id), 0) as percent,
        sum(case when s_score>60 and s_score <=70 then 1 else 0 end) as '[70-60)',
        round(100*sum(case when s_score>60 and s_score <=70 then 1 else 0 end)/count(sc.c_id), 0) as percent,
		sum(case when s_score<=60  then 1 else 0 end) as '[60-0]',
        round(100*sum(case when s_score<=60  then 1 else 0 end)/count(sc.c_id), 0) as percent
from score sc
	left join course c using(c_id)
group by sc.c_id;

drop procedure get_group;
delimiter $$
create procedure get_group(
	in s_score int,
    out sc_grp varchar(7)
)
begin
	case 
		when s_score>=85 then 
			set sc_grp = '[100-85)';
        when s_score>=70 and s_score <85 then 
			set sc_grp = '[85-70)';
        when s_score>=60 and s_score <70 then 
			set sc_grp = '[70-60)';
        else 
			set sc_grp = '[60-0]';
	end case;
end $$
delimiter ;

call get_group(80, @sc_grp);
select @sc_grp;

drop function get_grp;
delimiter $$
create function get_grp(
	s_score int
)
returns varchar(7)
deterministic
begin
	declare sc_grp varchar(7);
    
    if s_score>85 then 
		set sc_grp = '[100-85)';
	elseif s_score>70 then 
		set sc_grp = '[85-70)';
	elseif s_score>60 then 
		set sc_grp = '[70-60)';
	else 
		set sc_grp = '[60-0]';
	end if;

    return (sc_grp);
end $$
delimiter ;

# still need case for pivot table
with 
cte_grp as (
	select *, get_grp(s_score) as sc_grp 
	from score
)
select c_id, c_name, s_id, s_score, sc_grp 
from course
	join cte_grp using(c_id)
;  
                
-- 24、查询学生平均成绩及其名次 

select s_id, avg_sc '平均分',
	rank() over(order by avg_sc desc) as '保留空缺排名',
    dense_rank() over(order by avg_sc desc) as '排名'
from (
	select s_id, avg(s_score) avg_sc
    from score
    group by s_id
) r;

select a.s_id,
	@i:=@i+1 as '排名',
    @k:=(case when @avg_score=a.avg_s then @k else @i end) as '保留空缺排名',
	@avg_score:=avg_s as '平均分'
from 
	(select s_id,ROUND(AVG(s_score),2) as avg_s 
		from score GROUP BY s_id) a,
	(select @avg_score:=0, @i:=0, @k:=0) b;

-- 25、查询各科成绩前三名的记录

select * from score l
where (
	select count(*) from score as r
	where l.c_id = r.c_id and l.s_score<r.s_score 
	) < 3
order by c_id asc, s_score desc;

select a.*
from score a 
	left join score b on a.c_id = b.c_id and a.s_score<b.s_score
	group by a.s_id,a.c_id # ,a.s_score
    having count(b.s_id)<3
order by a.c_id,a.s_score desc;
 
-- 26、查询每门课程被选修的学生数 
 
 select c_id, count(*) as s_nb
 from score
 group by c_id;
  
-- 27、查询出只有两门课程的全部学生的学号和姓名

select s.s_id, s.s_name
from student s 
	join score using(s_id)
    group by s_id
    having count(c_id)=2;
 
 /*
        select s_id,s_name from student where s_id in(
                select s_id from score GROUP BY s_id HAVING COUNT(c_id)=2);
 */
 
-- 28、查询男生、女生人数 

select s_sex, count(*) from student group by s_sex;

#        select s_sex,COUNT(s_sex) as 人数  from student GROUP BY s_sex;
 
-- 29、查询名字中含有"风"字的学生信息
 
 select * from student
 where s_name like '%风%';
 
 #       select * from student where s_name like '%风%';
 
-- 30、查询同名同性学生名单，并统计同名人数 
  
 insert into Student values('09' , '孙风' , '1992-05-20' , '女');
 insert into Student values('10' , '孙风' , '1992-09-20' , '男');
  
select a.s_name,a.s_sex ,count(*) 
from student a 
	join student b 
	on a.s_id !=b.s_id and a.s_name = b.s_name and a.s_sex = b.s_sex
group by a.s_name,a.s_sex;

-- 31、查询1990年出生的学生名单
 
select s_id, s_name from student
where s_birth like '1990%';
 
select s_id, s_name from student
where year(s_birth)=1990; 
  
-- 32、查询每门课程的平均成绩，结果按平均成绩降序排列，平均成绩相同时，按课程编号升序排列 

select c_id, round(avg(s_score), 2) as avg_sc
from score
group by c_id
order by avg_sc desc, c_id; 
 
-- 33、查询平均成绩大于等于85的所有学生的学号、姓名和平均成绩 
 
select s_id, s_name, round(avg_score, 2) as avg_score
from student
	right join (
		select s_id, avg(s_score) as avg_score
        from score
        group by s_id
        having avg_score>=85) sc 
	using(s_id);
    
select s_id, s_name, round(avg(s_score), 2) as avg_score
from score left join student using(s_id)
	group by s_id
    having avg_score>=85;
 
-- 34、查询课程名称为"数学"，且分数低于60的学生姓名和分数 

select s_name, s_score
from course
	left join score using(c_id) 
	left join student using(s_id)
where s_score<60 and c_name='数学';

select s_name, s_score
from course
	join score on course.c_id=score.c_id and c_name='数学'
	join student on score.s_id=student.s_id and s_score<60;
 
select a.s_name,b.s_score 
from score b LEFT JOIN student a 
	on a.s_id=b.s_id 
    where b.c_id=(select c_id from course where c_name ='数学') 
		and b.s_score<60;
 
-- 35、查询所有学生的课程及分数情况； 

select a.s_id,a.s_name,
	SUM(case c.c_name when '语文' then b.s_score else 0 end) as '语文',
	SUM(case c.c_name when '数学' then b.s_score else 0 end) as '数学',
	SUM(case c.c_name when '英语' then b.s_score else 0 end) as '英语',
	SUM(b.s_score) as  '总分'
from student a 
	left join score b using(s_id) 
	left join course c using(c_id) 
	GROUP BY a.s_id,a.s_name;
 
 
 select a.s_id,a.s_name,
	sum(if(c.c_name='语文', b.s_score, 0)) as '语文',
	sum(if(c.c_name='数学', b.s_score, 0)) as '数学',
	sum(if(c.c_name='英语', b.s_score, 0)) as '英语',
	sum(b.s_score) as  '总分'
from student a 
	left join score b using(s_id) 
	left join course c using(c_id) 
	GROUP BY a.s_id,a.s_name;
 
select 
	group_concat(
		concat(
			' sum(if(c.c_name= ''',
				t.c_name,
			''', b.s_score, 0)) as ''',
            t.c_name, ''''
        )
    ) into @pivot
from (
	select distinct c_name from course
) t;

select @pivot;

set @pivot=concat(
	'select a.s_id, a.s_name,',
	 @pivot, ', sum(b.s_score) as ''总分'' ', 
    'from student a left join score b using(s_id) left join course c using(c_id) group by a.s_id,a.s_name');
    
prepare statement from @pivot;
execute statement;
deallocate prepare statement;

 -- 36、查询任何一门课程成绩在70分以上的姓名、课程名称和分数； 
 
select s_name, c_name, s_score
from score join course using(c_id)
		join student using (s_id)
where s_score>=70;
 
-- 37、查询不及格的课程

select s_id, c_id, c_name, s_score
from score join course using(c_id)
	join student using(s_id)
    where s_score<60;
 
-- 38、查询课程编号为02且课程成绩在80分以上的学生的学号和姓名； 

select s_id, s_name
from student join score using(s_id)
where c_id='02' and s_score>80;
 
-- 39、求每门课程的学生人数

select c_id, count(*) as count from score group by c_id; 
 
-- 40、查询选修"张三"老师所授课程的学生中，成绩最高的学生信息及其成绩
select s.*, s_score, c_id, c_name  
from course join teacher using(t_id)
	join score using(c_id)
    join student s using(s_id)
where t_name="张三"
#having max(s_score);
order by s_score desc
limit 1;

UPDATE score SET s_score=90
where s_id = "07"
and c_id ="02";

select s.*, s_score, c_id, c_name  
from course join teacher using(t_id)
	join score using(c_id)
    join student s using(s_id)
where t_name="张三"
	and s_score= (
    select max(s_score) 
    from course join teacher using(t_id)
	join score using(c_id)
    join student s using(s_id)
	where t_name="张三"
);

-- 41、查询不同课程成绩相同的学生的学生编号、课程编号、学生成绩 

select a.c_id, a.s_id, a.s_score
from score a join score b
	on a.s_id = b.s_id
    and a.c_id < b.c_id
    and a.s_score = b.s_score;
#group by a.c_id, a.s_id;

select distinct b.s_id,b.c_id,b.s_score 
from score a, score b 
where a.s_id=b.s_id and a.c_id != b.c_id and a.s_score = b.s_score;

-- 42、查询每门功成绩最好的前两名 

select a.s_id, a.c_id, a.s_score
from score a left join score b
	on a.c_id=b.c_id
    and a.s_score<b.s_score
group by a.c_id, a.s_id 
having count(b.s_id)<2
order by a.c_id; 

select a.s_id, a.c_id, a.s_score 
from score a
where (select count(1) from score b where b.c_id=a.c_id and b.s_score>=a.s_score)<=2 
order by a.c_id;

-- 43、统计每门课程的学生选修人数（超过5人的课程才统计）。要求输出课程号和选修人数，查询结果按人数降序排列，若人数相同，按课程号升序排列  
select c_id, count(s_score) nb_s
from score
group by c_id
having nb_s>5
order by nb_s, c_id;

-- 44、检索至少选修两门课程的学生学号 

select s_id, count(*) as nb_c
from score
group by s_id
having nb_c>1;

-- 45、查询选修了全部课程的学生信息

select s.*
from score join student s using(s_id)
group by s_id
having count(*) = (select count(*) from course);

-- 46、查询各学生的年龄
    -- 按照出生日期来算，当前月日 < 出生年月的月日则，年龄减一

select s_id, s_name, s_birth, 
	timestampdiff(year, s_birth, curdate()) as age
from student;
  
-- 47、查询本周过生日的学生
select * from student
where week(s_birth)=week(now());
 
-- 48、查询下周过生日的学生
select * from student
where week(s_birth)=week(now())+1;
 
-- 49、查询本月过生日的学生
select * from student
where month(s_birth)=month(now());
 
-- 50、查询下月过生日的学生
select * from student
where month(s_birth)=month(now())+2;