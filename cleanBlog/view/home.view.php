<?php include('view/layout/nav.inc.php'); ?> 
<!-- pour relie la nav et header. les variable bg img et title_subtitle ont été deja defini avant dans home.model -->

<?php include('view/layout/header.inc.php'); ?> 


<!-- <?php
    // foreach ($data as $onedata){
    //     var_dump($onedata);
    // }
?> -->
<!-- Main Content-->
<div class="container px-4 px-lg-5">
    <div class="row gx-4 gx-lg-5 justify-content-center">
        <div class="col-md-10 col-lg-8 col-xl-7">

<!-- on crée une boucle qui va genere un post pour chaque tupe grace foreach, le tableau dans $data, un tupe pour $onedata -->
        <?php foreach ($data as $onedata){ ?>
<!-- ferme balise php car div etc est langage html et non php -->
            <!-- Post preview-->
            <div class="post-preview">
                <a href="post.php?article=<?= $onedata["post_ID"] ?>">
                    <h2 class="post-title"><?= $onedata['post_title'] ?></h2>
                </a>
                <img src=" <?= $onedata["post_img_url"] ?> " alt="" width="100%" >
<!-- dans balise php on prend la case qui nous interesse dans le tupe grace $onedata["la case que l'on veut"]   -->

                <p class="post-subtitle">
                    <?= $onedata["post_content"] ?>

                <!-- <?= substr($onedata["post_content"], 0 , 200) ?>  [...]  -->
                
                </p>
                <p class="post-meta">
                    Posted by
                    <a href="#"><?= $onedata["display_name"] ?></a>
                    <?= $onedata["post_date"] ?>
                    <br>
                    classé dans <b> <?= $onedata["cat_descr"] ?> </b>
                </p>
            </div>
            <!-- Divider-->
            <hr class="my-4" />
        
            <?php } ?>
<!-- on ferme la boucle foreach } qui est du php donc dans balise php -->

           
            <!-- Pager-->
            <div class="d-flex justify-content-end mb-4"><a class="btn btn-primary text-uppercase" href="#!">Older Posts →</a></div>
        </div>
    </div>
</div>

<?php include('view/layout/footer.inc.php'); ?>