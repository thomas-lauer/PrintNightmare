:: Backup acl PrinterSpooler
icacls %SystemRoot%\System32\spool\drivers /save c:\admglsh\System32_spool_drivers_ical_backup.txt /t /c
if %errorlevel% NEQ 0 Exit /b
:: Show ACLs
icacls %SystemRoot%\System32\spool\drivers