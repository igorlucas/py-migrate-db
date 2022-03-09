FROM python:3.8.10-slim-buster

WORKDIR /app

# Add postgresql client
RUN apt-get update -y
RUN apt-get install postgresql-client wget -y

RUN pip install pymigratedb
COPY migrate.sh .

RUN chmod +x migrate.sh && mv migrate.sh /usr/local/bin

RUN wget https://dl.google.com/cloudsql/cloud_sql_proxy.linux.amd64 -O cloud_sql_proxy
RUN chmod +x cloud_sql_proxy && mv cloud_sql_proxy /usr/local/bin
