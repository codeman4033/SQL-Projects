USE AdventureWorks2022;
GO

DROP TABLE IF EXISTS Week5_SSIS_Import
GO

CREATE TABLE Week5_SSIS_Import
(
    AverageRate     decimal(18,9) NOT NULL,
    CurrencyCode    char(3)      NOT NULL,
    CurrencyDate    datetime      NOT NULL,
    EndOfDayRate    decimal(18,9) NOT NULL
);
GO
