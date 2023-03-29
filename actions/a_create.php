<?php
require_once 'db_connect.php';
require_once 'file_upload.php';
require_once 'normalize.php';
require_once '../inc/htmlhelper.php';

// session_start();
// logged_in();

if ($_POST) {
    $title = (isset($_POST['title'])) ? normalize($_POST['title']) : "";
    $isbn = (isset($_POST['isbn'])) ? normalize($_POST['isbn']) : "";
    $short_description = (isset($_POST['short_description'])) ? normalize($_POST['short_description']) : "";
    $item_type = ((isset($_POST['item_type'])) && $_POST['item_type'] != "Item Type") ? normalize($_POST['item_type']) : "BOOK";
    $author_first_name = (isset($_POST['author_first_name'])) ? normalize($_POST['author_first_name']) : "";
    $author_last_name = (isset($_POST['author_last_name'])) ? normalize($_POST['author_last_name']) : "";
    $publisher_name = (isset($_POST['publisher_name'])) ? normalize($_POST['publisher_name']) : "";
    $publisher_address = (isset($_POST['publisher_address'])) ? normalize($_POST['publisher_address']) : "";
    $publish_date = (isset($_POST['publish_date'])) ? normalize($_POST['publish_date']) : "2000-01-01";
    $available = (isset($_POST['available'])) ? normalize($_POST['available']) : 1;
    // $picture = (isset($_POST['picture'])) ? normalize($_POST['picture']) : "product.png";
    $uploadError = '';
    $picture = file_upload($_FILES['picture']);

    // $sql = "INSERT INTO item (title, isbn, short_description, item_type, author_first_name, author_last_name, publisher_name, publisher_address, publish_date, available, picture) VALUES ('$title', '$isbn', '$short_description', '$item_type', '$author_first_name', '$author_last_name', '$publisher_name', '$publisher_address', '$publish_date', '$available', '$picture->fileName')";
    $sql = "INSERT INTO item (title, isbn, short_description, item_type, author_first_name, author_last_name, publisher_name, publisher_address, publish_date, available, picture) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

    $stmt = $mysqli->prepare($sql);
    $stmt->bind_param("sssssssssss", $title, $isbn, $short_description, $item_type, $author_first_name, $author_last_name, $publisher_name, $publisher_address, $publish_date, $available, $picture->fileName);


    // if (mysqli_query($connect, $sql) === true) {
    if ($stmt->execute()) {
        $uploadError = ($picture->error != 0) ? $picture->ErrorMessage : '';
        header("Location: ../index.php");
    } else {
        $class = "danger";
        $message = "Error while creating record. Try again: <br>" . $connect->error;
        $uploadError = ($picture->error != 0) ? $picture->ErrorMessage : '';
    }
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