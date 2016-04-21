<h1>uStoreLastLogin</h1>

<p>
  APPLICATION: uStoreLastLogin<br />
  VERSION: 1.0.0<br />
  DATE: April 21, 2016<br />
  AUTHOR: Johan Cyprich<br />
  AUTHOR URL: www.cyprich.com<br />
  AUTHOR EMAIL: jcyprich@live.com
</p>
 
<p>Lists the last login date of users in XMPie uStore groups.</p>

<p>You can select users by their UserGroupID (Option 1) or company name (Option 2). Each option
 has variables that need to be set. Depending on which option you select, uncomment the
 appropriate WHERE code. The @Company is searched for using LIKE, so you don't need to enter the
 entire name that is in the ACL_UserGroup table, i.e. @Company = 'microsoft'.</p>
 
<p>The result set is sorted by the user's last name.</p>
