<?php 
include('config.php');
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Short Film</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<style>
    body{
  padding: 2rem 0rem;
}
.image-parent {
  max-width: 40px;
}
</style>

<body>

<div class="page-header">
  <h1 align='center'>Short Film Window</h1>
</div>

<div class="container">

    <form action="#">

        <!--FILTER CONDITIONS START-->

        <div class="row">
            <div class="col-md-6 form-group">
                <label for="genre">Genre:</label>
                <select class="form-control ajax_select" name="genre" id="genre">
                    <option value='0'>All</option>
                    <?php 
                        $get_genre_query = "select * from category where category.type = 'Genre'";
                        $res_genre = mysqli_query($conn,$get_genre_query) or die(mysqli_error($conn));
                        while($row = mysqli_fetch_array($res_genre))
                        {
                            echo "<option value='".$row['id']."'>".$row['value']."</option>";
                        }
                    ?>
                </select>
            </div>
            <div class="col-md-6 form-group">
                <label for="language">Language:</label>
                <select class="form-control ajax_select" name="language" id="language">
                    <option value='0'>All</option>
                    <?php 
                        $get_lang_query = "select * from category where category.type = 'Language'";
                        $res_lang = mysqli_query($conn,$get_lang_query) or die(mysqli_error($conn));
                        while($row = mysqli_fetch_array($res_lang))
                        {
                            echo "<option value='".$row['id']."'>".$row['value']."</option>";
                        }
                    ?>
                </select>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4 form-group"></div>
            <div class="col-md-4 form-group">
                <label for="sort_by">Sort By:</label>
                <select class="form-control ajax_select" name="sort_by" id="sort_by">
                    <option value='0'>All</option>
                    <option value='1'>Duration</option>
                    <option value='2'>Released Date</option>
                </select>
            </div>
            <div class="col-md-4 form-group"></div>
        </div>

        <!--FILTER CONDITIONS END-->

        <?php

        if(isset($_GET['page_no']) && $_GET['page_no']!='')
        {
            $page_no = $_GET['page_no'];
        }
        else
        {
            $page_no = 1;
        }

        $total_records_per_page = 5; //To show 10 movies on a single page.

        $offset = ($page_no-1) * $total_records_per_page;
        $previous_page = $page_no - 1;
        $next_page = $page_no + 1;
        $adjacents = "2";

        $get_movies_count_query = "select count(*) as total_movies from movies";
        $res_movies_count = mysqli_query($conn,$get_movies_count_query) or die( mysqli_error($conn));

        while($row = mysqli_fetch_array($res_movies_count))
        {
            $total_movies = $row['total_movies'];
        }      
        $total_number_of_movies = ceil($total_movies / $total_records_per_page); // Round up function
        $second_last_page = $total_number_of_movies - 1;

        ?>

        <ul class="list-group" id="movie_list" name="movie_list">
        <?php
                
                $get_movies_query = "select * from movies left join movie_images on movies.featured_image = movie_images.id limit ".$offset.",".$total_records_per_page;
                $get_movies_result = mysqli_query($conn,$get_movies_query) or die(mysqli_error($conn));
                while($row = mysqli_fetch_array($get_movies_result))
                {
                    echo "
                    <li class='list-group-item d-flex justify-content-between align-items-center'>
                        <div class='row'>
                            <div class='col-md-4'>
                                <img src='".$row['movie_image_path']."' class='img-fluid' alt='Image Unavailable' width='300' height='300'>
                            </div>
                            <div class='col-md-4'>
                            <h2>".$row['title']."</h2>
                            </div>
                            <div class='col-md-4'>
                                <h3>".$row['description']."</h3>
                                <h5>Released: ".$row['movie_release_date']."</h5>
                                <h6>Duration: ".$row['movie_length']." minutes</h6>
                            </div>
                        </div>
                        

                    </li>
                    ";
                }
        ?>
        </ul>

        

        <div style='padding: 10px 20px 0px; border-top: dotted 1px #CCC;'>
            <strong>Page <?php echo $page_no." of ".$total_number_of_movies; ?></strong>
        </div>

        <ul class="pagination">
        <?php
            if ($total_number_of_movies <= 10)
            {  	 
	            for ($counter = 1; $counter <= $total_number_of_movies; $counter++)
                {
	                if ($counter == $page_no) 
                    {
	                    echo "<li class='active'><a>$counter</a></li>";	
	                }
                    else
                    {
                        echo "<li><a href='?page_no=$counter'>$counter</a></li>";
                    }
                }
            }

        ?>
            
        </ul>
    </form>
</div>

</body>

<script>
    $(document).ready(function(){

        $(".ajax_select").on('change', function(){
            var genre_val = $("#genre").val();
            var lang_val = $("#language").val();
            var sort_by = $("#sort_by").val();

            $.ajax({
                type:"POST",
                url:"ajax_combo.php",
                cache: false,
                data: "&genre="+genre_val+"&language="+lang_val+"&sort_by="+sort_by,
                success: function(response){
                    $("#movie_list").html(response);
                }
            });
        });

    });
</script>

</html>

