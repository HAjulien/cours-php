-- page home

SELECT cat_descr ,post_content ,post_title , display_name , post_date
FROM blog_posts
INNER JOIN blog_users
ON post_author = ID
INNER JOIN blog_categories
ON post_category = cat_id