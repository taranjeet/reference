OKay. So you created a Django app which uses PostgreSql as database and are now
thinking to host this app. So HEROKU can be used. I know there are many tutorial
especially this [one](https://devcenter.heroku.com/articles/getting-started-with-django).
But I prefer documenting:

* As usual create your normal app.(I did not use venv).
* if **django-toolbelt** is  not installed then install it
	```shell
	sudo pip install django-toolbelt
	```
* Create a **Procfile** in the root directory of your project(where manage.py resides)
	```shell
	touch Procfile
	cat >>Procfile
	web: gunicorn <nameOfApp>.wsgi --log-file -
	```

	Now start the processes in your Procfile locally using **Foreman**.
	```shell
	foreman start
	```
	You will see something like listening on this port.

* Specify **dependencies** with pip. For this use
	```shell
	pip freeze > requirements.txt
	```
	Since if you are not using venv, then this pip will perform a dependency scan on the global python packages and you will get a complete list of all the packages. For my purpose(remember a Django app with PostgreSql as database), I only require this much:
	```Text
	Django==1.7.3
	psycopg2==2.5.4
	dj-database-url==0.3.0
	dj-static==0.0.6
	gunicorn==19.1.1
	static3==0.5.1
	wsgiref==0.1.2
	```
* Now comes the most tricky part. **How to get your local database properly functioning on Heroku?** i.e. How to tell Heroku that use this database with that user and password. For this you need to edit the settings.py file

	```python
		#add this at the starting open
		import dj_database_url
		import os
		BASE_DIR = os.path.dirname(os.path.abspath(__file__))
		STATIC_ROOT = 'staticfiles'
		STATIC_URL = '/static/'

		# Honor the 'X-Forwarded-Proto' header for request.is_secure()
		SECURE_PROXY_SSL_HEADER = ('HTTP_X_FORWARDED_PROTO', 'https')

		# Allow all host headers
		ALLOWED_HOSTS = ['*']

		STATICFILES_DIRS = (
    	os.path.join(BASE_DIR, 'static'),
		)

		#this after the DATABASES tuple
		DATABASES['default'] =  dj_database_url.config()

		#end
	```
	Open your **wsgi.py** and add these lines
	```python
	from django.core.wsgi import get_wsgi_application	
	from dj_static import Cling

	application = Cling(get_wsgi_application())
	```
* Now Store your app in **Git**.
	```shell
	git add .
	git commit -m "mods for heroku"
	```

* Deploy to Heroku
	```shell
	heroku create <nameOfApp>
	git push heroku master
	```

* Run syncdb to create models 
	```shell
	heroku run python manage.py syncdb
	```

Voila!! Now your app is there on the web. Go and have fun!.
