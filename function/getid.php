<?php
session_start();

if (!isset($_SESSION['username'])) {
    header("Location: login.php");
    exit();
}

$username = $_SESSION['username'];

$query_user = "SELECT * FROM user WHERE username = '$username'";
$result_user = mysqli_query($conn, $query_user);

if ($result_user && mysqli_num_rows($result_user) > 0) {
    $row_user = mysqli_fetch_assoc($result_user);
    $id_user = $row_user['id_User'];
} else {
    echo "Data pengguna tidak ditemukan.";
    exit();
}