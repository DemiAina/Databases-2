set search_path = "Sample"; -- search path -> forign user
-- gettings all the information
-- look for implications 
-- give you what to look at
select * from recommends;
select * from module 
full join recommends using(mod_Code)
full join authors using (isbn)
full join Author using (author_id)

-- Question 1
select title from book 
where isbn not in (
    select isbn from recommends
);


-- other method 
select title from book left join using (ISBN) where mod_code is null;


select title from book b where not exists 
 (
    select * from recommends r where r,isbn = b,isbn
);


-- Questions 2
-- look at tables and the ones you need
select title from book where isbn in
select isbn from recommends group by isbn
having count(*) > 1;

-- Question 3
select title from book a where not exists (
    select * from module b where not exsits (
        select * from recommends x
        where a.isbn = x.isbn  and b.mod_code = x.mod_code))

-- other method
-- Question 4
select author_name from author join authors using (author_id) join book using (isbn)
where isbn in
select isbn from recommends group by isbn
having count(*) > 1;

-- Question 5
select mod_name from book join recommends using (isbn)
join module using (mod_code)
where title = 'sql cookbook'; -- wrong


select mod_name from book join recommends using (isbn)
join module using (mod_code)
where title = 'SQL Cookbook'; -- wrong
except
select mod_name from book join recommends using (isbn)
join module using (mod_code)
where title != 'SQL Cookbook'; -- wrong

set search_path = "sutdnet user name"
create view as 
select mode_name, title
from "sample".book join "sample".recommends using (isbn)
join "Sameple".module using (mod_code);
-- show modules that recommend 'Data science' or 'Real world sql' but not both
select mod_name from smapletitle where title = 'Data science';
select mod_nmae from sampletitle where title = 'Real World SQL'


select mod_name from smapletitle where title = 'Data science';
union
select mod_nmae from sampletitle where title = 'Real World SQL'
expect
(select mod_name from sampletitle where title = 'Data sceicne'
    intersect 
    select mod_name from sampletitle where title = 'Real World SQL')
select * from sampletitle;

-- Question 7

select mod_code, count(*) from recommends group by (mod_code) order by (count(*))

select mod_name from module join recommends using (mod_code) group by (mod_name) having count(*) =
select max(newfeild) from(
select  count(*) newfeild  from recommends group by (mod_code)  as newquery)

-- Another method 

select mod_name, rank() over (parition by mod_code order by count(*))
from module join recommends using (mod_code) group by mod_name;

-- Question 8 
select title, yearofpublication, author_name, rank() over (parition by author_id order by yearofpublication)
from book join aithors using (iBsn)
join author using (author_id)


