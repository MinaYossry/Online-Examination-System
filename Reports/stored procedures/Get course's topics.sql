CREATE PROC [dbo].[TopicInfo] @id INT
AS 
	BEGIN TRY
		SELECT Topic_ID, Topic_Name, Topic_Desc 
		FROM Topic t inner join Courses c
		ON c.Crs_ID = t.Crs_ID
		WHERE t.Crs_ID = @id
	END TRY

	BEGIN CATCH
		SELECT 'Error'
	END CATCH
GO

