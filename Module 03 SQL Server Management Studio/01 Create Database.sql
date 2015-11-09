use master

drop database SQLClass
create database SQLClass
on 
( 
	NAME = SQLClass_data,
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SQLClass.mdf',
    SIZE = 10MB,
    MAXSIZE = UNLIMITED,
    FILEGROWTH = 5MB 
)
log on
( 
	NAME = SQLClass_log,
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SQLClass.ldf',
    SIZE = 5MB,
    MAXSIZE = 25MB,
    FILEGROWTH = 10%
)

create database SQLClass
alter database SQLClass 
modify file (
	NAME = SQLClass, 
	SIZE = 10MB,
	MAXSIZE = UNLIMITED, 
	FILEGROWTH = 5MB 
)
alter database SQLClass 
modify file (
	name = SQLClass_log , 
	SIZE = 5MB , 
	MAXSIZE = 25MB, 
	FILEGROWTH = 10%
)
