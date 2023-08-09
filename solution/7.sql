SELECT p.id, p.pname, COUNT(d.id) AS id_count
FROM patient p
LEFT JOIN diagnosis d ON p.id = d.id
GROUP BY p.id, p.pname
ORDER BY id_count DESC
LIMIT 10;
