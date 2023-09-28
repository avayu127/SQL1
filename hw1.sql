--1
DECLARE @InputString NVARCHAR(MAX) = '� ��� ����� ����'; 
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
    PRINT '������ �������� �����������.';
ELSE
    PRINT '������ �� �������� �����������.';

--2
DECLARE @PrintString NVARCHAR(MAX) = '��������� ��� ����� ������, ��� ����� ���� ������ ������ ����'; 
DECLARE @SearchWord NVARCHAR(100) = '������'; 

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

PRINT '����� "' + @SearchWord + '" ����������� ' + CAST(@Count AS NVARCHAR(10)) + ' ���(�) � ������.';

--3
DECLARE @InputStr NVARCHAR(MAX) = 'Buy ViAgRA now';
SET @InputStr = LOWER(@InputStr);
DECLARE @IsSpam BIT = 0; 

IF CHARINDEX('viagra', @InputStr) > 0 OR CHARINDEX('xxx', @InputStr) > 0
    SET @IsSpam = 1;

IF @IsSpam = 1
    PRINT '��� ����';
ELSE
    PRINT '��� �� ����)';


