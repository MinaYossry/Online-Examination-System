create PROCEDURE [dbo].[exam_answer]
    @exam_ID INT,
    @st_ID  int,
	@q_ID int, 
	@answer varchar(300)
AS
BEGIN
declare @std_name varchar(50)
set @std_name = 
			(select Student.St_Name from Student 
			where Student.St_ID = @st_ID)
    BEGIN TRY
        IF (@exam_ID IS NULL OR @st_ID IS NULL OR @q_ID IS NULL )
            RAISERROR('exam_ID, this data are required', 16, 1)
        ELSE
            -- Insert the answers into the answers table
            INSERT INTO Exam_Answers(Ex_ID,St_ID,Question_ID,St_Answer)
            VALUES (@exam_ID,@st_ID,@q_ID,@answer)

            SELECT 'All your answers has been registered for exam id ' + CAST(@exam_ID AS VARCHAR) + ' and the student name is '+ @std_name
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT @ErrorMessage = ERROR_MESSAGE(),
               @ErrorSeverity = ERROR_SEVERITY(),
               @ErrorState = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END;
GO

