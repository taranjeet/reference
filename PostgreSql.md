## Installing PostgreSql

```shell
$ which psql

$ sudo -u postgres createuser -s $USER

$ createdb -U $USER --locale=en_US.utf-8 -E utf-8 -O $USER newdb -T template0

```
[Link to above](http://killtheyak.com/use-postgresql-with-django-flask/)