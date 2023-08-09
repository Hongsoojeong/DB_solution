SELECT d.dcd, s.sname, COUNT(d.ddept) AS dept_count
FROM diagnosis d
JOIN script s ON d.dcd = s.dcd
GROUP BY d.dcd, s.sname
HAVING dept_count = (
    SELECT MAX(dept_count)
    FROM (
        SELECT d.dcd, s.sname, COUNT(d.ddept) AS dept_count
        FROM diagnosis d
        JOIN script s ON d.dcd = s.dcd
        GROUP BY d.dcd, s.sname
    ) subquery
);
