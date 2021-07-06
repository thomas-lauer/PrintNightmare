# grant/deny access to sys\spool\drivers (printNightmare) :: build 4/seagull :: based on trueSec's work, but not their code

# Backup acl PrinterSpooler - Thomas Lauer
cmd /c "ICACLS `"$env:systemRoot\System32\spool\drivers`" /save c:\admglsh\System32_spool_drivers_ical_backup.txt /t /c" 2>&1>$null

# Show ACLs - Thomas Lauer
Write-Host "settings before update"
cmd /c "ICACLS `"$env:systemRoot\System32\spool\drivers`""

switch -Regex ($env:usrChoice) {
    'Deny' {
        write-host "- Denying SYSTEM access to write to Spool\Drivers folder..."
        cmd /c "ICACLS `"$env:systemRoot\System32\spool\drivers`" /deny *S-1-1-0:F /inheritance:r" 2>&1>$null
    } 'Grant' {
        write-host "- Granting SYSTEM access to write to Spool\Drivers folder..."
        cmd /c "ICACLS `"$env:systemRoot\System32\spool\drivers`" /reset" 2>&1>$null
    } default {
        write-host "! ERROR: No option was set."
        exit 1
    }
}
write-host "- Actions completed."

# Show ACLs - Thomas Lauer
Write-Host "settings after update"
cmd /c "ICACLS `"$env:systemRoot\System32\spool\drivers`""
