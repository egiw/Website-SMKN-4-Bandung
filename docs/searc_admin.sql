ALTER VIEW search_admin AS
SELECT id, title, created_on, created_by, 'article' AS type FROM article
UNION ALL SELECT id, title, created_on, created_by, 'news' AS type FROM news
UNION ALL SELECT id, title, created_on, created_by, 'event' AS type FROM event
UNION ALL SELECT id, CONCAT(title, ' di ',company) AS title, created_on, created_by, 'jobs' AS type FROM jobs
UNION ALL SELECT id, title, created_on, created_by, 'mading' AS type FROM mading
UNION ALL SELECT id, title, created_on, created_by, 'highlight' AS type FROM highlight
UNION ALL SELECT id, CONCAT(name, '(', category,')') as title, created_on, created_by, 'prakerin' AS type FROM prakerin;

