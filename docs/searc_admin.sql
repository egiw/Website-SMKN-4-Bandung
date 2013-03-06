ALTER VIEW search_admin AS
SELECT id, title, created_on, 'article' AS type FROM article
UNION ALL SELECT id, title, created_on, 'news' AS type FROM news
UNION ALL SELECT id, title, created_on, 'event' AS type FROM event
UNION ALL SELECT id, CONCAT(title, ' di ',company) AS title, created_on, 'jobs' AS type FROM jobs
UNION ALL SELECT id, title, created_on, 'mading' AS type FROM mading
UNION ALL SELECT id, title, created_on, 'highlight' AS type FROM highlight
UNION ALL SELECT id, CONCAT(name, '(', category,')') as title, created_on, 'prakerin' AS type FROM prakerin;

