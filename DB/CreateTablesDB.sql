
create table Clients
(
    clientId varchar(20) primary key not null,
    clientsName varchar(100) not null,
    clientsLastName varchar(100) null,
    age int not null,
    gender varchar(20) null,
    weight float  null,
    height float null,
    bloodPressureSist int not null,
    bloodPressureDiast int not null,
    cholesterol float null,
    smoker bit default null,
    drinking int null,
    disability bit default null,
    previousPathology bit default null,
    postalCode int not null,
    constraint clientId
        unique (clientId)
);
create index IdXClientId
    on Clients (clientId);

create index IdXNameLastName
    on Clients (clientsName, clientsLastName);


create table Transports
(
    transportId int auto_increment primary key,
    transportName varchar(20)

);

create table Coordinates
(
    coordinatesId int auto_increment primary key,
    clientsId varchar(20) not null,
    transportId int not null,
    latitude float not null,
    longitude float not null,
    createDate datetime not null,
        foreign key (clientsId) references Clients (clientId),
        foreign key (transportId) references Transports (transportId)
);
create index IdXClientId
    on Coordinates (clientsId);

create index IDXCITILatLongCD
    on Coordinates (clientsId, transportId,latitude,longitude,createDate);

create table KmxDay
(
    kmXDayId int auto_increment primary key,
    clientsId varchar(20) not null,
    km float null,
    kmBike float null,
    score float not null,
    createDate timestamp default CURRENT_TIMESTAMP not null,
        foreign key (clientsId) references Clients (clientId)
);

INSERT INTO zurich.Transports (transportName) VALUES ('bike');
INSERT INTO zurich.Transports (transportName) VALUES ('train');
INSERT INTO zurich.Transports (transportName) VALUES ('car');
INSERT INTO zurich.Transports (transportName) VALUES ('walking');

-- Procedure

DELIMITER //

CREATE PROCEDURE InsertUpdateKM (id varchar(20), kmw FLOAT, kmbikec float, date datetime)
  BEGIN
    IF (select count(*) from KmxDay where clientsId=id and createDate = date_format(date, "%Y-%m-%d"))>0 THEN UPDATE zurich.KmxDay SET km = km+kmw, kmBike = kmBike+kmbikec WHERE clientsId= id and createDate = date_format(date, "%Y-%m-%d");
    ELSE
    INSERT INTO zurich.KmxDay (clientsId, km, kmBike, score, createDate) VALUES (id, 0, 0, 0, date_format(date, "%Y-%m-%d"));
    END IF;
  END //

DELIMITER ;