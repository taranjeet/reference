#**Script to check new mail(Gmail) using linux termainal**
* open a text editor and write the following code 
	
	`#!/bin/bash`

	`username="GmailUsername"`
	
	`password="GmailPassword"`
	
	`echo curl -u $username:$password --silent "https://mail.google.com/mail/feed/atom" |  grep -oPm1 "(?<=<title>)[^<]+" | sed '1d'`
	

* save the file with `.sh` extension(e.g. check_gmail.sh)
* open terminal and go to the directory where you have saved the file check_gmail.sh
	
	1.change permission of check_gmail.sh 
		
		`>>> sudo chmod +x check_gmail.sh`

	2.Run your script using this command
		
		`>./check_gmail.sh`

Enjoy.
