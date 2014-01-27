
    <div class="span8">
        <h1><?=$post['post_subject']?></h1>
        <p><?=$post['post_text']?></p>
        <div>
            <span class="badge badge-success">Posted <?=$post["post_created"]?> by <?=$post["username"]?> </span> </span><div class="pull-right"><span class="label">alice</span> <span class="label">story</span> <span class="label">blog</span> <span class="label">personal</span></div>

    </div>

    <?foreach ($tags as $tag):?><a href="#"><span class="label-info"><?=$tag['tag_name']?></span></a><?endforeach?>

        <?foreach($comments as $comment):?>
            <div class="media">
                <a class="pull-left" href="#">
                    <img class="media-object" src="..." alt="...">
                </a>
                <div class="media-body">
                    <h4 class="media-heading"><?=$post["username"]?></h4>
                    <?=$comment["comment_text"]?>
                </div>
            </div>
        <?endforeach?>




