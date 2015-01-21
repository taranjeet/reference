#Woring with Django

This will create a basic django app using PostgreSql as database.

PreRequistites:
*Django (v 1.7)
*PostgreSql
*PsyCopg(Python wrapper for PostgreSql)

* Check if django is installed in system or not

```shell

$python -c "import django; print(django.get_version())"
```

If django is installe, you should see the version of your installation. If it isnot, you will get an erro telling No module named django.

Now edit the database settings in settings.py file

For postgreSql add 

django.db.backends.postgresql_psycopg2

Then change the time zone to 'Asia/Kolkata'

Now comes the power of migrate feature in Django 1.7

* Change the models in models.py
* Run python manage.py makemigrations tocreate migrations for those changes
* Run manage.py migrate to apply those changes to the database

Creating an admin user 

```shell

$ python manage.py createsuperuser

  Username : admin
  Email address : admin@example.com
  Password: ********
  Password(again): ********
  Superuser created successfully.

$ python manage.py runserver

```

This admin panel can be used to add any object through it like
admin.site.register(Question)

Now create the urls.py file in app and add the url of that app in 
projects url file

like write a normal urls.py file in app and then 
in the main project urls.py, do

```python
url(r'^polls/',include('polls.urls'))
