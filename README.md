# CIO4Good Database Cleaning and Creation

## Running files

### run_mysql_script.py

usage: run_mysql_script.py [-h] -c CONFIG -p PATH
run_mysql_script.py: error: the following arguments are required: -c/--config, -p/--path

### cleaning.py

Contains code to create the accumulative file for input into the database. This will need to be run after each year.

##### Notes

Make sure to validate the data after running the `cleaning.py` file to create the agrgregate CSV file for input into the database. There is a known issue with the `# of Organization Staff` field putting data from 2001 in a different column of it's own toward the beginning and the rest in a duplicate column in subsequent years. Just move them over into the later column.

### cummulative.sql

Contains the sql code to create the database.

## Data Files

All files needed for running can be found in the Google Drive folder. This is for privacy reasons.

## Steps to push to AWS

1) Run the `cleaning.py` file.
2) Run `run_mysql_script.py` to get the database created locally.
3) In your terminal run `mysqldump` to create a `.sql` file 
4) Run the aws connection string with to imput the new database.
5) Double check some queries to make sure that the import was successful and all fields mapped.

Example:
* `mysql -h <HOSTNAME> -P <PORT> -u <MASTER_USER> -p <DATABASE> < <PATH/TO/DUMP.SQL>`


