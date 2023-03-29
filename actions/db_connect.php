<?php

// Defining Constants to use a function also
if (str_contains($_SERVER['HTTP_HOST'], 'localhost')) {
    // Local
    DEFINE("HOST", "localhost");
    DEFINE("USER", "root");
    DEFINE("PASS", "");
    DEFINE("DB", "netusilcodefacto_be18_cr4_netusilthomas_biglibrary");
} else {
    // Codefactory
    DEFINE("HOST", "173.212.235.205");
    DEFINE("USER", "netusilcodefacto_thomas");
    DEFINE("PASS", "U9BcyKixxr44fSL");
    DEFINE("DB", "netusilcodefacto_be18_cr4_netusilthomas_biglibrary");
}

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
