:: Set ACLs
icacls %SystemRoot%\System32\spool\drivers
icacls %SystemRoot%\System32\spool\drivers /remove:d SYSTEM
icacls %SystemRoot%\System32\spool\drivers

