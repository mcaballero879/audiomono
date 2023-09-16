

function ActivarMono(){
powershell -windowstyle hidden -command "Start-Process cmd -ArgumentList '/s,/c,REG ADD "HKCU\Software\Microsoft\Multimedia\Audio" /V AccessibilityMonoMixState /T REG_DWORD /D 1 /F & net stop "Audiosrv" & net start "Audiosrv"' -Verb runAs"
if ($? -eq "True"){

Write-Host -ForegroundColor Green "Se activo el audio Mono"
pause}

 else { Write-Host -ForegroundColor Red "Ocurrio un error, vuelva a ejcutar el programa"
pause}



                        }
#ir al registro

function verificarRegistroMono {


cd HKCU:

if (Get-Item .\Software\Microsoft\Multimedia\Audio | Where-Object {$_.Property -contains "AccessibilityMonoMixState"})
        {Write-Host -ForegroundColor Green "El audio ya está en mono"
            pause
            exit
            
            }
else {Write-Host -ForegroundColor Red "Activando Audio Mono"
        ActivarMono
        
        }


}

verificarRegistroMono
