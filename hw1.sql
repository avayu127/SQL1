--1
DECLARE @InputString NVARCHAR(MAX) = 'Я так нежен Катя'; 
DECLARE @IsPalindrome BIT = 1; 
SET @InputString = REPLACE(@InputString, ' ', '');

DECLARE @StringLength INT = LEN(@InputString);
DECLARE @Index INT = 1;

WHILE @Index <= @StringLength / 2
BEGIN
    IF SUBSTRING(@InputString, @Index, 1) <> SUBSTRING(@InputString, @StringLength - @Index + 1, 1)
    BEGIN
        SET @IsPalindrome = 0;
        BREAK;
    END
    SET @Index = @Index + 1;
END

IF @IsPalindrome = 1
    PRINT 'Строка является палиндромом.';
ELSE
    PRINT 'Строка не является палиндромом.';

--2
DECLARE @PrintString NVARCHAR(MAX) = 'Александр так любит шаурму, что готов есть шаурму каждый день'; 
DECLARE @SearchWord NVARCHAR(100) = 'шаурму'; 

DECLARE @Count INT = 0;
DECLARE @StartPosition INT = 1;

WHILE @StartPosition <= LEN(@PrintString)
BEGIN
    DECLARE @WordPosition INT = CHARINDEX(@SearchWord, @PrintString, @StartPosition);

    IF @WordPosition = 0
        BREAK;

    SET @Count = @Count + 1;
    SET @StartPosition = @WordPosition + LEN(@SearchWord);
END

PRINT 'Слово "' + @SearchWord + '" встречается ' + CAST(@Count AS NVARCHAR(10)) + ' раз(а) в строке.';

--3
DECLARE @InputStr NVARCHAR(MAX) = 'Buy ViAgRA now';
SET @InputStr = LOWER(@InputStr);
DECLARE @IsSpam BIT = 0; 

IF CHARINDEX('viagra', @InputStr) > 0 OR CHARINDEX('xxx', @InputStr) > 0
    SET @IsSpam = 1;

IF @IsSpam = 1
    PRINT 'ЭТО СПАМ';
ELSE
    PRINT 'это не спам)';


