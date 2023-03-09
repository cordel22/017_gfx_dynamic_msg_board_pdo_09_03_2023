<?php

//  for security better put thi file outside of this folder like ../
//  This file also establishes a connection to MySQL,
//  selects this database, and sets the encoding.

//  Set the database access information as constants:
DEFINE ('DB_USER', 'vladkome_cordel');
DEFINE ('DB_PASSWORD', 'DoPsejMatere123!');
DEFINE ('DB_HOST', 'localhost');
DEFINE ('DB_NAME', 'vladkome_017_gfx_d_php_mysql_msg_board');

//  Make the connection:
$dbc = @mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME) OR die('Could not connect to MySQL: ' . mysqli_connect_error() );
//  call is preceded by @ in order to suppress any ugly errors.
//  Set the encoding...
mysqli_set_charset($dbc, 'utf8');
