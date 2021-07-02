:: Set ACLs
icacls %SystemRoot%\System32\spool\drivers
icacls %SystemRoot%\System32\spool\drivers /deny SYSTEM:(OI)(CI)(M)
icacls %SystemRoot%\System32\spool\drivers

