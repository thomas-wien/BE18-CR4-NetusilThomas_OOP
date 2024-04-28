<?php
require_once 'db_connect.php';
require_once 'file_upload.php';
require_once 'normalize.php';

// Function to normalize and validate inputs
function validateInput($input)
{
    return isset($_POST[$input]) ? normalize($_POST[$input]) : "";
}

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    // Sanitize and validate inputs
    $id = isset($_POST['id']) ? intval($_POST['id']) : 0; // Ensure that $id is an integer
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

    // Initialize variable for upload picture errors
    $uploadError = '';

    // Get picture file details
    $picture = file_upload($_FILES['picture']);

    // Prepare SQL statement to update item
    if ($picture->error === 0) {
        // If picture upload is successful, delete previous picture if it's not the default one
        if ($_POST["picture"] != "product.png") {
            unlink("../pictures/$_POST[picture]");
        }
        $sql = "UPDATE item SET title = ?, isbn = ?, short_description = ?, item_type = ?, author_first_name = ?, author_last_name = ?, publisher_name = ?, publisher_address = ?, publish_date = ?, available = ?, picture = ? WHERE id = ?";
        $stmt = $mysqli->prepare($sql);
        $stmt->bind_param("sssssssssssi", $title, $isbn, $short_description, $item_type, $author_first_name, $author_last_name, $publisher_name, $publisher_address, $publish_date, $available, $picture->fileName, $id);
    } else {
        // If picture upload fails, update item without changing the picture
        $sql = "UPDATE item SET title = ?, isbn = ?, short_description = ?, item_type = ?, author_first_name = ?, author_last_name = ?, publisher_name = ?, publisher_address = ?, publish_date = ?, available = ? WHERE id = ?";
        $stmt = $mysqli->prepare($sql);
        $stmt->bind_param("ssssssssssi", $title, $isbn, $short_description, $item_type, $author_first_name, $author_last_name, $publisher_name, $publisher_address, $publish_date, $available, $id);
    }

    // Execute the statement
    if ($stmt->execute()) {
        $class = "success";
        $message = "The record has been updated successfully";
        $uploadError = ($picture->error != 0) ? $picture->ErrorMessage : '';
    } else {
        $class = "danger";
        $message = "Error while updating record: <br>" . $mysqli->error;
        $uploadError = ($picture->error != 0) ? $picture->ErrorMessage : '';
    }

    // Close the database connection
    $stmt->close();
    $mysqli->close();

    // Redirect to the index page
    header("location: ../index.php");
    exit(); // Stop further execution
} else {
    // Redirect to error page if POST data is not received
    header("location: ../error.php");
    exit(); // Stop further execution
}
?>

<?php require_once 'components/htmlhelper.php';
head(" | Update"); ?>

<div class="container">
    <div class="mt-3 mb-3">
        <h1>Updating request response</h1>
    </div>
    <div class="alert alert-<?php echo $class; ?>" role="alert">
        <p><?php echo ($message) ?? ''; ?></p>
        <p><?php echo ($uploadError) ?? ''; ?></p>
        <a href='../update.php?id=<?= $id; ?>'><button class="btn btn-warning" type='button'>Back</button></a>
        <a href='../index.php'><button class="btn btn-success" type='button'>Home</button></a>
    </div>
</div>
<?php htmlend(); ?>
