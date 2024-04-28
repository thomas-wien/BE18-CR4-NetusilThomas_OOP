<?php
require_once 'db_connect.php';

if ($_POST) {
    // Get id and picture from POST data
    $id = $_POST['id'];
    $picture = $_POST['picture'];

    // Check if file exists before attempting to delete
    if ($picture != "product.png" && file_exists("../pictures/$picture")) {
        unlink("../pictures/$picture");
    }

    // Prepare SQL statement to delete item by id
    $sql = "DELETE FROM item WHERE id = ?";

    // Prepare and bind parameters to the statement
    $stmt = $mysqli->prepare($sql);
    $stmt->bind_param("i", $id);

    // Execute the statement
    if ($stmt->execute()) {
        // Redirect to index page on successful deletion
        header("location: ../index.php");
    } else {
        // Error handling if deletion fails
        $class = "danger";
        $message = "The entry was not deleted due to: <br>" . $connect->error;
    }
    // Close the database connection
    $stmt->close();
    $mysqli->close();
} else {
    // Redirect to error page if POST data is not received
    header("location: ../error.php");
}
?>

<?php require_once 'inc/htmlhelper.php';
head(" | Delete"); ?>

<div class="container">
    <div class="mt-3 mb-3">
        <h1>Deletion request response</h1>
    </div>
    <div class="alert alert-<?= $class; ?>" role="alert">
        <p><?= $message; ?></p>
        <a href='../index.php'><button class="btn btn-success" type='button'>Home</button></a>
    </div>
</div>
<?php htmlend(); ?>
