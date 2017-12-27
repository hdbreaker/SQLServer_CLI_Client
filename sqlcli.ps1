# Example Queries
# "SELECT TABLE_SCHEMA FROM information_schema.tables group by tables.TABLE_SCHEMA" # List System Database
# "SELECT name FROM master.dbo.sysdatabases" # List all Databases
# "SELECT name FROM sys.databases WHERE state = 0" # List online Databases
# "SELECT TABLE_NAME FROM <DATABASE>.INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE'" # List tables from Database
# "SELECT name, crdate FROM SYSOBJECTS WHERE xtype = 'U';" # List tables created by the user

# Use Example:
# ./sql.ps1 -user "USERNAME" -pwd "PASSWORD" -datasource "NETWORKMACHINE\SQLVERSION" -query "SELECT name, crdate FROM SYSOBJECTS WHERE xtype = 'U';"
# ./sql.ps1 -user "sa" -pwd "sa1234" -datasource "localhost\SQL13" -query "SELECT name, crdate FROM SYSOBJECTS WHERE xtype = 'U';"

Param(
  [string]$user,
  [string]$pwd,
  [string]$datasource, # Hostname
  [string]$database, # default ""
  [string]$query
)

$connectionString = "Server=$dataSource;uid=$user; pwd=$pwd;Database=$database;Integrated Security=False;"

$connection = New-Object System.Data.SqlClient.SqlConnection
$connection.ConnectionString = $connectionString
#$connection.ConnectionString = "Server=$dataSource;Database=$database;Integrated Security=True;"
$connection.Open()
$command = $connection.CreateCommand()
$command.CommandText  = $query

$result = $command.ExecuteReader()

$table = new-object "System.Data.DataTable"
$table.Load($result)

echo $table

$connection.Close()
