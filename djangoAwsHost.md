Hi, someone asked me to make a doc for deploying a django application on an AWS instance. So, I am making this blog post for that.
Prerequisite:

1. Ubuntu or any other flavour of Linux
2. Knowledge of Git 
3. A Github/Bitbucket Account and 
4. Obiviously an AWS account

Setting up Account on AWS:

So, first of all you need to have an account on AWS. If you Dont have one then you can create the account by going to the link http://aws.amazon.com and follow the instructions in setting up the account.   

Instance Creation on AWS:

After setting up the account, you need to create an instance of EC2 from your AWS account and you 
will be asked to choose a machine, then choose 64 bit Ubuntu 14.04 HVM. During instance creation, you will be asked to generate the key file for logging on to your instance, then type any name you like and click "Download the File". Keep the file safe since you cannot download it again. 

After downloading the key file(extension is "*.pem") then your instance will be created and it will assigned an IP Address and copy that IP address for the future use. 

Configuring the Instance:

After logging into your AWS Account , you will see a lot of services that are provided by the AWS. From those services, select the first one i.e EC2 CLOUD. Then, in the next screen, wou will see that one instance is running. You would need to configure the  port of the instance by going on to the Security Group that comes on the left side of the AWS console Screen. Click on the security group and then below click at Inbound Option then set TYPE: All Traffic , Protocol: All, Port Range: All.

Finally, you all configured. 

Logging into AWS Instance :

Open terminal and type the following command:
sudo ssh -i name_of_key_file.pem ubuntu@Instance_ip_address
for example: sudo ssh -i deshraj.pem ubuntu@54.123.456.78 
          ( Note: i am assuming that the .pem file is there in the home directory)
   
     2. If nothing gets wrong then you will be successfully logged in to your instance. Now you need to install some packages to run your django web application.

     3.  I am listing the packages that you need to install :

            sudo apt-get udpate
            sudo apt-get install python-dev
            sudo apt-get install python-pip
            sudo apt-get install apache2
            sudo apt-get update
            pip install django
      sudo apt-get install libapache2-mod-wsgi
      sudo a2enmod wsgi
      sudo service apache2 restart 

          (Please install the other packages yourself if I would have missed something)
 
     4. After the installation you are good to go and you need to clone your repository of django project.

For Cloning type the following command :
             cd /var/www/
             git clone link_to_git_repository
 for example : git clone https://github.com/DESHRAJ/Youtube-Downloader.git

    5. Now you need to edit the apache config present at /etc/apache2/apache2.conf.

        To edit that file, type the command:
            nano /etc/apache2/apache2.conf

 At the end of this file, add the following lines according to location of your django project :
            
    WSGIScriptAlias / /path/to/mysite.com/mysite/wsgi.py
  WSGIPythonPath /path/to/mysite.com

  <Directory /path/to/mysite.com/mysite>
  <Files wsgi.py>
     Require all granted
  </Files>
  </Directory>
Or if you have problem in changing the .conf file,then follow the tutorial at this link: https://docs.djangoproject.com/en/1.7/howto/deployment/wsgi/modwsgi/

Now you are all done. Just restart the apache2 web server adn you are all done.
Commanfe for restartiing the paache server :
sudo service apache2 restart

Finally you have successfully deployed the django application on AWS instance. :) 