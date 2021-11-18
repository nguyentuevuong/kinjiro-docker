#!/bin/bash

export MSSQL_SA_PASSWORD=$DEFAULT_MSSQL_SA_PASSWORD
(/opt/mssql/bin/sqlservr --accept-eula & ) | grep -q "Server is listening on" && sleep 2

/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $MSSQL_SA_PASSWORD -Q "RESTORE DATABASE [UK4_KDW013] FROM DISK = '/var/opt/mssql/backups/UK4_KDW013.BAK' WITH MOVE 'UK9' TO '/var/opt/mssql/data/UK4_KDW013.mdf', MOVE 'UK9_log' TO '/var/opt/mssql/data/UK4_KDW013_log.ldf'"
