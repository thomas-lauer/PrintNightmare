$LastExitCode = 0

$computers = Get-ADDomainController -filter * | %{ $_.name }

Write-Host "ADCOmputers $computers"

foreach ($computer in $computers)
{
    Write-Host "Processing $computer ..." 
    $service = Get-Service -ComputerName $computer -Name Spooler -ErrorAction SilentlyContinue
    if (!$service)
    {
        Write-Host "Cannot connect to Spooler Service on $computer. Skipping." -ForegroundColor Yellow
        continue
    }
    if ($service.Status -ne "Running")
    {
        Write-Host ("Service status is: """ + $service.Status + """. Skipping.") -ForegroundColor Yellow
        continue
    }
    $printers = (Get-WmiObject -class Win32_printer -ComputerName $computer)
    if (!$printers)
    {
        Write-Host "Cannot enumerate printers. Skipping." -ForegroundColor Yellow
        continue
    }

    $disableSpooler = $true
    foreach ($DriverName in ($printers.DriverName))
    {
        if (($DriverName -notmatch 'Microsoft XPS Document Writer') -and ($DriverName -notmatch 'Microsoft Print To PDF') -and ($DriverName -notmatch 'SkyPDF') -and ($DriverName -notmatch 'Black Ice') -and ($DriverName -notmatch 'Amyuni Document'))
        {   
            Write-Host "  Printer found: $DriverName" -ForegroundColor Green
            $disableSpooler = $false
        }
    }
    if ($disableSpooler)
    {
        Write-Host "Only default printers found. Stopping and disabling spooler..." -ForegroundColor DarkCyan
        (Get-Service -ComputerName $computer -Name Spooler) | Stop-Service -Verbose
        Set-Service -ComputerName $computer -Name Spooler -StartupType Disabled -Verbose

        $LastExitCode = 0        
        REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\CentraStage /v Custom25 /t REG_SZ /d "" /f
        REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\CentraStage /v Custom25 /t REG_SZ /d "PrintSpoolerStopped" /f

    }
    else
    {
        Write-Host "Non-default printers found. Skipping." -ForegroundColor Green
        $LastExitCode = 1
    }
}

Exit $LastExitCode
