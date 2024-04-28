<?php
require_once 'actions/db_connect.php';
require_once 'actions/normalize.php';

// SQL query to select all items
$sql = "SELECT * FROM item";
$result = $mysqli->query($sql);

$tbody = ''; // Variable to hold the body for the table

// Check if there are any results
if ($result->num_rows > 0) {
    // Fetch each row from the result set
    while ($row = $result->fetch_array(MYSQLI_ASSOC)) {
        // Build the HTML structure for each item
        $tbody .= "<div>
            <div class='card p-3 mb-5'>
                <div class='card-img-body'>
                    <a href='details.php?id=" . $row['id'] . "'><img class='img-thumbnail img-fluid overflow-hidden w-100' data-bs-toggle='modal' data-bs-target='#exampleModal' src='pictures/" . $row['picture'] . "' height='450px' alt='" . normalize($row['title']) . "'></a>
                </div>
                <div class='card-body'>
                    <h4 class='card-text'>" . normalize($row['author_first_name']) . " " . normalize($row['author_last_name']) . "</h4>
                    <h5 class='card-title'>" . $row['title'] . "</h5>
                    <p class='card-text'>" . substr(normalize($row['short_description']), 0, 45) . " <a href='details.php?id=" . $row['id'] . "'>...more</a><br></p>
                    <p class='card-text'>" . $row['isbn'] . "</p>
                    <p class='card-text'>Type: " . $row['item_type'] . "</p>
                    <p class='card-text'><a href='publisher.php?id=" . $row['id'] . "'>" . normalize($row['publisher_name']) . "</a></p>
                </div>
                <div class='card-footer'>
                    <a class='col-4 p-2 ms-3 btn btn-secondary btn-sm w-25 text-white' href='details.php?id=" . $row['id'] . "'>Details</a>
                    <a class='col-4 p-2 ms-3 btn btn-secondary btn-sm w-25 text-white' href='update.php?id=" . $row['id'] . "'>Update</a>
                    <a class='col-4 p-2 ms-3 btn btn-danger btn-sm w-25 text-white' href='delete.php?id=" . $row['id'] . "'>Delete</a>
                </div>
            </div>
        </div>";
    }
} else {
    // No data available
    $tbody = "<div class='row'><div class='col'><center>No Data Available</center></div></div>";
}

// Close the database connection
$mysqli->close();
?>
<?php require_once 'inc/htmlhelper.php';
head(" | Overview"); ?>

<div class="container">
    <h1 class="text-center py-4">Our Items</h1>
</div>
<div class="container card py-3">
    <div class="row row-cols-md-2 row-cols-xl-3">
        <?= $tbody; ?>
    </div>
    <div class='mb-3 mx-auto'>
        <a class="col-4 p-2 ms-3 btn btn-success btn-sm w-100 text-white" href="create.php">Create a new Item</a>
    </div>
</div>
</div>
<?php htmlend(); ?>
