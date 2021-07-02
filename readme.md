## Kritische Sicherheitslücke
### PrintNightmare CVE-2021-1675, CVE-2021-34527

z.Z. noch keine Lösung von Microsoft (Stand 02.07.2021)  
https://msrc.microsoft.com/update-guide/vulnerability/CVE-2021-34527  

Betrifft alle Betriebsystemversionen (Server und Client)

***Möglichkeiten***

* Abschalten PrinterSpooler
* ACL Anpassen
* EventID
* Removal of Authenticated Users from Pre-Windows 2000 Compatible Access

***Die ACL Anpassung ist im Moment die vielversprechendere Lösung.  
Es gibt zwei script POWERSHELL und BATCH/CMD die Batchvariante hat den Vorteil,  
dass damit ein Backup/Restore aller ACLs leicht möglich ist.***  


#### Links
<https://github.com/LaresLLC/CVE-2021-1675>  
<https://doublepulsar.com/zero-day-for-every-supported-windows-os-version-in-the-wild-printnightmare-b3fdb82f840c>  
<https://blog.truesec.com/2021/06/30/fix-for-printnightmare-cve-2021-1675-exploit-to-keep-your-print-servers-running-while-a-patch-is-not-available/>  

***Deutschsprachige Artikel***   
<https://www.borncity.com/blog/2021/07/02/windows-print-spooler-schwachstelle-cve-2021-1675-printnightmare-von-ms-besttigt-cisa-warnt/>  
<https://www.heise.de/news/Jetzt-handeln-Angreifer-nutzen-die-Drucker-Luecke-in-Windows-bereits-aus-6127265.html>  
