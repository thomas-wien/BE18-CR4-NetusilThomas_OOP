<?php

// Defining Constants to use a function also
 // Local
    DEFINE("HOST", "localhost");
    DEFINE("USER", "root");
    DEFINE("PASS", "");
    DEFINE("DB", "netusilcodefacto_be18_cr4_netusilthomas_biglibrary");

// create connection
// $connect = mysqli_connect(HOST, USER, PASS, DB);
// Object Orientated connection
$mysqli = new mysqli(HOST, USER, PASS, DB);

function getCon()
{
    $connect = mysqli_connect(HOST, USER, PASS, DB);
    return $connect;
}
// check connection
// if (!$connect) {
//     die("Connection failed: " . mysqli_connect_error());
// }else {
//     echo "Connected successfully";
// }
//  check object Orientated Connection

if ($mysqli->connect_error) {
    die('Object Orientated Connection failed: ' . mysqli_connect_error());
}
