<?php include('view/layout/nav.inc.php'); ?>

<?php include('view/layout/header.inc.php'); ?> 

<!-- Post Content-->
<article class="mb-4">
    <div class="container px-4 px-lg-5">
        <div class="row gx-4 gx-lg-5 justify-content-center">
            <div class="col-md-10 col-lg-8 col-xl-7">
                <p>
                    <? echo $content; ?>
                </p>
            </div>
        </div>
    </div>
</article>

<?php include('view/layout/footer.inc.php'); ?>