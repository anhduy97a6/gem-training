SELECT TOP(2) Mark FROM StudentSubject 
WHERE Mark NOT IN (SELECT MAX(Mark) FROM StudentSubject)
ORDER BY Mark DESC
