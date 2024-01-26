<?php


require './function/koneksi.php';
require './function/getid.php';

$query = "SELECT user.id_User, user.username, profil.nama, profil.nik, profil.jenis_Kelamin, profil.tanggal_Lahir, profil.email, profil.no_Hp, user.level
FROM user LEFT JOIN profil ON user.id_User = profil.id_User WHERE profil.id_User = $id_user;";
$result = mysqli_query($conn, $query);
$row = mysqli_fetch_assoc($result);



if (isset($_GET['id'])) {
    $id_kendaraan = $_GET['id'];

    $query_kendaraan = "SELECT * FROM kendaraan WHERE id_Kendaraan = $id_kendaraan";
    $result_kendaraan = mysqli_query($conn, $query_kendaraan);

    if ($result_kendaraan && mysqli_num_rows($result_kendaraan) > 0) {
        $row_kendaraan = mysqli_fetch_assoc($result_kendaraan);

        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            // ...
        }
    } else {
        echo "Data kendaraan tidak ditemukan.";
    }
} else {
    echo "Parameter 'id' tidak ditemukan pada URL.";
}

//untuk gambar
if (isset($_FILES['gambar'])) {
    $gambar = $_FILES['gambar'];

    $namaFile = $gambar['name'];
    $ukuranFile = $gambar['size'];
    $error = $gambar['error'];
    $tmpName = $gambar['tmp_name'];

    if ($error === 0) {
        $folderTujuan = 'uploaded/Dokumenpendukung/';

        $namaFileBaru = uniqid() . '_' . $namaFile;

        $pathFile = $folderTujuan . $namaFileBaru;

        move_uploaded_file($tmpName, $pathFile);

        echo "Gambar berhasil diupload.";
    } else {
        echo "Error saat upload gambar.";   
    }
}




if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $status_pinjaman = $row_kendaraan['status_Kendaraan'];
    if ($status_pinjaman === '1') {
        $alasan = $_POST["alasan"];
        // $dokumen = $_POST["dokumen"];
        $waktu = $_POST["waktu"];
        $tanggal_Pengajuan
            = date("Y-m-d");


        // Lakukan sanitasi data
        $alasan = htmlspecialchars($alasan);
        // $dokumen = htmlspecialchars($dokumen);

        // Query menyimpan data peminjaman
        $query_peminjaman = "INSERT INTO peminjaman (id_Peminjaman, id_Profil, id_Kendaraan, alasan, dokumen_Pendukung, waktu, tanggal_Pengajuan
        , tanggal_Dikonfirmasi, status_Peminjaman) 
                            VALUES ('', $id_user, $id_kendaraan, '$alasan', '$pathFile', $waktu, '$tanggal_Pengajuan
                            ', '', 1)";

        $result_peminjaman = mysqli_query($conn, $query_peminjaman);

        if ($result_peminjaman) {
            echo "<script>
            alert('Pengajuan berhasil');
            window.location.href = 'pinjaman.php';
        </script>";
        } else {
            echo "Gagal mengajukan peminjaman.";
        }
    } else {
        echo "Maaf, kendaraan ini sedang tidak tersedia untuk dipinjam.";
    }
}
?>




<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pengajuan Peminjaman</title>
    <link rel="stylesheet" href="./css/pengajuan.css">
</head>

<body>

<?php
    if ($row['nama'] != true) {
        echo ('<script>
    window.location="form_profil.php"
    </script>');
    } else { ?>


    <div class="box">   
        <a href="daftar_kendaraan.php"><img src="./img/arrow-left-circle.svg" alt=""></a>

        <br>
        <br>
        <h1>Form Pengajuan Peminjaman</h1>


        <div style="text-align: center;">
            <?php $tanggal_Pengajuan = date("Y-m-d");
            echo ($tanggal_Pengajuan);
            ?>
        </div>

        <h3>Informasi kendaraan</h3>

        <div class="imgkendaraan">
            <img src="<?= $row_kendaraan["foto"] ?>" alt="">
        </div>

        <table>
            <tr>
                <td>Kendaraan</td>
                <td>: <?= $row_kendaraan["jenis"]; ?></td>
            </tr>
            <tr>
                <td>Merek</td>
                <td>: <?= $row_kendaraan["merek"]; ?></td>
            </tr>
            <tr>
                <td>Tipe</td>
                <td>: <?= $row_kendaraan["tipe"]; ?></td>
            </tr>
            <tr>
                <td>Plat Nomor </td>
                <td>: <?= $row_kendaraan["plat_Nomor"]; ?></td>
            </tr>

        </table>

        <br>
        <hr>
        <br>

        <form action="" method="post" enctype="multipart/form-data">
            <label for="alasan">Alasan Peminjaman:</label>
            <textarea name="alasan" id="" cols="30" rows="3" class="alasan"></textarea>
            <br>

            <label for="waktu">Waktu Peminjaman: (hari)</label>
            <select name="waktu" id="" class="waktu">
                <option value="1">1 Hari</option>
                <option value="2">2 Hari</option>
                <option value="3">3 Hari</option>
                <option value="4">4 Hari</option>
                <option value="5">5 Hari</option>
                <option value="6">6 Hari</option>
                <option value="7">7 Hari</option>
            </select>
            <br>

            <label for="gambar">Dokumen pendukung:</label>
            <input type="file" name="gambar" id="gambar" class="file">
            <br>

            <button type="submit" value="Upload">Konfirmasi</button>
        </form>

    </div>
    <?php } ?>

</body>

</html>