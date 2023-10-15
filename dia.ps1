$dia = (get-date).AddDays(-7)

$dia.ToString("ddMMyyyy")





$ARCHIVOS = dir C:\Users\Marcelo\Desktop | Select-Object Name,LastWriteTime
foreach ($A in $ARCHIVOS){

              Write-Host ($A.LastWriteTime).ToString("dd/MM/yyyy")
              if (    ($A.LastWriteTime).ToString("dd/MM/yyyy") -eq "$($dia.ToString("dd/MM/yyyy"))" ) { Write-Host -ForegroundColor Green "el archivo $($A.Name) tiene el mismo dia"}
              else { Write-Host -ForegroundColor Red "el archivo $($A.Name) NO tiene el mismo dia"}

}