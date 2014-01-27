<?php
/**
 * Created by PhpStorm.
 * User: Tarmo
 * Date: 26.01.14
 * Time: 19:43
 */

class users extends Controller{

    function index()
    {
        $this->users = get_all("SELECT * FROM user"
        );
    }


} 