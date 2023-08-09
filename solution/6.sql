DELIMITER //
CREATE FUNCTION FN_GET_AGE_WITH_GROUP(IN_BIRTH_DAY DATE, IN_AGE_TYPE CHAR(1)) RETURNS VARCHAR(20)
BEGIN
    DECLARE V_AGE_GROUP VARCHAR(20);
    DECLARE V_AGE_VAL INTEGER;

    -- 만나이 계산
    IF IN_AGE_TYPE = '1' THEN
		SELECT TIMESTAMPDIFF(YEAR, IN_BIRTH_DAY, CURDATE())            
            INTO V_AGE_VAL;
            
        SET V_AGE_GROUP = CASE
            WHEN V_AGE_VAL < 10 THEN '10대 미만'
            WHEN V_AGE_VAL >= 10 AND V_AGE_VAL < 20 THEN '10대'
            WHEN V_AGE_VAL >= 20 AND V_AGE_VAL < 30 THEN '20대'
            WHEN V_AGE_VAL >= 30 AND V_AGE_VAL < 40 THEN '30대'
            WHEN V_AGE_VAL >= 40 AND V_AGE_VAL < 50 THEN '40대'
            WHEN V_AGE_VAL >= 50 AND V_AGE_VAL < 60 THEN '50대'
            WHEN V_AGE_VAL >= 60 AND V_AGE_VAL < 70 THEN '60대'
            WHEN V_AGE_VAL >= 70 AND V_AGE_VAL < 80 THEN '70대'
            ELSE '70대 이상'
        END;
    END IF;    
	    
    RETURN V_AGE_GROUP;
END //
DELIMITER ;



SELECT d.ddept, FN_GET_AGE_WITH_GROUP(p.birth, '1') AS age_group, p.sex, COUNT(*) AS patient_count
FROM diagnosis d
JOIN patient p ON p.id = d.id
GROUP BY d.ddept, age_group, p.sex
order by d.ddept;
