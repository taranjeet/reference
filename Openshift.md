Hi all,

In this post I will be talking about how to host a Django based app on OpenShift.

* First of all, why only Openshift, when there are so many alternatives:
  Well I will keep this as **Openshift vs Heroku**. Ok so Heroku has a 
  nice support and its really easy if you are using PostgreSql or Sql 
  as a database, but when you need to perform geospatial queries like
  **all the places within 5 km of range**, then Heroku loses. You can
  install Geodjango and its associated libraries [SO link](http://stackoverflow.com/questions/28350422/installing-geodjango-on-heroku/28353574) but you **cannot create POSTGIS extension**
  because one is not given **SuperUser access** on **Hobby-Dev** plan.

  So after struggling the whole day, next day in the morning I looked for
  Openshift and yes! It worked. Its because you are given express edition
  of database in Openshift under Free Tier and so you can create **POSTGIS
  extension** very easily.

* Now installing Client Tools for Openshift

	* The instruction for installing can be found [here](https://developers.openshift.com/en/getting-started-debian-ubuntu.html#client-tools). If you are following the tutorial
	and using Ubuntu 14.04 like me, you fill face an error like
	```shell
	E: Package 'rubygems' has no installation candidate
	```
	So use
	```shell
	sudo apt-get install rubygems-integration
	```
	* After the installation is complete, follow this [link](http://appsembler.com/blog/django-deployment-using-openshift/). I will explain here though. Unlike Heroku, where you can
	directly commit code from local to heroku server, in openshift you need 
	to specify repo.

	```shell

	rhc app create <nameofApp> python-2.6 	#creating app
	cd nameofApp
	rhc cartridge add postgresql-9.2 -a nameofApp	#attaching postgresql cartridge
	```
	
	Now ssh into your app to create postgis extension
	```shell
	#create postgis extension
	rhc ssh nameofApp
	psql
	CREATE EXTENSION postgis;
	\q
	exit
	#till here you have created a database with postgis extension
	```
	Now you must be in your nameofApp directory where a folder named .openshift 
	will be there. Now lets add a remote and pull the code from there.

	```shell
	git remote add newremote https://github.com/staranjeet/newgeolocation.git
	git fetch newremote
	```

	Its time to edit some files now, 
	```shell
	mkdir wsgi
	cd wsgi
	touch application
	vim application
	```
	```python
	#!/usr/bin/env python

	import os
	import sys

	sys.path.append(os.path.join(os.environ['OPENSHIFT_REPO_DIR']))

	os.environ['DJANGO_SETTINGS_MODULE'] = 'geodjtj.settings'

	virtenv = os.environ['OPENSHIFT_HOMEDIR'] + 'python-2.6/virtenv/'

	# env shows this as the egg cache:
	# PYTHON_EGG_CACHE=/var/lib/openshift/ecad07d3b3a7455085c8644d2f04e6bc/python-2.6/.python-eggs/
	os.environ['PYTHON_EGG_CACHE'] = os.path.join(virtenv, 'lib/python2.6/site-packages')

	virtualenv = os.path.join(virtenv, 'bin/activate_this.py')
	try:
	    execfile(virtualenv, dict(__file__=virtualenv))
	except IOError:
	    pass
	#
	# IMPORTANT: Put any additional includes below this line.  If placed above this
	# line, it's possible required libraries won't be in your searchable path
	# 

	from django.core.wsgi import get_wsgi_application
	application = get_wsgi_application()
	```

	This wsgi file is necesarry because it will tell Openshift which app to serve. If this
	is not there, then your app will be hosted but you will see a default welcome to Openshift
	page.




	

