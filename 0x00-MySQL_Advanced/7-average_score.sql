DELIMITER //

CREATE PROCEDURE ComputeAverageScoreForUser(IN user_id_param INT)
BEGIN
    DECLARE total_score FLOAT;
    DECLARE number_of_scores INT;

    SELECT SUM(score), COUNT(*) INTO total_score, number_of_scores
    FROM corrections
    WHERE user_id = user_id_param;

    IF number_of_scores > 0 THEN
        UPDATE users
        SET average_score = total_score / number_of_scores
        WHERE id = user_id_param;
    END IF;
END //

DELIMITER ;
