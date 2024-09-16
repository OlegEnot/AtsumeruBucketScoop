# Scoop
if (-Not(Get-Command "scoop" -errorAction SilentlyContinue))
{
    Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh') -ErrorAction SilentlyContinue
}
scoop bucket add extras

# NSSM
scoop install nssm --global

# Atsumeru
scoop bucket add atsumeru-xyz https://github.com/OlegEnot/AtsumeruBucketScoop.git
scoop install atsumeru-xyz/atsumeru-xyz --global
If (-Not(Get-Service "Atsumeru-service" -ErrorAction SilentlyContinue))
{
    $AtsuPath = (scoop which atsumeru)
    nssm install Atsumeru-service $AtsuPath -Dserver.port=13337 -jar C:\ProgramData\scoop\apps\atsumeru\1.0.3\Atsumeru.jar
}
Start-Service Atsumeru-service
