# Dump-postgres-sql

Alina@DESKTOP-H1IJGDP MINGW64 ~ (master)
$ psql -U postgres
Password for user postgres:
psql (15.1)
Type "help" for help.

postgres=# \l
                                                                List of databases
   Name    |  Owner   | Encoding |          Collate           |           Ctype            | ICU Locale | Locale Provider |   Acces
-----------+----------+----------+----------------------------+----------------------------+------------+-----------------+--------
 postgres  | postgres | UTF8     | English_United States.1252 | English_United States.1252 |            | libc            |
 sampledb  | postgres | UTF8     | English_United States.1252 | English_United States.1252 |            | libc            |
 template0 | postgres | UTF8     | English_United States.1252 | English_United States.1252 |            | libc            | =c/post
           |          |          |                            |                            |            |                 | postgre
 template1 | postgres | UTF8     | English_United States.1252 | English_United States.1252 |            | libc            | =c/post
           |          |          |                            |                            |            |                 | postgre
(4 rows)


postgres=# create database films;
CREATE DATABASE
postgres=# \c films
You are now connected to database "films" as user "postgres".
films=# create table actors (name varchar(80), age int, oscar text, birth date);
CREATE TABLE
films=# \d actors
                      Table "public.actors"
 Column |         Type          | Collation | Nullable | Default
--------+-----------------------+-----------+----------+---------
 name   | character varying(80) |           |          |
 age    | integer               |           |          |
 oscar  | text                  |           |          |
 birth  | date                  |           |          |


