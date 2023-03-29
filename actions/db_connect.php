<?php

// Defining Constants to use a function also
require_once 'inc/config.inc.php';

// create connection
$mysqli = new mysqli(HOST, USER, PASS, DB);

// 
function getCon()
{
    $connect = new mysqli(HOST, USER, PASS, DB);
    return $connect;
}


if ($mysqli->connect_error) {
    die('Object Orientated Connection failed: ' . mysqli_connect_error());
}
