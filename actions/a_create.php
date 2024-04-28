<?php
require_once 'db_connect.php';
require_once 'file_upload.php';
require_once 'normalize.php';
require_once '../inc/htmlhelper.php';

// Function to normalize and validate inputs
function validateInput($input)
{
    return isset($_POST[$input]) ? normalize($_POST[$input]) : "";
}

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    // Normalize and validate inputs
    $title = validateInput('title');
    $isbn = validateInput('isbn');
    $short_description = validateInput('short_description');
    $item_type = (isset($_POST['item_type']) && $_POST['item_type'] != "Item Type") ? normalize($_POST['item_type']) : "BOOK";
    $author_first_name = validateInput('author_first_name');
    $author_last_name = validateInput('author_last_name');
    $publisher_name = validateInput('publisher_name');
    $publisher_address = validateInput('publisher_address');
    $publish_date = validateInput('publish_date');
    $available = isset($_POST['available']) ? normalize($_POST['available']) : 1;
    $picture = file_upload($_FILES['picture']);

    // Begin transaction
    $mysqli->begin_transaction();

    // Prepare SQL statement
    $sql = "INSERT INTO item (title, isbn, short_description, item_type, author_first_name, author_last_name, publisher_name, publisher_address, publish_date, available, picture) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    $stmt = $mysqli->prepare($sql);

    // Bind parameters and execute statement
    $stmt->bind_param("ssssssssssi", $title, $isbn, $short_description, $item_type, $author_first_name, $author_last_name, $publisher_name, $publisher_address, $publish_date, $available, $picture->fileName);
    $stmt->execute();

    // Check for errors and commit transaction
    if ($stmt->errno) {
        $mysqli->rollback(); // Rollback on error
        $class = "danger";
        $message = "Error while creating record: " . $stmt->error;
    } else {
        $mysqli->commit(); // Commit on success
        $uploadError = ($picture->error != 0) ? $picture->ErrorMessage : '';
        header("Location: ../index.php");
    }

    // Close statement and connection
    $stmt->close();
    $mysqli->close();
} else {
    header("location: ../error.php");
}
?>

<?php
head(" | Create Item"); ?>
<div class="container">
    <div class="mt-3 mb-3">
        <h1>Create request response</h1>
    </div>
    <div class="alert alert-<?= $class; ?>" role="alert">
        <p><?php echo ($message) ?? ''; ?></p>
        <p><?php echo ($uploadError) ?? ''; ?></p>
        <a href='../index.php'><button class="btn btn-primary" type='button'>Home</button></a>
    </div>
</div>
<?php htmlend(); ?>