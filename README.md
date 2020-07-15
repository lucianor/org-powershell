Purpose
-------
Scripts used during organizational admin for any company


Requirements
------------
- PowerShell
- Remote Server Administration Tools for Windows 10: https://www.microsoft.com/en-us/download/details.aspx?id=45520
- After installing the above, open a PowerShell and run: Install-Module -Name WindowsCompatibility

Scripts
-------

*retrieve-ad-pictures.ps1*: This script will read a list of employee NT user accounts (without domain) on the users.txt file and export the Active Directory thumbnail photo for each user inside the Photos folder. You need to replace the AD domain controller in script line 23
