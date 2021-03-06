USE [QuanLyDiem]
GO
/****** Object:  StoredProcedure [dbo].[Xoa_ThongTin]    Script Date: 7/2/2020 5:10:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[Xoa_ThongTin](@Ten NVARCHAR(50), @Diem FLOAT)
AS
BEGIN
	IF @Ten ='*'
	BEGIN
		DELETE StudentSubject 
		WHERE Mark < @Diem;
		DELETE Student WHERE Name = @Ten
		END
	
	ELSE
	BEGIN
		DELETE StudentSubject 
		WHERE  RN IN (SELECT st.RN FROM Student st
						 JOIN StudentSubject ss ON st.RN = ss.RN
						 WHERE st.Name = @Ten AND ss.Mark < @Diem);
		DELETE Student WHERE Name IN (SELECT st.Name FROM Student st
						 JOIN StudentSubject ss ON st.RN = ss.RN
						 WHERE st.Name = @Ten AND ss.Mark < @Diem)
	END
END