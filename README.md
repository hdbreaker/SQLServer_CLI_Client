# SQLServer_CLI_Client
Little CLI client in PowerShell to talk to SQL Server. Useful for internal pentesting or pivoting scenarios

# Example Queries

"SELECT TABLE_SCHEMA FROM information_schema.tables group by tables.TABLE_SCHEMA" # List System Database </br>
"SELECT name FROM master.dbo.sysdatabases" # List all Databases </br>
"SELECT name FROM sys.databases WHERE state = 0" # List online Databases </br>
"SELECT TABLE_NAME FROM <DATABASE>.INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE'" # List tables from Database </br>
"SELECT name, crdate FROM SYSOBJECTS WHERE xtype = 'U';" # List tables created by the user </br>

# Use Example:

./sql.ps1 -user "USERNAME" -pwd "PASSWORD" -datasource "NETWORKMACHINE\SQLVERSION" -query "SELECT name, crdate FROM SYSOBJECTS WHERE xtype = 'U';" </br>
./sql.ps1 -user "sa" -pwd "sa1234" -datasource "localhost\SQL13" -query "SELECT name, crdate FROM SYSOBJECTS WHERE xtype = 'U';"

