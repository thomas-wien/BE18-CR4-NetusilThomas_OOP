<?php
require_once 'db_connect.php';
require_once 'file_upload.php';
require_once 'normalize.php';

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
    // $available = (isset($_POST['available'])) ?normalize($_POST['available']) : 1;
    $available = normalize($_POST['available']);

    $id = $_POST['id'];
    //variable for upload pictures errors is initialised
    $uploadError = '';

    $picture = file_upload($_FILES['picture']); //file_upload() called  
    if ($picture->error === 0) {
        ($_POST["picture"] == "product.png") ?: unlink("../pictures/$_POST[picture]");
        $sql = "UPDATE item SET title = ?, isbn = ?, short_description = ?, item_type = ?, author_first_name = ?, author_last_name = ?, publisher_name = ?, publisher_address = ?, publish_date = ?, available = ?, picture = ? WHERE id = ?";
        $stmt = $mysqli->prepare($sql);
        $stmt->bind_param("sssssssssssi", $title, $isbn, $short_description, $item_type, $author_first_name, $author_last_name, $publisher_name, $publisher_address, $publish_date, $available, $picture->fileName, $id);
    } else {
        $sql = "UPDATE item SET title = ?, isbn = ?, short_description = ?, item_type = ?, author_first_name = ?, author_last_name = ?, publisher_name = ?, publisher_address = ?, publish_date = ?, available = ? WHERE id = ?";
        $stmt = $mysqli->prepare($sql);
        $stmt->bind_param("ssssssssssi", $title, $isbn, $short_description, $item_type, $author_first_name, $author_last_name, $publisher_name, $publisher_address, $publish_date, $available, $id);
    }
    if ($stmt->execute()) {
        $class = "success";
        $message = "The record has been updated successfully";
        $uploadError = ($picture->error != 0) ? $picture->ErrorMessage : '';
    } else {
        $class = "danger";
        $message = "Error while updating record : <br>" . mysqli_connect_error();
        $uploadError = ($picture->error != 0) ? $picture->ErrorMessage : '';
    }
    $mysqli->close();
    header("location: ../index.php");
} else {
    header("location: ../error.php");
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