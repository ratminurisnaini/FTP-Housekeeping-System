USE myDatabase

CREATE TABLE [dbo].[konfig_ftp] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [day_reference] int  NULL,
  [week_reference] int  NULL,
  [month_reference] int  NULL,
  [date_format] varchar(10) NULL,
  [flag_aktif] int  NULL,
  [flag_ftp] varchar(10) NULL,
  [nama_file] varchar(200) NULL,
  [extension] varchar(200) NULL,
  [Protocol] varchar(20) NULL,
  [IP_Address] varchar(25) NULL,
  [Server_Port] varchar(10) NULL,
  [Username] varchar(200) NULL,
  [Password] varchar(200) NULL,
  [Remote_directory] varchar(100) NULL,
  [Wildcard] varchar(100) NULL
)