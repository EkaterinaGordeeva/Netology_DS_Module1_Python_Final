CREATE TABLE Trips (
  id_trip INT not NULL,
  name varchar,
  organizator varchar,
  group_count int,
  primary key (id_trip)
);
CREATE TABLE City (
  id_city INT not NULL,
  city_name varchar,
  id_country int,
  country_name varchar,
  primary key (id_city)
);
CREATE TABLE Hotel (
  hotel_id INT not NULL,
  name varchar,
  price_per_person int,
  primary key (hotel_id)
);
CREATE TABLE Transport (
  transport_id INT not NULL,
  name varchar,
  primary key (transport_id)
);

CREATE TABLE Location (
  id_location INT not NULL,
  id_trip int not NULL,
  city_staying int,
  hotel_id int,
  days_count int,
  primary key (id_location),
  foreign key (id_trip) references Trips (id_trip),
  foreign key (city_staying) references City (id_city),
  foreign key (hotel_id) references Hotel (hotel_id)
);


CREATE TABLE Transfer (
  id_transfer INT not NULL,
  id_trip int not NULL,
  city_from int,
  city_to int,
  datetime_start timestamp,
  datetime_end timestamp,
  transport_id int,
  comment varchar,
  primary key (id_transfer),
  foreign key (id_trip) references Trips (id_trip),
  foreign key (city_from) references City (id_city),
  foreign key (city_to) references City (id_city),
  foreign key (transport_id) references Transport (transport_id)
);

INSERT INTO Trips VALUES
(100,'����� ��� �� ��������','���',10),
(101,'����������� � �����','����',2),
(102,'�������� �����','�����������',7),
(103,'��������� � �����','����',2),
(104,'�������� ������','���',24),
(105,'���������� � ������','����',2),
(106,'����������� �� ����� ������','���',20),
(107,'������ ���������� �� �������','�����������',6),
(108,'��������� ������� �� �����','���',13);

INSERT INTO City VALUES
(600,'����������� ����',700,'������'),
(601,'�����',701,'������'),
(602,'�����',702,'�������'),
(603,'�������',702,'�������'),
(604,'���������',702,'�������'),
(605,'���-�����',702,'�������'),
(606,'���������',703,'�������'),
(607,'���',701,'������'),
(608,'������',701,'������'),
(609,'����',701,'������'),
(610,'�������',701,'������'),
(611,'����������',704,'�����'),
(612,'���������',705,'��������'),
(614,'�����������',700,'������'),
(615,'��������',707,'�������'),
(616,'����',702,'�������'),
(617,'�����',702,'�������'),
(618,'��������',703,'�������'),
(619,'�� ������',703,'�������'),
(620,'�����',703,'�������'),
(621,'������',700,'������'),
(622,'��������',708,'�������'),
(623,'���������',709,'��������'),
(624,'�������',710,'������'),
(625,'���������',711,'���������');

INSERT INTO Hotel VALUES
(500,'����� 1',1000),
(501,'����� 2',1001),
(502,'����� 3',1002),
(503,'����� 4',1003),
(504,'����� 5',1004),
(505,'����� 6',1005),
(506,'����� 7',1006),
(507,'����� 8',1007),
(508,'����� 9',1008),
(509,'����� 10',1009),
(510,'����� 11',1010),
(511,'����� 12',1011),
(512,'����� 13',1012),
(513,'����� 14',1013),
(514,'����� 15',1014),
(515,'����',0),
(516,'������',0),
(517,'� ������',0);

INSERT INTO Transport VALUES
(400,'�������'),
(401,'����'),
(402,'����������'),
(403,'������� (������������)'),
(404,'������� (��������)'),
(405,'�����'),
(406,'�� ����� �����'),
(407,'���������'),
(408,'������'),
(409,'��������');


INSERT INTO Location VALUES
(2000,100,600,500,5),
(2001,101,601,501,4),
(2002,102,602,502,1),
(2003,102,603,503,1),
(2004,102,604,504,1),
(2005,102,605,505,1),
(2006,102,606,505,1),
(2007,103,606,506,4),
(2008,104,607,515,2),
(2009,104,608,515,1),
(2010,104,609,515,1),
(2011,104,610,515,1),
(2012,104,607,507,3),
(2013,105,611,508,3),
(2014,106,612,509,1),
(2015,106,614,510,1),
(2016,107,615,511,1),
(2017,107,616,512,1),
(2018,107,617,513,1),
(2029,108,618,515,2),
(2020,108,619,515,2),
(2021,108,620,515,2),
(2022,108,618,514,1);

