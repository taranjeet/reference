## Installing PostgreSql

### Ubuntu

```shell
$ which psql

$ sudo -u postgres createuser -s $USER

$ createdb -U $USER --locale=en_US.utf-8 -E utf-8 -O $USER newdb -T template0

```
[Link to above](http://killtheyak.com/use-postgresql-with-django-flask/)

```shell

$ dropdb development_database_name
$ createdb development_database_name
```

### Mac

```
$ brew update

$ brew install postgresql

# create symlink
$ ln -sf /usr/local/Cellar/postgresql/9.5.5/homebrew.mxcl.postgresql.plist ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist

# start the service
$ launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist

# create database
$ createdb mydb
```
