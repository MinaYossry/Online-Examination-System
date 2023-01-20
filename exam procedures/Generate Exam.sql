CREATE PROCEDURE [dbo].[generate_exam]
    @Crs_ID INT,
    @num_mcq INT = 7,
    @num_tf INT = 3
AS
BEGIN
    DECLARE @exam_ID INT
	declare @crs_name varchar(50)
    BEGIN TRY
        IF (@Crs_ID IS NULL OR @num_mcq IS NULL OR @num_tf IS NULL)
            RAISERROR('Crs_ID, num_mcq, num_tf are required', 16, 1)
        ELSE
            -- Insert a new exam into the exam table and get the generated ID

			set @crs_name = 
			(select Courses.Cr_Name from Courses 
			where Courses.Crs_ID = @Crs_ID)

			INSERT INTO Exam (Ex_Name) VALUES (@crs_name)
            SET @exam_ID = SCOPE_IDENTITY()
			
            -- Select the desired number of random MCQ questions
            INSERT INTO Exam_Questions(Exam_ID, Question_ID)
            SELECT @exam_ID, mcq_questions.Question_ID
            FROM (
                SELECT TOP (@num_mcq) question_ID
                FROM Questions
                WHERE Crs_ID = @Crs_ID AND Q_Type = 0
                ORDER BY NEWID()
            ) mcq_questions

            -- Select the desired number of random true/false questions
           INSERT INTO Exam_Questions(Exam_ID, Question_ID)
            SELECT @exam_ID, tf_questions.Question_ID
            FROM (
                SELECT TOP (@num_tf) question_ID
                FROM Questions
                WHERE Crs_ID = @Crs_ID AND Q_Type = 1
                ORDER BY NEWID()
            ) tf_questions

            SELECT @exam_ID as exam_ID
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

