SELECT di.dcd as "검사코드", di.dname as "검사명", d.amount as "검사금액"
FROM diagnosis d, disease di
WHERE d.dcd = di.dcd
