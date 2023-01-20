CREATE PROC  [dbo].[get_students_info_by_dept]  @id INT
AS
	BEGIN TRY
		SELECT * 
		FROM Student
		WHERE Dept_ID = @id
	END TRY

	BEGIN CATCH
		SELECT 'Error'
	END CATCH
GO

