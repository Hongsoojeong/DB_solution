SELECT s.scd, s.sname, company, medic_amount, pack, ingredient
FROM medicine m
JOIN script s ON s.scd = m.scd
WHERE m.medic_amount <> '';
