<?php
$servername = "localhost";
$database = "pinjamkendaraan";
$usernamedb = "root";
$password = "1912";

$conn = mysqli_connect($servername, $usernamedb, $password, $database);

if (!$conn) {
    die("Koneksi gagal: " . mysqli_connect_error());
} else {
}
?>