<?php
include('config.php');

//echo "<h1>Working</h1>";

$filter_array = array();
$filter_string = "";
$sort_string = "";
$where_filter_condition = "";

if(isset($_POST['genre']) && $_POST['genre'] != '')
{
    if($_POST['genre'] != '0')
    {
        array_push($filter_array,$_POST['genre']);
    }  
}

if(isset($_POST['language']) && $_POST['language'] != '')
{
    if($_POST['language'] != '0')
    {
        array_push($filter_array,$_POST['language']);
    }  
}

$filter_string = implode(',',$filter_array);

//echo $filter_string;

if(isset($_POST['sort_by']) && $_POST['sort_by'] != '')
{
    if($_POST['sort_by'] != '0')
    {
        $sort_condition = "";
        switch($_POST['sort_by'])
        {
            case '1': $sort_condition = "movie_length";break;
            case '2': $sort_condition = "movie_release_date";break;
            default:break;
        }
        $sort_string = " order by ".$sort_condition;
    }  
}

if($filter_string != '')
{
    $where_filter_condition = " where relationship.category_id in (".$filter_string.")";
}

$html = "";

$final_query = "select * from movies left join relationship on movies.id = relationship.movie_id left join movie_images on movies.featured_image = movie_images.id ".$where_filter_condition." group by movies.id ".$sort_string;
$final_res = mysqli_query($conn,$final_query);
while($row = mysqli_fetch_array($final_res))
{
    $html .= "  <li class='list-group-item d-flex justify-content-between align-items-center'>
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
    

</li>";
}

echo $html;

?>