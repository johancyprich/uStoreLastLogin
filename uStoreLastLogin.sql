/**************************************************************************************************
 * APPLICATION: uStoreLastLogin
 * VERSION: 1.0.0
 * DATE: April 21, 2016
 * AUTHOR: Johan Cyprich
 * AUTHOR URL: www.cyprich.com
 * AUTHOR EMAIL: jcyprich@live.com
 *    
 * LICENSE:
 * The MIT License (MIT)
 * http://opensource.org/licenses/MIT
 * 
 * Copyright (c) 2016 Johan Cyprich. All rights reserved.
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy 
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 * 
 * SUMMARY:
 * Lists the last login date of users in XMPie uStore groups.
 *
 * You can select users by their UserGroupID (Option 1) or company name (Option 2). Each option
 * has variables that need to be set. Depending on which option you select, uncomment the
 * appropriate WHERE code. The @Company is searched for using LIKE, so you don't need to enter the
 * entire name that is in the ACL_UserGroup table, i.e. @Company = 'microsoft'.
 *
 * The result set is sorted by the user's last name.
 **************************************************************************************************/

-- Option 1: select by UserGroupID

DECLARE @Group1 VARCHAR(255)     -- UserGroupID from ACL_UserGroup
SET @Group1 = 12334              -- Registered Customers

DECLARE @Group2 VARCHAR(255)     -- UserGroupID from ACL_UserGroup
SET @Group2 = 12335              -- Anonymous Customers

-- Option 2: select by similar Name

DECLARE @Company VARCHAR(255)    -- Name from ACL_UserGroup
SET @Company = 'company'

-- Main

SELECT U.FirstName + ' ' + U.LastName AS 'User Name', U.Email, U.CompanyName AS 'Company Name', U.ModifiedDate AS 'Last Login', UG.Name AS 'Store Group'
  FROM [uStore].[dbo].[ACL_UserGroup] AS UG

  JOIN [uStore].[dbo].[ACL_UserGroupMembership] AS UGM
    ON UG.UserGroupId = UGM.UserGroupId

  JOIN [uStore].[dbo].[Users] AS U
    ON U.UserID = UGM.UserId

  -- Option 1
  WHERE (UG.UserGroupId = @Group1) or (UG.UserGroupId = @Group2)

  -- Option 2
  --WHERE UG.Name LIKE '%' + @Company + '%'

  ORDER BY U.LastName
