SELECT name, count 
FROM (
    SELECT COUNT(d.ddept) AS count, d.ddept as name
    FROM diagnosis d
    GROUP BY d.ddept
) subquery1
UNION ALL
SELECT name, count
FROM (
    SELECT COUNT(m.company) AS count, m.company as name
    FROM script s
    JOIN medicine m ON s.scd = m.scd
    JOIN disease di ON s.dcd = di.dcd
    JOIN diagnosis d ON s.dcd = d.dcd
    GROUP BY m.company
) subquery2;
