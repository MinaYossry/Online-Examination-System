CREATE proc [dbo].[exam_correction]
	@Ex_ID int, @St_ID int
as
begin
	begin try
		IF (@Ex_ID IS NULL OR @St_ID IS NULL )
            RAISERROR('Ex_ID, St_ID', 16, 1)
		ELSE
			declare @grade int, @total int
			set @grade = 0
			set @total = 0

			declare @Crs_ID int
			select distinct @Crs_ID = Crs_ID
			from Exam_Questions EQ inner join Exam E 
			on EQ.Exam_ID = E.Ex_ID inner join Questions Q
			on EQ.Question_ID = Q.Question_ID
			where E.Ex_ID = @Ex_ID
			

			declare c1 cursor
			for
				select ans.Question_ID, ans.St_Answer, Q.Model_Answer
				from Exam_Answers ans inner join Questions Q
				on Q.Question_ID = ans.Question_ID
				where ans.Ex_ID = @Ex_ID and ans.St_ID = @St_ID
			for read only

			declare @Q_ID int, @St_ans varchar(20), @Model_ans varchar(20)
			open c1
			fetch c1 into @Q_ID, @St_ans, @Model_ans
			while @@FETCH_STATUS = 0
				begin
					set @total = @total + 1
					if (@St_ans = @Model_ans)
						set @grade = @grade + 1
					fetch c1 into @Q_ID, @St_ans, @Model_ans
				end
			close c1
			deallocate c1

			
			declare @percent real = ((convert(real,@grade) / convert(real,@total) )* 100)
			update Stud_Course 
			set St_Grade = @percent
			where St_ID = @St_ID and Crs_ID = @Crs_ID;

			select @Ex_ID as Ex_ID,
				   @St_ID as St_ID,
				   @grade as grade,
				   @total as total,
				   @percent as [Percentage]
	end try
	BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT @ErrorMessage = ERROR_MESSAGE(),
               @ErrorSeverity = ERROR_SEVERITY(),
               @ErrorState = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
end
GO

