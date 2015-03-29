To schedule a job , you can use two alternates:
* cron
* at

**cron** is used for schedulling repeatitive tasks that needs to occur daily, whereas **at** is used for a single schedulling. I will be telling how to use **at**.

Check if at command is running or not.
```shell
$ ps -ef | grep atd
```
If it is running then you will see
```shell
daemon   21299     1  0 19:28 ?        00:00:00 atd
```

There can be meek possibility that it is not installed on your system. Install it by
```shell
sudo apt-get install at
```
After it is installed check again and if it is not starting then start it by
```shell
/etc/init.d/atd start
```
Now suppose you need to run a file named **shell.sh** located in the home directory. Do it by
```shell
at -f shell.sh -v 18:30
```
18:30 means 6:30 PM here

here is the [link](http://tecadmin.net/one-time-task-scheduling-using-at-commad-in-linux/) that you can refer.