films=# create table films (name varchar(80), release date date, IMDb decimal, country varchar(50), budget varchar(50));
ERROR:  syntax error at or near "date"
LINE 1: ...reate table films (name varchar(80), release date date, IMDb...
                                                             ^
films=# create table films (name varchar(80), release_date date, IMDb decimal, country varchar(50), budget varchar(50));
CREATE TABLE
films=# \d films
                         Table "public.films"
    Column    |         Type          | Collation | Nullable | Default
--------------+-----------------------+-----------+----------+---------
 name         | character varying(80) |           |          |
 release_date | date                  |           |          |
 imdb         | numeric               |           |          |
 country      | character varying(50) |           |          |
 budget       | character varying(50) |           |          |


films=# create table directors (name varchar(80), date_of_birth date, date_of_dearth date not null default '-', country varchar(50)
ERROR:  invalid input syntax for type date: "-"
LINE 1: ..._birth date, date_of_dearth date not null default '-', count...
                                                             ^
films=# create table directors (name varchar(80), date_of_birth date, date_of_dearth date not null default '--', country varchar(50
ERROR:  invalid input syntax for type date: "--"
LINE 1: ..._birth date, date_of_dearth date not null default '--', coun...
                                                             ^
films=# create table directors (name varchar(80), date_of_birth date, date_of_dearth date not null default 'still alive', country v
ERROR:  invalid input syntax for type date: "still alive"
LINE 1: ..._birth date, date_of_dearth date not null default 'still ali...
                                                             ^
films=# create table directors (name varchar(80), date_of_birth date, date_of_dearth date not null default 'still alive', country v
ERROR:  invalid input syntax for type date: "still alive"
LINE 1: ..._birth date, date_of_dearth date not null default 'still ali...
                                                             ^
films=# create table directors (name varchar(80), date_of_birth date, date_of_dearth date not null default "still alive", country v
ERROR:  cannot use column reference in DEFAULT expression
LINE 1: ..._birth date, date_of_dearth date not null default "still ali...
                                                             ^
films=# create table directors (name varchar(80), date_of_birth date, date_of_dearth date not null default 'still_alive', country v
ERROR:  invalid input syntax for type date: "still_alive"
LINE 1: ..._birth date, date_of_dearth date not null default 'still_ali...
                                                             ^
films=# create table directors (name varchar(80), date_of_birth date, date_of_dearth date not null default still_alive, country var
ERROR:  cannot use column reference in DEFAULT expression
LINE 1: ..._birth date, date_of_dearth date not null default still_aliv...
                                                             ^
films=# create table directors (name varchar(80), date_of_birth date, date_of_dearth varchar not null default 'still alive', countr
CREATE TABLE
films=# \d directors
                                     Table "public.directors"
     Column     |         Type          | Collation | Nullable |             Default
----------------+-----------------------+-----------+----------+----------------------------------
 name           | character varying(80) |           |          |
 date_of_birth  | date                  |           |          |
 date_of_dearth | character varying     |           | not null | 'still alive'::character varying
 country        | character varying(50) |           |          |


films=# insert into films (name, release_date, imdb, country, budget) values ('Scent of a Woman', 1992-12-23, 8.0, 'USA', 'USD 31 m
-06-06, )
films-# ;
ERROR:  syntax error at or near "2014"
LINE 1: ...3, 8.0, 'USA', 'USD 31 mln'), ('Edge of Tomorrow' 2014-06-06...
                                                             ^
films=# insert into films (name, release_date, imdb, country, budget)
films-#  values ('Scent of a Woman', 1992-12-23, 8.0, 'USA', 'USD 31 mln'), ('Edge of Tomorrow' 2014
films(# );
ERROR:  syntax error at or near "2014"
LINE 2: ...2-12-23, 8.0, 'USA', 'USD 31 mln'), ('Edge of Tomorrow' 2014
                                                                   ^
films=# insert into films (name, release_date, imdb, country, budget)
films-#  values ('Scent of a Woman', 1992-12-23, 8.0, 'USA', 'USD 31 mln'),
films-#  ('Edge of Tomorrow' 2014
films(# );
ERROR:  syntax error at or near "2014"
LINE 3:  ('Edge of Tomorrow' 2014
                             ^
films=# insert into films (name, release_date, imdb, country, budget)
films-#  values ('Scent of a Woman', 1992-12-23, 8.0, 'USA', 'USD 31 mln'),
films-#  ('Edge of Tomorrow', 2014-06-06, 7.9, 'USA', 'USD 178 mln'),
films-# ('The Best Offer', 2013-01-13, 7.8, 'Italy', 'USD 18 mln'),
films-# ('The Holiday', 2006-12-08, 6.9, 'USA and UK', 'USD 85 mln'),
films-# ('The Lord of the Rings', 2001-12-10, 8.8, 'USA and New Zealand', 'USD 281 mln');
ERROR:  column "release_date" is of type date but expression is of type integer
LINE 2:  values ('Scent of a Woman', 1992-12-23, 8.0, 'USA', 'USD 31...
                                     ^
HINT:  You will need to rewrite or cast the expression.
films=# insert into films (name, release_date, imdb, country, budget)
films-#  values ('Scent of a Woman', '1992-12-23', 8.0, 'USA', 'USD 31 mln'),
films-#  ('Edge of Tomorrow', '2014-06-06', 7.9, 'USA', 'USD 178 mln'),
films-# ('The Best Offer', '2013-01-13', 7.8, 'Italy', 'USD 18 mln'),
films-# ('The Holiday', '2006-12-08', 6.9, 'USA and UK', 'USD 85 mln'),
films-# ('The Lord of the Rings', '2001-12-10', 8.8, 'USA and New Zealand', 'USD 281 mln');
INSERT 0 5
films=# select * from films
films-# select * from films
films-# ;
ERROR:  syntax error at or near "select"
LINE 2: select * from films
        ^
films=# select * from films;
         name          | release_date | imdb |       country       |   budget
-----------------------+--------------+------+---------------------+-------------
 Scent of a Woman      | 1992-12-23   |  8.0 | USA                 | USD 31 mln
 Edge of Tomorrow      | 2014-06-06   |  7.9 | USA                 | USD 178 mln
 The Best Offer        | 2013-01-13   |  7.8 | Italy               | USD 18 mln
 The Holiday           | 2006-12-08   |  6.9 | USA and UK          | USD 85 mln
 The Lord of the Rings | 2001-12-10   |  8.8 | USA and New Zealand | USD 281 mln
(5 rows)


films=# \d actors
                      Table "public.actors"
 Column |         Type          | Collation | Nullable | Default
--------+-----------------------+-----------+----------+---------
 name   | character varying(80) |           |          |
 age    | integer               |           |          |
 oscar  | text                  |           |          |
 birth  | date                  |           |          |


films=# insert into actors (name, age, oscar, birth)
films-# values ('Meryl Streep', 73, 'yes', '1949-06-22'),
films-# ('Sandra Bullock', 58, 'yes', '1964-07-26'),
films-# ('Geoffrey Roy Rush', 71, 'yes', '1951-07-06'),
films-# ('Daniel Day-Lewis', 65, 'yes', '1957-04-29'),
films-# ('Gary Oldman', 64, 'yes', '1958-03-21'),
films-# ('Zendaya', 26, 'no', '1996-09-01');
INSERT 0 6
films=# select * from actors;
       name        | age | oscar |   birth
-------------------+-----+-------+------------
 Meryl Streep      |  73 | yes   | 1949-06-22
 Sandra Bullock    |  58 | yes   | 1964-07-26
 Geoffrey Roy Rush |  71 | yes   | 1951-07-06
 Daniel Day-Lewis  |  65 | yes   | 1957-04-29
 Gary Oldman       |  64 | yes   | 1958-03-21
 Zendaya           |  26 | no    | 1996-09-01
(6 rows)


films=# \d directors
                                     Table "public.directors"
     Column     |         Type          | Collation | Nullable |             Default
----------------+-----------------------+-----------+----------+----------------------------------
 name           | character varying(80) |           |          |
 date_of_birth  | date                  |           |          |
 date_of_dearth | character varying     |           | not null | 'still alive'::character varying
 country        | character varying(50) |           |          |


films=# insert into directors (name, date_of_birth, date_of_death, country)
films-# values ('Quentin Tarantino', '1963, 03-27', 'USA');
ERROR:  column "date_of_death" of relation "directors" does not exist
LINE 1: insert into directors (name, date_of_birth, date_of_death, c...
                                                    ^
films=# insert into directors (name, date_of_birth, country)
films-# values ('Quentin Tarantino', '1963, 03-27', 'USA');
INSERT 0 1
films=# select * from directors;
       name        | date_of_birth | date_of_dearth | country
-------------------+---------------+----------------+---------
 Quentin Tarantino | 1963-03-27    | still alive    | USA
(1 row)


films=# insert into directors (name, date_of_birth, date_of_death, country)
films-# values ('Federico Fellini', '1920-01-20', '1993-10-31', 'Italy');
ERROR:  column "date_of_death" of relation "directors" does not exist
LINE 1: insert into directors (name, date_of_birth, date_of_death, c...
                                                    ^
films=# insert into directors (name, date_of_birth, date_of_dearth, country)
films-# values ('Federico Fellini', '1920-01-20', '1993-10-31', 'Italy');
INSERT 0 1
films=# select * from directors;
       name        | date_of_birth | date_of_dearth | country
-------------------+---------------+----------------+---------
 Quentin Tarantino | 1963-03-27    | still alive    | USA
 Federico Fellini  | 1920-01-20    | 1993-10-31     | Italy
(2 rows)


films=# insert into directors (name, date_of_birth, country)
films-# values ('Christopher Nolan', '1970-07-30', 'UK'),
films-# ('Guy Ritchie', '1968-09-10', 'UK'),
films-# ('Steven Spielberg', '1946-12-18', 'USA');
INSERT 0 3
films=# select * from directors;
       name        | date_of_birth | date_of_dearth | country
-------------------+---------------+----------------+---------
 Quentin Tarantino | 1963-03-27    | still alive    | USA
 Federico Fellini  | 1920-01-20    | 1993-10-31     | Italy
 Christopher Nolan | 1970-07-30    | still alive    | UK
 Guy Ritchie       | 1968-09-10    | still alive    | UK
 Steven Spielberg  | 1946-12-18    | still alive    | USA
(5 rows)


films=# alter table directors rename column date_of_dearth to date_of_death;
ALTER TABLE
films=# select * from directors;
       name        | date_of_birth | date_of_death | country
-------------------+---------------+---------------+---------
 Quentin Tarantino | 1963-03-27    | still alive   | USA
 Federico Fellini  | 1920-01-20    | 1993-10-31    | Italy
 Christopher Nolan | 1970-07-30    | still alive   | UK
 Guy Ritchie       | 1968-09-10    | still alive   | UK
 Steven Spielberg  | 1946-12-18    | still alive   | USA
(5 rows)


films=# \q

Alina@DESKTOP-H1IJGDP MINGW64 ~ (master)
$ pg_dump films

Alina@DESKTOP-H1IJGDP MINGW64 ~ (master)
$ cd D:\Postgres SQL\bin
bash: cd: too many arguments

Alina@DESKTOP-H1IJGDP MINGW64 ~ (master)
$ pg_dump -U postgres -d films > C:\Users\Alina\Desktop\Postgres\db_films.sql

Alina@DESKTOP-H1IJGDP MINGW64 ~ (master)
$ pg_dump --host=localhost --username=postgres --dbname=films -f db_films.sql

Alina@DESKTOP-H1IJGDP MINGW64 ~ (master)
$ git init
Reinitialized existing Git repository in C:/Users/Alina/.git/

Alina@DESKTOP-H1IJGDP MINGW64 ~ (master)
$ cd Desktop/

Alina@DESKTOP-H1IJGDP MINGW64 ~/Desktop (master)
$ cd Postgres

Alina@DESKTOP-H1IJGDP MINGW64 ~/Desktop/Postgres (master)
$ git init
Reinitialized existing Git repository in C:/Users/Alina/Desktop/Postgres/.git/

Alina@DESKTOP-H1IJGDP MINGW64 ~/Desktop/Postgres (master)
$ git status
On branch master

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        db_films.sql

nothing added to commit but untracked files present (use "git add" to track)

Alina@DESKTOP-H1IJGDP MINGW64 ~/Desktop/Postgres (master)
$ git add db_films.sql

Alina@DESKTOP-H1IJGDP MINGW64 ~/Desktop/Postgres (master)
$ git commit -m"new file"
[master (root-commit) 255e9ee] new file
 1 file changed, 109 insertions(+)
 create mode 100644 db_films.sql

Alina@DESKTOP-H1IJGDP MINGW64 ~/Desktop/Postgres (master)
$ git remote add origin git@github.com:AlinaLab/Dump-postgres-sql.git

Alina@DESKTOP-H1IJGDP MINGW64 ~/Desktop/Postgres (master)
$ git push -u origin master
Enumerating objects: 3, done.
Counting objects: 100% (3/3), done.
Delta compression using up to 8 threads
Compressing objects: 100% (2/2), done.
Writing objects: 100% (3/3), 1.22 KiB | 626.00 KiB/s, done.
Total 3 (delta 0), reused 0 (delta 0), pack-reused 0
To github.com:AlinaLab/Dump-postgres-sql.git
 * [new branch]      master -> master
branch 'master' set up to track 'origin/master'.

Alina@DESKTOP-H1IJGDP MINGW64 ~/Desktop/Postgres (master)
$
