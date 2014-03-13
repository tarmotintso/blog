<?php
/**
 * Created by PhpStorm.
 * User: Tarmo
 * Date: 26.01.14
 * Time: 19:43
 */

class users extends Controller{
    /*
        function index()
        {
            $this->users = get_all("SELECT * FROM user"
            );
        }
    */
    function index()
    {
        $this->users = get_all("SELECT username, COUNT(post_id) AS count
                                   FROM post_tags NATURAL JOIN user
                                   GROUP BY user_id"
        );
    }
    function view(){
        if (!empty($this->params[0])) {
            $username = $this->params[0];
        }
        /*$user_id = get_one("SELECT user_id FROM user WHERE username='$username'");*/
        /**$this->post = get_one("SELECT username, user_id FROM user WHERE username='$username'");**/
        /*$this->post = get_one("SELECT user_id FROM user WHERE username='$username'");*/
        /**$this->post = get_one("SELECT post_id, post_subject FROM post NATURAL JOIN user ON post.user_id = user.user_id WHERE post.user_id='$user_id'");**/

        /**
        $this->posts = get_all("SELECT * FROM post_tags NATURAL JOIN post, user WHERE user_id='$user_id'");
        $post_id = $this->params[0];
        $this->post = get_one("SELECT * FROM post NATURAL JOIN user WHERE post_id='$post_id'");
        $this->tags = get_all("SELECT * FROM post_tags NATURAL JOIN tag WHERE post_id='$post_id'");

        $_users = get_all("SELECT * FROM post_tags NATURAL JOIN user");
        foreach ($_users as $user) {
            $this->users[$user['post_id']][] = $user['username'];
        }
        **/
    }
} 