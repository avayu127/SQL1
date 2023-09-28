--1
DECLARE @L INT = 10; 
DECLARE @Line VARCHAR(MAX) = REPLICATE('*', @L); 
PRINT @Line;

--2
DECLARE @Start INT = 3;
DECLARE @End INT = 1000000;

CREATE TABLE #Prostoe (Number INT);
INSERT INTO #Prostoe (Number) VALUES (1);

DECLARE @ThisNumber INT = @Start;

WHILE @ThisNumber <= @End
BEGIN
    DECLARE @IsProstoe BIT = 1; 
    
    DECLARE @Divisor INT = 2;
    WHILE @Divisor * @Divisor <= @ThisNumber
    BEGIN
        IF @ThisNumber % @Divisor = 0
        BEGIN
            SET @IsProstoe = 0; 
            BREAK;
        END
        SET @Divisor = @Divisor + 1;
    END
   
    IF @IsProstoe = 1
    BEGIN
        INSERT INTO #Prostoe (Number) VALUES (@ThisNumber);
    END
    
    SET @ThisNumber = @ThisNumber + 2; 
END

SELECT Number FROM #Prostoe;
DROP TABLE #Prostoe;

--3
DECLARE @MinNumber INT = 100000; 
DECLARE @MaxNumber INT = 999999; 

CREATE TABLE #MatchingNumbers (Number INT);

DECLARE @ThNumber INT = @MinNumber;

WHILE @ThNumber <= @MaxNumber
BEGIN
    DECLARE @Digit1 INT = @ThNumber / 100000;
    DECLARE @Digit2 INT = (@ThNumber / 10000) % 10;
    DECLARE @Digit3 INT = (@ThNumber / 1000) % 10;
    DECLARE @Digit4 INT = (@ThNumber / 100) % 10;
    DECLARE @Digit5 INT = (@ThNumber / 10) % 10;
    DECLARE @Digit6 INT = @ThNumber % 10;

    IF (@Digit1 + @Digit2 + @Digit3) = (@Digit4 + @Digit5 + @Digit6)
    BEGIN
        INSERT INTO #MatchingNumbers (Number) VALUES (@ThNumber);
    END

    SET @ThNumber = @ThNumber + 1;
END

SELECT Number FROM #MatchingNumbers;
DROP TABLE #MatchingNumbers;