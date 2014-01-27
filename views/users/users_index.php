

<div class="list-group">
    <?foreach ($users as $user ):?>

        <a href="<?=BASE_URL?>users/view/<?=$user['username']?>" class="list-group-item"><?=$user['username']?></a>

    <? endforeach?>
</div>


