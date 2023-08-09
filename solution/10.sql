SELECT d.ddept, DATE_FORMAT(d.dtime, '%Y-%m') AS month, SUM(d.amount) AS total_amount
FROM patient p
LEFT JOIN diagnosis d ON p.id = d.id
WHERE d.dtime BETWEEN '2022-01-01' AND '2022-06-30'
GROUP BY d.ddept, month
ORDER BY d.ddept, month;

