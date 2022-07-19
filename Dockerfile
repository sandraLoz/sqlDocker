FROM mcr.microsoft.com/mssql/server:2019-CU13-ubuntu-20.04
USER root

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY ./create_database.sql /usr/src/app/create_database.sql
COPY ./start.sh /usr/src/app/start.sh
COPY ./entrypoint.sh /usr/src/app/entrypoint.sh

# Grant permissions for the import-data script to be executable
RUN chmod +x /usr/src/app/start.sh

#CMD /bin/bash ./entrypoint.sh
ENTRYPOINT /bin/bash ./entrypoint.sh