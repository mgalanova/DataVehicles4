use master
GO
IF EXISTS (SELECT NULL FROM sys.databases WHERE name = 'abiz_admin')
DROP DATABASE abiz_admin
GO
CREATE DATABASE abiz_admin
ON 
( NAME = abiz_admin_dat,
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL11.DEV\MSSQL\DATA\abiz_admin.mdf',
    SIZE = 10MB,
    FILEGROWTH = 1MB )
LOG ON
( NAME = Sales_log,
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL11.DEV\MSSQL\DATA\abiz_adminlog.ldf',
    SIZE = 5MB,
    FILEGROWTH = 1MB ) ;
GO
USE abiz_admin
GO

IF EXISTS (SELECT NULL FROM sys.tables WHERE name = 'cache')
DROP TABLE dbo.cache

CREATE TABLE dbo.cache (
  id varchar(128) NOT NULL,
  expire int NULL,
  value BINARY,
  PRIMARY KEY (id)
)
-- --------------------------------------------------------

--
-- Структура таблицы database_type
--
--
IF EXISTS (SELECT NULL FROM sys.tables WHERE name = 'database_type')
DROP TABLE dbo.database_type

CREATE TABLE dbo.database_type (
  id int IDENTITY(1,1) NOT NULL,
  name varchar(100) NOT NULL,
  PRIMARY KEY (id),  
)

-- --------------------------------------------------------

--
-- Структура таблицы data_bases
--
IF EXISTS (SELECT NULL FROM sys.tables WHERE name = 'data_bases')
DROP TABLE dbo.data_bases

CREATE TABLE dbo.data_bases (
  id int IDENTITY(1,1) NOT NULL ,
  name varchar(100) NULL,
  caption varchar(45) NOT NULL,
  database_type_id int NOT NULL CONSTRAINT fk_data_bases_database_type1 REFERENCES dbo.database_type(id)
  PRIMARY KEY (id)  
)


-- --------------------------------------------------------

--
-- Структура таблицы restrict
--
IF EXISTS (SELECT NULL FROM sys.tables WHERE name = 'restrict')
DROP TABLE dbo.[restrict]

CREATE TABLE dbo.[restrict] (
  id int IDENTITY(1,1) NOT NULL,
  field_name varchar(50) NOT NULL,
  client_caption varchar(50) NOT NULL,
  child_id int NOT NULL DEFAULT -1, -- Depends on another field (id in the same table). Example: Model depends on Brand.',
  PRIMARY KEY (id)  
)

-- --------------------------------------------------------

--
-- Структура таблицы user
--
IF EXISTS (SELECT NULL FROM sys.tables WHERE name = 'user')
DROP TABLE dbo.[user]

CREATE TABLE dbo.[user] (
  id int IDENTITY(1,1) NOT NULL,
  [login] varchar(100) NOT NULL CONSTRAINT un_login UNIQUE,
  pwd_hash varchar(32) NOT NULL, --32 bytes for md5 hash sum
  name varchar(100) NOT NULL, --Any user describe name
  reg_date date NOT NULL,
  rights int NOT NULL DEFAULT 0, --Administrator user
  max_install int NOT NULL,
  cur_install int NOT NULL DEFAULT 0,
  lang varchar(16) NOT NULL DEFAULT 'en_us',
  PRIMARY KEY (id)  
)

-- --------------------------------------------------------

--
-- Структура таблицы individual_info
--
IF EXISTS (SELECT NULL FROM sys.tables WHERE name = 'individual_info')
DROP TABLE dbo.individual_info

CREATE TABLE dbo.individual_info (
  value varchar(1000) NOT NULL,
  user_id int NOT NULL CONSTRAINT fk_individual_info_user1 FOREIGN KEY REFERENCES dbo.[user] (id)
)

-- --------------------------------------------------------

--
-- Структура таблицы user_has_data_bases
--
IF EXISTS (SELECT NULL FROM sys.tables WHERE name = 'user_has_data_bases')
DROP TABLE dbo.[user_has_data_bases]

CREATE TABLE dbo.user_has_data_bases (
  user_id int NOT NULL CONSTRAINT fk_user_has_data_bases_user1 FOREIGN KEY REFERENCES dbo.[user] (id),
  data_bases_id int NOT NULL CONSTRAINT fk_user_has_data_bases_data_bases1 FOREIGN KEY REFERENCES dbo.data_bases(id),
  PRIMARY KEY (user_id, data_bases_id),  
);

-- --------------------------------------------------------

--
-- Структура таблицы user_has_restrict
--

IF EXISTS (SELECT NULL FROM sys.tables WHERE name = 'user_has_restrict')
DROP TABLE dbo.user_has_restrict

CREATE TABLE dbo.user_has_restrict (
  id int IDENTITY(1,1) NOT NULL,
  user_id int NOT NULL CONSTRAINT fk_user_has_restrict_user1 FOREIGN KEY REFERENCES dbo.[user] (id),
  restrict_id int NOT NULL CONSTRAINT fk_user_has_restrict_restrict1 FOREIGN KEY REFERENCES dbo.[restrict] (id) ,
  value int NOT NULL, --Value of restrict
  data_bases_id int NOT NULL CONSTRAINT fk_user_has_restrict_data_bases1 FOREIGN KEY REFERENCES dbo.data_bases(id),
  lft int NOT NULL,
  rgt int NOT NULL,
  PRIMARY KEY (user_id,restrict_id),  
)

-- --------------------------------------------------------

--
-- Структура таблицы user_has_restrict_fields
--
IF EXISTS (SELECT NULL FROM sys.tables WHERE name = 'user_has_restrict_fields')
DROP TABLE dbo.user_has_restrict_fields

CREATE TABLE dbo.user_has_restrict_fields (
  id int IDENTITY(1,1) NOT NULL,
  user_id int NOT NULL CONSTRAINT fk_user_has_restrict_fields_user1 FOREIGN KEY REFERENCES dbo.[user] (id),
  restrict_id int NOT NULL CONSTRAINT fk_user_has_restrict_fields_restrict1 FOREIGN KEY REFERENCES dbo.[restrict] (id),
  data_bases_id int NOT NULL CONSTRAINT fk_user_has_restrict_fields_data_bases1 FOREIGN KEY REFERENCES dbo.data_bases(id),
  PRIMARY KEY (id,user_id,restrict_id,data_bases_id)  
) 

-- --------------------------------------------------------

--
-- Структура таблицы user_pivot
--
IF EXISTS (SELECT NULL FROM sys.tables WHERE name = 'user_pivot')
DROP TABLE dbo.user_pivot

CREATE TABLE dbo.user_pivot (
  pivot_id int IDENTITY(1,1) NOT NULL,
  user_id int NOT NULL CONSTRAINT fk_user_pivot_user FOREIGN KEY REFERENCES dbo.[user] (id),
  pivot_name varchar(255) NOT NULL,
  tabDatabaseId int NOT NULL,
  tabFieldsArrHeader varchar(2048) NOT NULL,
  tabFieldsArrLeft varchar(2048) NOT NULL,
  tabCritActive varchar(2048) NOT NULL,
  tabFieldsFilterArr varchar(2048) NOT NULL,
  tabFieldsSortArr varchar(2048) NOT NULL,
  PRIMARY KEY (pivot_id)  
)