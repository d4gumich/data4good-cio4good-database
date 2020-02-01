# CIO4Good Database

## Project Layout
| Key File |  Description |
| - | - |
| cleaning.py | Contains code to create the accumulative file for input into the database. This will need to be run after each year.| 
| cumulative.sql | Contains the sql code to create the database.| 
| run_mysql_script.py | Contains code to create the accumulative file for input into the database. This will need to be run after each year. | 

## Setup 

### Project
In root directory:
```
pip install virtualenv #if you don't have virtualenv installed 
```

Create virtualenv
```
virtualenv <Name_of_Virtual_Environment>
```

Activate virtualenv
```
source <Name_of_Virtual_Environment>/bin/activate
```

Install project requirements usings the requirements.text
```
pip install -r requirements.txt
```
### Mysql
Use (MySQL Workbench)[https://www.mysql.com/products/workbench/] to configure a database quickly for the upcoming steps. After configuring mysql, open mysql workbench and do the following:

1) Create a connection. Make sure to remember all the information you enter in here! This is the information you'll be entering in the `config/my.yaml` file. 
2) Enter the information you used to create a connection into a *.yaml file in the `config` folder
3) (Optional) Create a database/schema named `cio4good` INSIDE the connection you just created

## Steps to create MySQL Database

1) Run the `cleaning.py` file.
```
python cleaning.py
```

2) Run `run_mysql_script.py` as follows, tailoring the *.yaml and *.sql file paths as necessary:
_macOS_
```
python3 run_mysql_script.py -c ./path/to/config/file/*.yaml -p ./path/to/sql/script/*.sql
```
_Windows_
```
python run_mysql_script.py -c ./path/to/config/file/*.yaml -p ./path/to/sql/script/*.sql
```

so
```
python run_mysql_script.py -c ./config/my.yaml -p ./cumulative.sql
```

3) In your terminal run `mysqldump` to create a `.sql` file 
```
sudo mysqldump cio4good cio4good -p
```
_This way works if your username/user is root._

## Steps to push to AWS
1) Run the aws connection string with to input the new database.

2) Double check some queries to make sure that the import was successful and all fields mapped.

Example:
* `mysql -h <HOSTNAME> -P <PORT> -u <MASTER_USER> -p <DATABASE> < <PATH/TO/DUMP.SQL>`


## Notes

### run_mysql_script.py
This python script is designed to process MySQL scripts. The run_mysql_script.py script requires a valid database connection provided via local *.yaml config file. After opening a connection and creating a cursor, the script creates a list of SQL statements after splitting the SQL script on each semi-colon encountered (;). The script then loops through the statements, attempting to execute each. If successful, the script commits the changes, closes the cursor and then closes the connection. Otherwise, it rolls back the transaction and reports the error encountered.

#### Create a .yaml configuration file
Create a .yaml configuration file. The run_mysql_script.py script reads this file in order to retrieve the database connection settings. Add the following database connection settings to your .yaml file. Make sure you set the user and passwd variables to the correct values.

mysql:
  host: localhost
  port: [yer port number, typically 3306]
  user: [yer MySQL user]
  passwd: [yer MySQL user password]
  db: unesco_heritage_sites
  local_infile: True

#### Script arguments
The run_mysql_script.py features the following arguments:

-h, --help (show this help message and exit)
-c, --config (path to config file)
-p, --path (path to script)

### cleaning.py
Make sure to validate the data after running the `cleaning.py` file to create the agrgregate CSV file for input into the database. There is a known issue with the `# of Organization Staff` field putting data from 2001 in a different column of it's own toward the beginning and the rest in a duplicate column in subsequent years. Just move them over into the later column.


