
USE AP;
GO

CREATE OR ALTER PROCEDURE dbo.sp_InvoiceDrillDown
    @InvoiceID INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        v.VendorName,
        i.InvoiceID,
        i.VendorID,
        i.InvoiceNumber,
        i.InvoiceDate,
        i.InvoiceTotal,
        i.PaymentTotal,
        i.CreditTotal,
        i.TermsID,
        i.InvoiceDueDate,
        i.PaymentDate
    FROM dbo.Invoices AS i
    INNER JOIN dbo.Vendors AS v
        ON i.VendorID = v.VendorID
    WHERE
        @InvoiceID IS NULL
        OR i.InvoiceID = @InvoiceID
    ORDER BY
        v.VendorName,
        i.InvoiceDate,
        i.InvoiceNumber;
END;
GO

-- Test: retrieve all invoices
EXEC dbo.sp_InvoiceDrillDown;
GO

-- Test: retrieve one invoice
EXEC dbo.sp_InvoiceDrillDown @InvoiceID = 100;
GO