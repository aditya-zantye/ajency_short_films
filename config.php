<?php 

$server_name = "localhost";
$user_name = "root";
$password = "";
$database = "short_films";

$conn = mysqli_connect($server_name,$user_name,$password,$database);

if(!$conn)
{
    die("Connection failed".mysqli_connect_error());
}
else
{
    //echo "DB connected successfully";
}



?>