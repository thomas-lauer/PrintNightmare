## Kritische Sicherheitslücke
### PrintNightmare CVE-2021-1675, CVE-2021-34527

### Out-of-Band (OOB) Security Update available for CVE-2021-34527
### MSRC / By MSRC Team / July 6, 2021
*** Today Microsoft released an Out-of-Band (OOB) security update for CVE-2021-34527, which is being discussed externally as PrintNightmare. This is a cumulative update release, so it contains all previous security fixes and should be applied immediately to fully protect your systems.***  

## Updates für alle Betriebsystem vorhanden - Stand 08.07.2021
  
***The fix that we released today fully addresses the public vulnerability, and it also includes a new feature that allows customers to implement stronger protections. See: KB5005010: Restricting installation of new printer drivers after applying the July 6, 2021 update***   
  
***Please note that not all versions of the update are available today as some packages are not quite ready for release. We feel that it is important to provide security updates as quickly as possible for systems that we can confidently protect today. Unfortunately, security updates for Windows Server 2016, Windows 10, version 1607, and Windows Server 2012 will be delayed for a short period, but they are expected soon.***  

***After installing this and later Windows updates, users who are not administrators can only install signed print drivers to a print server. By default, administrators can install signed and unsigned printer drivers to a print server. The installed root certificates in the system’s Trusted Root Certification Authorities trusts signed drivers.***   
   
Vogehensweise von der DATEV dokumentiert
https://apps.datev.de/help-center/documents/1021024

Auftretende Problme in DATEV Umgebungen
https://apps.datev.de/help-center/documents/1021009

Es sind zwei Schritt notwendig  
1) Installation des Patches   
2) Sicherheitsrichtline aktivieren <https://support.microsoft.com/de-de/topic/kb5005010-restricting-installation-of-new-printer-drivers-after-applying-the-july-6-2021-updates-31b91c02-05bc-4ada-a7ea-183b129578a7> 

[Script für setzen der Sicherheitsline](https://github.com/glshnu/PrintNightmare/blob/main/RestrictDriverInstallationToAdministrators.cmd)  



Betrifft alle Betriebsystemversionen (Server und Client)

***Möglichkeiten***

* Abschalten PrinterSpooler

* ACL Anpassen  
***Die ACL Anpassung ist im Moment die vielversprechendere Lösung.  
Es gibt zwei script POWERSHELL und BATCH/CMD die Batchvariante hat den Vorteil,  
dass damit ein Backup/Restore aller ACLs leicht möglich ist.
Bei der ACL Anpassung gibt es Probleme mit GPOs welche Druckertreiber verbinden sollen
hier werden teilweise Treiber nicht gefunden.***

* EventID

* Removal of Authenticated Users from Pre-Windows 2000 Compatible Access
*** Hier gibt es Problem mit mit diversen Freigaben ***

* Überwachung mit Sysmon ob Dateien angelegt werden. 

* Micropatches von 0patch  
<https://blog.0patch.com/2021/07/free-micropatches-for-printnightmare.html>  
***Nur für 10 Hosts free***


#### Links
[Microsoft Info zu CVE-2021-34527]<https://msrc.microsoft.com/update-guide/vulnerability/CVE-2021-34527>  
[BSI]<https://www.bsi.bund.de/SharedDocs/Cybersicherheitswarnungen/DE/2021/2021-233732-1032.pdf?__blob=publicationFile&v=4>  
[Malwarebytes]<https://blog.malwarebytes.com/exploits-and-vulnerabilities/2021/07/printnightmare-0-day-can-be-used-to-take-over-windows-domain-controllers/>  
<https://github.com/LaresLLC/CVE-2021-1675>  
<https://doublepulsar.com/zero-day-for-every-supported-windows-os-version-in-the-wild-printnightmare-b3fdb82f840c>  
<https://blog.truesec.com/2021/06/30/fix-for-printnightmare-cve-2021-1675-exploit-to-keep-your-print-servers-running-while-a-patch-is-not-available/>  

***Deutschsprachige Artikel***   
<https://www.borncity.com/blog/2021/07/02/windows-print-spooler-schwachstelle-cve-2021-1675-printnightmare-von-ms-besttigt-cisa-warnt/>  
<https://www.heise.de/news/Jetzt-handeln-Angreifer-nutzen-die-Drucker-Luecke-in-Windows-bereits-aus-6127265.html>  
