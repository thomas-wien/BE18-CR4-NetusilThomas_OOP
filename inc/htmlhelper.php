<?php

function head($titel = " | Thomas ")
{
  echo '<!DOCTYPE html> 
  <html lang="en" data-bs-theme="auto">
    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
      <link rel="stylesheet" type="text/css" href="css/style.css">
      <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
      <meta name="author" content="Thomas Netusil">
      <meta name="description" content="CodeReview 4">
      <title>The Big Library Web Application' . $titel . '</title>
      <link href="favicon.ico" rel="icon">
      <script src="js/darkLight.js" defer></script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous" defer></script>

    </head>
    <body>
    
  <header class="position-relative">';

  include_once 'menue.php';

  echo '<div style="height: 35vh" class="banner-image w-100 d-flex justify-content-center align-items-center pt-5"></div>
  <h1 class="vw-auto d-block display-5 position-absolute top-50 start-50 translate-middle text-center text-white bg-dark  bg-opacity-75 px-4 py-5">
      The Library</h1>
  </header>';
}

function htmlend()
{
  echo ' <footer class="container-fluid mt-5 bg-dark text-white text-center ">
  
  <p class="fs-6 m-2 p-2">&copy; 2023 Copyright Thomas Netusil  <a href="https://https://github.com/thomas-wien/BE18-CR4-NetusilThomas-Procedural.git" target="_blank" rel="noopener noreferrer">Github Procedual Version</a> 
  <a href="https://github.com/thomas-wien/BE18-CR4-NetusilThomas_OOP.git" target="_blank" rel="noopener noreferrer">Github OOP Version</a></p>
</footer>
</body>
  </html>';
}

function logged_in()
{
  if (!isset($_SESSION["user"]) && !isset($_SESSION["adm"])) {
    header("Location: ../index.php");
  }
  if (isset($_SESSION["user"])) {
    header("Location: ../home.php");
  }
}
