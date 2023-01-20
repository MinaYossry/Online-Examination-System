CREATE proc [dbo].[get_exam_questions_with_choices] @Ex_ID int
as
	begin try

		declare @result table
		(Q_Type int,Q_ID int, Q_Code varchar(300), Q_Statement varchar(300), 
		[Answer-1] varchar(300), [Answer-2] varchar(300), 
		[Answer-3] varchar(300), [Answer-4] varchar(300))

		insert into @result
		select Q.Q_Type,Q.Question_ID, Q.Q_Code, Q.Q_Statement, QC.[Answer-1], QC.[Answer-2], QC.[Answer-3], QC.[Answer-4]
		from Exam_Questions EQ inner join Questions Q
		on EQ.Question_ID = Q.Question_ID inner join Question_Choices QC
		on Q.Question_ID = QC.Question_ID
		where EQ.Exam_ID = @Ex_ID and Q.Q_Type = 0

		insert into @result
		select Q.Q_Type,Q.Question_ID, Q.Q_Code, Q.Q_Statement, null, null, null, null
		from Exam_Questions EQ inner join Questions Q
		on EQ.Question_ID = Q.Question_ID
		where EQ.Exam_ID = @Ex_ID and Q.Q_Type = 1

		select ROW_NUMBER() OVER (ORDER BY (SELECT 1)) AS number,* from @result
	end try
	begin catch
		select 'Error'
	end catch
GO

