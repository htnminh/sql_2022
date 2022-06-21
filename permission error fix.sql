/*
TITLE: Microsoft SQL Server Management Studio
------------------------------

Create failed for Database 'hrdb'.  (Microsoft.SqlServer.Smo)

For help, click: https://go.microsoft.com/fwlink?ProdName=Microsoft+SQL+Server&ProdVer=16.100.47021.0&EvtSrc=Microsoft.SqlServer.Management.Smo.ExceptionTemplates.FailedOperationExceptionText&EvtID=Create+Database&LinkId=20476

------------------------------
ADDITIONAL INFORMATION:

An exception occurred while executing a Transact-SQL statement or batch. (Microsoft.SqlServer.ConnectionInfo)

------------------------------

CREATE DATABASE permission denied in database 'master'. (Microsoft SQL Server, Error: 262)

For help, click: https://docs.microsoft.com/sql/relational-databases/errors-events/mssqlserver-262-database-engine-error

------------------------------
BUTTONS:

OK
------------------------------

*/
ALTER SERVER ROLE  [dbcreator]  ADD MEMBER [nhatm];
GO