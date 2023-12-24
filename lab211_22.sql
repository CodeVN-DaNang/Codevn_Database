CREATE DATABASE qlcandidate;

USE qlcandidate;

CREATE TABLE cadidatetype(
    cTypeId int PRIMARY KEY IDENTITY(1,1),
    cTypeName VARCHAR(45)
);

--     //CandidateId, FirstName, LastName, BirthDate, Address, Phone, Email andCandidatetype
CREATE TABLE candidate(
    cId int PRIMARY KEY IDENTITY(1,1),
    cFName VARCHAR(45),
    cLName varchar(45),
    cBirthDate VARCHAR(45),
    cAddress VARCHAR(45),
    cPhone VARCHAR(45),
    cEmail VARCHAR(45),
    cTypeId int,
    CONSTRAINT fk_type_candidate FOREIGN KEY (cTypeId) REFERENCES CandidateType(cTypeId)
);

CREATE TABLE experiencecandidate(
    cId int,
    CONSTRAINT fk_experience FOREIGN KEY (cId) REFERENCES candidate(cId),
    expInYear int,
    proSkill VARCHAR(45)
);

CREATE TABLE interncandidate(
    cId int,
    CONSTRAINT fk_experience FOREIGN KEY (cId) REFERENCES candidate(cId),
    major VARCHAR(45),
    semester VARCHAR(45),
    universityName VARCHAR(45)
);

CREATE TABLE freshercandidate(
    cId int,
    CONSTRAINT fk_experience FOREIGN KEY (cId) REFERENCES candidate(cId),
    graduationdate int,
    graduationrank VARCHAR(45),
    education VARCHAR(45)
);