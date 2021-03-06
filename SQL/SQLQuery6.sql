USE QuanLyDiem;
GO
CREATE VIEW StudentInfo AS
SELECT ss.RN, ss.sID, st.Name,st.Gender (
										CASE st.Gender
											WHEN 0 THEN 'Male'
											WHEN 1 THEN 'Femal'
											ELSE 'Unknown'
										END) AS GenDer, sj.sName, ss.Mark, ss.Date
FROM Student st JOIN StudentSubject ss ON st.RN = ss.RN
				JOIN Subject sj ON ss.sID = sj.sID