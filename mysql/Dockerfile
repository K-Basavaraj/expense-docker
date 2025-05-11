#1st best practice as simple 
# FROM mysql:8.0
# ENV MYSQL_ROOT_PASSWORD=ExpenseApp@1
# ADD scripts/*.sql /docker-entrypoint-initdb.d
    #MYSQL_DATABASE=transactions \ we are comming this beause we are loading the database from backend
    # MYSQL_USER=expense \
    # MYSQL_PASSWORD=ExpenseApp@1

  

#2nd best practice we have to create a user and group 
FROM mysql:8.0
ENV MYSQL_ROOT_PASSWORD=ExpenseApp@1
RUN groupadd expense && \
    useradd -g expense expense && \
    chown -R expense:expense /var/lib/mysql /var/run/mysqld /docker-entrypoint-initdb.d
ADD scripts/*.sql /docker-entrypoint-initdb.d
USER expense