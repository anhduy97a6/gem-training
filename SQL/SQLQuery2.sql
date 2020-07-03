SELECT st.Name FROM Student st JOIN StudentSubject ss ON st.RN = ss.RN
WHERE ss.Mark >5
GROUP BY st.Name
HAVING AVG(ss.Mark) > 6.5