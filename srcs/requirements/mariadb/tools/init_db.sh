#!/bin/sh

service mariadb start


if [ -f /var/run/mysqld/mysqld.pid ]; then
    rm -f /var/run/mysqld/mysqld.pid
fi

# 
if [ ! -d "/var/lib/mysql/${DB_NAME}" ]; then
    echo "Creating database and user"
    mysql -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;"
    mysql -e "CREATE USER IF NOT EXISTS \`${DB_USER}\`@'%' IDENTIFIED BY '${DB_PWD}';"
    mysql -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO \`${DB_USER}\`@'%';"
    mysql -e "FLUSH PRIVILEGES;"
else
    echo "No need to init db because db already exist. "
fi

echo "Stop MariaDB process"
mysqladmin -u root shutdown

exec "$@"