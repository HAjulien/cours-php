<?php include('view/layout/nav.inc.php'); ?>

<?php include('view/layout/header.inc.php'); ?> 

        <?php foreach ($data as $onedata){ ?>

            <div class="card w-75 mx-auto">
                <div class="card-header text-center ">
                    <span class="px-5"> Nom : <?= $onedata["contact_name"] ?> </span>
                    id : <?= $onedata["contact_ID"] ?>
                </div>
                <div class="card-body">
                    <div class="card-title  text-center	">
                        <span class="px-5"> telephone:  <?= $onedata["contact_phone"] ?> </span>
                        <span> email: <?= $onedata["contact_email"] ?> </span>
                    </div>
                    <p class="card-text text-center	"> Message:  <?= $onedata["contact_message"] ?></p>
                </div>
            </div>
            

        <?php } ?>

    

    <?php include('view/layout/footer.inc.php'); ?>


    