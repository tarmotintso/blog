<?php
/**
 * Created by PhpStorm.
 * User: Tarmo
 * Date: 26.01.14
 * Time: 19:43
 */

class tags extends Controller{

    function index()
    {
        $this->tags = get_all("SELECT tag_name, COUNT(post_id) AS count
                                   FROM post_tags NATURAL JOIN tag
                                   GROUP BY tag_id"
        );
    }


} 