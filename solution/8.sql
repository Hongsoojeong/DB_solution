SELECT d.ddept, COUNT(d.ddept) AS de_count
FROM patient p
LEFT JOIN diagnosis d ON p.id = d.id
GROUP BY d.ddept;
