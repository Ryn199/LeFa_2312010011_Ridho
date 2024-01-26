<?php


require './function/koneksi.php';
require './function/getid.php';

$query = "SELECT user.id_User, user.username, profil.nama, profil.nik, profil.jenis_Kelamin, profil.tanggal_Lahir, profil.email, profil.no_Hp, user.level
FROM user LEFT JOIN profil ON user.id_User = profil.id_User WHERE profil.id_User = $id_user;";
$result = mysqli_query($conn, $query);
$row = mysqli_fetch_assoc($result);

    if ($row['nama'] != true) {
        echo ('<script>
    window.location="form_profil.php"
    </script>');
    }

?>