INSERT INTO Transfer VALUES
(301,100,621,600,'2017-12-29 18:00:00','2017-12-29 22:00:00',400,'��� ���������'),
(302,100,600,621,'2018-01-05 18:00:00','2018-01-05 22:00:00',400,'��� ���������'),
(303,101,621,601,'2018-03-05 08:00:00','2018-03-05 12:30:00',400,'��� ���������'),
(304,101,601,621,'2018-03-09 16:00:00','2018-03-09 20:20:00',400,'��� ���������'),
(305,102,621,602,'2018-04-05 08:00:00','2018-04-05 12:00:00',400,'��� ���������'),
(306,102,602,603,'2018-04-06 20:00:00','2018-04-06 23:00:00',402,'������'),
(307,102,603,604,'2018-04-08 10:00:00','2018-04-08 13:30:00',402,'������'),
(308,102,604,605,'2018-04-09 18:00:00','2018-04-09 21:00:00',402,'������'),
(309,102,605,606,'2018-04-09 23:00:00','2018-04-10 02:00:00',402,'������'),
(310,102,606,621,'2018-04-11 18:00:00','2018-04-11 22:00:00',400,'��� ���������'),
(311,103,621,623,'2018-05-07 23:00:00','2018-05-08 03:00:00',400,'���������'),
(312,103,623,606,'2018-05-08 07:00:00','2018-05-08 09:00:00',400,''), 
(313,103,606,622,'2018-05-12 15:00:00','2018-05-12 18:00:00',400,'���������'),
(314,103,622,621,'2018-05-12 20:00:00','2018-05-12 22:00:00',400,''),	 
(315,104,621,607,'2018-06-01 14:00:00','2018-06-01 18:00:00',400,''),	 
(316,104,607,608,'2018-06-02 06:00:00','2018-06-02 18:00:00',401,''),	 
(317,104,608,609,'2018-06-03 07:00:00','2018-06-03 15:00:00',401,''),	 
(318,104,609,610,'2018-06-05 16:00:00','2018-06-05 20:00:00',401,''),	 
(319,104,610,607,'2018-06-06 08:00:00','2018-06-06 16:00:00',401,''),	 
(320,104,607,621,'2018-06-09 18:00:00','2018-06-09 22:00:00',400,'��� ���������'),
(321,105,621,611,'2018-07-27 09:00:00','2018-07-27 12:00:00',400,'��� ���������'),
(322,105,611,621,'2018-07-29 23:30:00','2018-07-30 05:00:00',400,'��� ���������'),
(323,106,621,612,'2018-08-31 18:00:00','2018-09-01 22:00:00',400,''),	 
(324,106,612,624,'2018-09-02 08:00:00','2018-09-05 16:00:00',401,''),	 
(325,106,624,614,'2018-09-05 17:00:00','2018-09-05 20:00:00',404,''),	 
(326,106,614,621,'2018-09-06 15:00:00','2018-09-06 18:00:00',400,'��� ���������'),
(327,107,621,615,'2018-12-08 10:00:00','2018-12-08 14:00:00',400,'��� ���������'),
(328,107,615,616,'2018-12-09 11:00:00','2018-12-09 19:00:00',402,'������'),
(329,107,616,617,'2018-12-10 10:00:00','2018-12-10 15:00:00',402,'������'),
(330,107,617,606,'2018-12-10 18:00:00','2018-12-11 20:00:00',403,''), 
(331,107,606,621,'2018-12-11 18:00:00','2018-12-11 23:00:00',400,'��� ���������'),
(332,108,621,625,'2018-12-28 20:30:00','2018-12-28 23:30:00',400,'���������'),
(333,108,625,618,'2018-12-29 03:00:00','2018-12-29 07:00:00',400,''),	 
(334,108,618,619,'2018-12-30 08:00:00','2018-12-30 18:00:00',401,''),	 
(335,108,619,620,'2018-12-31 10:00:00','2018-12-31 14:00:00',401,''),	 
(336,108,620,618,'2019-01-02 14:00:00','2019-01-02 18:00:00',401,''),	 
(337,108,618,621,'2019-01-06 15:00:00','2019-01-06 19:30:00',400,'��� ���������');