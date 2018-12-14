

CREATE TABLE Types(
	Type Char(20) Primary Key,
	Fee smallint NULL);

CREATE TABLE Member(
	MemberID smallint Primary Key,
	LastName Char(20),
	FirstName Char(20),
	MemberType Char(20),
	Phone Char(20),
	Handicap smallint,
	JoinDate date,
	Coach smallint,
	Team Char(20),
	Gender Char(1),
  Foreign Key (MemberType) References Types (Type)
);

CREATE TABLE Tournament(
	TourID smallint Primary Key,
	TourName Char(20) NULL,
	TourType Char(20) NULL);

CREATE TABLE Entry(
	MemberID smallint ,
	TourID smallint ,
	Year smallint,
CONSTRAINT entry_pk Primary Key (MemberID, TourID, Year),
Foreign Key (MemberID) References Member (MemberID),
Foreign Key (TourID) References Tournament(TourID));

CREATE TABLE Team(
	TeamName Char(20) Primary Key,
	PracticeNight Char(20),
	Manager smallint,
    Foreign Key (Manager) References Member(MemberID));


Alter TABLE Member
ADD CONSTRAINT FK_Coach FOREIGN KEY (Coach) References Member(MemberID);

Alter TABLE Member
ADD CONSTRAINT FK_Team FOREIGN KEY (Team) References Team(TeamName);
