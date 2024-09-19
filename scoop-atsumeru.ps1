# Scoop
if (-Not(Get-Command "scoop" -errorAction SilentlyContinue))
{
    Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh') -ErrorAction SilentlyContinue
}
scoop bucket add extras

# Atsumeru
scoop bucket add atsumeru-xyz https://github.com/OlegEnot/AtsumeruBucketScoop.git
scoop install atsumeru-xyz/atsumeru-xyz --global

# Firewall
New-NetFirewallRule -DisplayName "Atsumeru-server" -Direction Inbound -Action Allow -Protocol TCP -LocalPort 13337