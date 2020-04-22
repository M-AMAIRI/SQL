--Script #4 - APPLY with table-valued function

IF EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[fn_GetAllEmployeeOfADepartment]') AND type IN (N'IF')) 
BEGIN 
   DROP FUNCTION dbo.fn_GetAllEmployeeOfADepartment 
END 
GO
 
CREATE FUNCTION dbo.fn_GetAllEmployeeOfADepartment(@DeptID AS INT)  
RETURNS TABLE 
AS 
RETURN 
   ( 
   SELECT * FROM Employee E 
   WHERE E.DepartmentID = @DeptID 
   ) 
GO
 
SELECT * FROM Department D 
CROSS APPLY dbo.fn_GetAllEmployeeOfADepartment(D.DepartmentID) 
GO
 
SELECT * FROM Department D 
OUTER APPLY dbo.fn_GetAllEmployeeOfADepartment(D.DepartmentID) 
GO 
