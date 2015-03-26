#!/usr/bin/python

import MySQLdb
import sys

                     
connection = MySQLdb.connect(
  'mysql.danieljwilson.com',  # the host the database server is running on.
  'psiturk',       # the database user you use to connect to the database server
  'psiturk19',           # the passwort for that database user
  'psiturktest'        # the name of the database.  test is always there
);

cursor = connection.cursor()
cursor.execute("SELECT VERSION()")

version = cursor.fetchone()
  
print "Database version : %s " % version
