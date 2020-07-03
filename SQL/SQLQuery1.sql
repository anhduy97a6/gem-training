USE QuanLyDiem;
GO
ALTER TRIGGER tgTop3 ON StudentSubject AFTER UPDATE AS
BEGIN 
	
	

	UPDATE Top3
	SET Name = (SELECT st.Name FROM StudentSubject ss JOIN Student st ON ss.RN = st.RN
				WHERE ss.Mark = (SELECT MAX(Mark) FROM StudentSubject)),
	Mark = (SELECT MAX(Mark) FROM StudentSubject),
	Date = (SELECT Date FROM StudentSubject 
				WHERE Mark = (SELECT MAX(Mark) FROM StudentSubject)),
	sName = (SELECT sj.sName FROM StudentSubject ss JOIN Subject sj ON ss.sID = sj.sID
				WHERE ss.Mark = (SELECT MAX(Mark) FROM StudentSubject))
	WHERE Rank = 1;
	


	
END





UPDATE StudentSubject 
SET Mark = 9
WHERE Mark = 10



