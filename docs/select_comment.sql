SELECT * FROM 
((SELECT user, content, created_on, news_id AS                                                                                                                                                                                                                                                                                                                                                post_id, ("news") AS type
FROM news_comments 
INNER JOIN comment 
ON news_comments.comment_id = comment.id)
UNION ALL
(SELECT user, content, created_on, article_id AS post_id , ("article") AS type
FROM article_comments 
INNER JOIN comment 
ON article_comments.comment_id = comment.id)) AS comment 
WHERE user = "jvthaashaar" ORDER BY created_on DESC;

