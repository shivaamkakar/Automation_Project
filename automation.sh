#!/bin/bash
sudo apt update -y
sudo apt-get install -y dpkg
sudo /etc/init.d/apache2 start
servstat=$(service apache2 status)

if [[ $servstat == *"active (running)"* ]]; then
  echo "process is enabled and running"
else echo "apache2 service is not enabled"
fi

exec("tar -zcvf shivaam-httpd-logs.tar.gz *.log && rm -f *.log")

FILE=/var/www/html/inventory.html
if test -f "$FILE"; then
    echo "$FILE exists."
else
        cat /var/www/html/inventory.html
fi

$ date  >> inventory.html
