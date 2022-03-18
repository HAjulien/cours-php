        <?php include('model/post1.model.php'); ?>

        <?php include('nav.inc.php'); ?>

        <?php include('header.inc.php'); ?> 

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

        <?php include('footer.inc.php'); ?>
