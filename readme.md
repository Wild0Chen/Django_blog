markdown2==2.3.1
Pillow==3.2.0
Pygments==2.1.3
pytz==2016.6.1

sudo pip install xxx -i http://mirrors.aliyun.com/pip/simple
执行后timezone问题
mysql_tzinfo_to_sql /usr/share/zoneinfo | mysql -u root -p  mysql
重启数据库
mac mysql.server restart
