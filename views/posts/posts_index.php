<?php
if(!empty($posts)) foreach ($posts as $post ): ?>

<div class="span8">

    <h1><a href="<?=BASE_URL?>posts/view/<?=$post['post_id']?>"><?=$post['post_subject']?></a></h1>
    <p><?=$post['post_text']?></p>
    <div>
        <span class="badge badge-success"><?=$post['post_created']?></span><div class="pull-right"><span class="label">By <?=$post['post_id']?></span></div>
    </div>


</div>
<?php endforeach; ?>



<?php
$_tags = get_all("SELECT * FROM post_tags NATURAL JOIN tag");
foreach ($_tags as $tag) {
    $this->tags[$tag['post_id']][] = $tag['$tag_name'];
}
?>

<?php
if (!empty($tags))foreach ($tags[$post['post_id']] as $tag):?>
    <a href="#"<span class="label" style="background-color: #5bc0de"><?=$tag?></span></a>

<? endforeach?>









