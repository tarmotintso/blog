<div class="list-group">
    <a href="#" class="list-group-item"><?this->params[0]?></a>
        <?foreach ($posts as $post):?>

    <div class="span8">
        <h1><a href="<?=BASE_URL?>posts/view/<?=$post['post_id']?>"><?=$post['post_subject']?></a></h1>
        <p><?=$post['post_text']?></p>

        <div>
                <span class="badge badge-success">Posted <?=$post["post_created"]?> by <?=$post["username"]?>
                </span><div class="pull-right"><span class="label">By <?=$post['post_id']?></span><?php
                if (!empty($tags))foreach ($tags[$post['post_id']] as $tag):?>
                    <a href="#"<span class="label" style="background-color: #5bc0de"><?=$tag?></span></a>

<? endforeach?>
    </div>


            <? endforeach?>