FROM mcr.microsoft.com/mssql/server:latest

ENV DEFAULT_MSSQL_SA_PASSWORD=Kinjirou@#123
ENV ACCEPT_EULA=Y

USER root

COPY ./restore-db.sh /opt/mssql/bin/restore-db.sh
COPY ./entry-point.sh /opt/mssql/bin/entry-point.sh

RUN chmod +x /opt/mssql/bin/restore-db.sh
RUN chmod +x /opt/mssql/bin/entry-point.sh

COPY ./UK4_KDW013.BAK /var/opt/mssql/backups/UK4_KDW013.BAK

RUN chown -R mssql:root /var/opt/mssql/backups
RUN chmod 0755 /var/opt/mssql/backups
RUN chmod -R 0650 /var/opt/mssql/backups/UK4_KDW013.BAK

USER mssql

RUN /opt/mssql/bin/restore-db.sh

# remove backup file
RUN rm -rf /var/opt/mssql/backups/UK4_KDW013.BAK

CMD ["/opt/mssql/bin/sqlservr"]

ENTRYPOINT ["/opt/mssql/bin/entry-point.sh"]
