<?php
require_once 'actions/db_connect.php';
if ($_GET['id']) {
  $id = $_GET['id'];
  $sql = "SELECT * FROM item WHERE publisher_name = (SELECT publisher_name FROM ITEM WHERE id = {$id})";
  $result = $mysqli->query($sql);
  $tbody = '';
  if ($result->num_rows > 0) {
    while ($row = $result->fetch_array(MYSQLI_ASSOC)) {
      $publisher_name = $row['publisher_name'];
      $tbody .= "
      <div>
        <div class='card p-3 mb-5'>
          <div class='card-img-body'>
            <a href='details.php?id=" . $row['id'] . "'><img class='img-thumbnail img-fluid overflow-hidden w-100' data-bs-toggle='modal' data-bs-target='#exampleModal' src='pictures/" . $row['picture'] . "' height='450px' alt=" . $row['title'] . "></a>
          </div>
          <div class='card-body'>
            <h4 class='card-text'>" . $row['author_first_name'] . " " . $row['author_last_name'] . "</h4>
            <h5 class='card-title'>" . $row['title'] . "</h5>
            <p class='card-text'>" . substr($row['short_description'], 0, 45) . " <a href='details.php?id=" . $row['id'] . "'>...more</a><br></p>
            <p class='card-text'>" . $row['isbn'] . "</p>
            <p class='card-text'>Type: " . $row['item_type'] . "</p>
            <p class='card-text'><a href='publisher.php?id=" . $row['id'] . "'>" . $row['publisher_name'] . "</a></p>
          </div>
            <div class='card-footer'>
              <a class='col-4 p-2 ms-3 btn btn-secondary btn-sm w-25 text-white' href='details.php?id=" . $row['id'] . "'>Details</a>
              <a class='col-4 p-2 ms-3 btn btn-secondary btn-sm w-25 text-white' href='update.php?id=" . $row['id'] . "'>Update</a>
              <a class='col-4 p-2 ms-3 btn btn-danger btn-sm w-25 text-white' href='delete.php?id=" . $row['id'] . "'>Delete</a>
            </div>
        </div>
      </div>";
    };
  } else {
    $tbody =  "<tr><td colspan='10'><center>No Data Available </center></td></tr>";
  }
} else {
  header("location: error.php");
}
$mysqli->close();
?>

<?php require_once 'inc/htmlhelper.php';
head(" | Publisher | $publisher_name"); ?>

<div class="container">
  <h1 class="text-center py-4">The Items of <?= $publisher_name ?></h1>
</div>
<div class="container card py-3">
  <div class="row row-cols-1 row-cols-sm-2 row-cols-lg-3">
    <?= $tbody; ?>
  </div>
  <div class='mb-3 mx-auto'>
    <a class="col-4 p-2 ms-3 btn btn-success btn-sm w-100 text-white" href="index.php">Home</a>

  </div>
</div>
</div>
<?php htmlend(); ?>