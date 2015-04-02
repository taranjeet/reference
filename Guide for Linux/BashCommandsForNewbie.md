#**DIRECTORY OPERATIONS**
* ## ls:
	To show the list of current files and directory
	### Advance **ls options**:
		-a Show all (including hidden)
		-R Recursive list
		-r Reverse order
		-t Sort by last modified
		-S Sort by file size
		-l Long listing format
		-1 One file per line
		-m Comma-separated output
		-Q Quoted output
		
	> note: dir is also working in linux to show the files and directory terminal but it doesn't show the permission on files or folders 

		
* ## pwd(present Working Directory):
	To show current directory 
		
		
* ## mkdir directory_name:
	To make directory directory_name
		

* ## cd directory_name :
	To change directory to directory_name
	

* ## cd .. :
	To go up directory(parent directory)

***

#**FILE OPERATIONS**

* ##touch file1 :
	To create file1

* ##cat file1 file2 :
	To concatenate files and output

* ##less file1 :
	To view and paginate file1

* ##file file1 :
	To get type of file1

* ##cp file1 file2 :
	To copy file1 to file2

* ##mv file1 file2 :
	To move file1 to file2

* ##rm file1 :
	To delete file1

* ##head file1 :
	Show first 10 lines of file1

* ##tail file1 :
	To show last 10 lines of file1

* ##tail -f file1
	Output last lines of file1 as it changes

***

#**Search Files**

* ##grep pattern files
	Search for pattern in files

* ##grep -i 
	Case insensitive search

* ##grep -r 
	Recursive search

* ##grep -v 
	Inverted search

* ##grep -o 
	Show matched part of file only

* ##find /dir/ -name filename*
	Find files starting with filename in dir

* ##find /dir/ -user name
	Find files owned by name in dir

* ##find /dir/ -mmin num
	Find files modifed less than num minutes ago in dir

* ##whereis command
	Find binary / source / manual for command

* ##locate file 
	Find file (quick search of system index)

***

#**File Permissions**

* ##chmod 775 file
	Change mode of file to 775

* ##chmod -R 600 folder
	Recursively chmod folder to 600

* ##chown user:group file
	Change file owner to user and group to group

	> **File Permission Numbers**
		The first digit is the owner permission, the second the
		group and the third for everyone.
		Calculate each of the three permission digits by
		adding the numeric values of the permissions below
			4 	read (r)
			2 	write (w)
			1 	execute (x)