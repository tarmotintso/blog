
    <div class="span8">
        <h1><?=$post['post_subject']?></h1>
        <p><?=$post['post_text']?></p>
        <div>
            <span class="badge badge-success">Posted <?=$post["post_created"]?> by <?=$post["username"]?>
        </div>

    </div>
    <!--
    <a href="<?=BASE_URL?>tags/view/<?=$tag['tag_name']?>" class="list-group-item"><?=$tag['tag_name']?></a>
    -->
    <?foreach ($tags as $tag):?><a href="<?=BASE_URL?>tags/view/<?=$tag['tag_name']?>"><span class="label-info" style="background-color: #5bc0de"><?=$tag['tag_name']?></span></a><?endforeach?>

        <?foreach($comments as $comment):?>
        <div class="media">
            <a class="pull-left" href="#"></a>
            <div class="media-body">
                <h4 class="media-heading"><?=$post["username"]?></h4><?=$comment["comment_text"]?>
            </div>
        </div>
    <?endforeach?>




