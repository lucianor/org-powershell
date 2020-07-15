# Purpose
# -------
# This script will read a list of employee NT accounts on the users.txt file 
# and export the Active Directory thumbnail photo for each user inside the Photos
# folder.
# The NT Accounts are without the domain name. You need to replace the domain host
# in script line 42
#
# Requirements
# ------------
# - PowerShell
# - Remote Server Administration Tools for Windows 10: https://www.microsoft.com/en-us/download/details.aspx?id=45520
# - After installing the above, open a PowerShell and run: Install-Module -Name WindowsCompatibility
