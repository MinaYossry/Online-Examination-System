CREATE proc [dbo].[get_student_exam_q_with_answers] @Ex_ID int, @St_ID int
as
	begin try
		select Q.Q_Statement, EA.St_Answer, Q.Model_Answer
		from Exam_Answers EA inner join Questions Q
		on EA.Question_ID = Q.Question_ID
		where Ex_ID = @Ex_ID and St_ID = @St_ID
	end try
	begin catch
		select 'Error'
	end catch
GO

