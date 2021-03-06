<div class="list-group">
    <a href="#" class="list-group-item active"><?=$this->params[0]?></a>
    <?foreach ($posts as $post):?>
        <div class="list-group-item">
            <div class="span8">
                <h1><a href="<?=BASE_URL?>posts/view/<?=$post['post_id']?>"><?=$post["post_subject"]?></a></h1>
                <p><?=$post["post_text"]?></p>
                <div>
                    <span class="badge badge-success">Posted <?=$post["post_created"]?></span>
                    <span class="badge badge-success">By <?=$post["username"]?></span>
                    <div class="pull-right">
                        <?if(!empty($users)) foreach ($users[$post['post_id']] as $user):?>
                            <a href="#"><span class = "label" style="background-color: #5bc0de"><?=$user?></span></a>
                        <?endforeach?>


                    </div>
                </div>
                <hr>
    <?endforeach?>
</div>