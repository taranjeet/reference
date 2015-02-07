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
	```
	

