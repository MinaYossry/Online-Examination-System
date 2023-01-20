CREATE PROC  [dbo].[InstructorCourses]    @id INT
AS
	BEGIN TRY

		SELECT c.Cr_Name , count(sc.st_id) as 'Number of Student'
		FROM Instructor i inner join Ins_Crs ic 
		ON ic.Instructor_ID = i.ins_id
		inner join Courses c
		ON c.Crs_ID = ic. Crs_ID
		inner join Stud_Course sc
		on sc.Instructor_ID = i.Ins_ID and sc.Crs_ID = ic.Crs_ID
		WHERE i.Ins_ID= @id
		group by c.Cr_Name, sc.crs_id

	END TRY

	BEGIN CATCH
		SELECT 'Error'
	END CATCH
GO

