CREATE proc [dbo].[get_student_grades] @id int
as
	begin try
		select C.Crs_ID, C.Cr_Name, I.Ins_Name, SC.St_Grade
		from Stud_Course SC inner join Courses C
		on SC.Crs_ID = C.Crs_ID inner join Instructor I
		on SC.Instructor_ID = I.Ins_ID
		where St_ID = @id and SC.St_Grade is not null

	end try
	begin catch
	end catch
GO

