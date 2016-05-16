Write-Host "Add Registry to hosts"
$ip = "192.168.38.100"
# I know this could be done with vagrant-hostmanager
Add-Content C:\Windows\system32\drivers\etc\hosts "`r`n$ip registry"

Write-Host "Add Docker Registry"
cp C:\ProgramData\docker\runDockerDaemon.cmd C:\ProgramData\docker\runDockerDaemon.cmd.bak
cat C:\ProgramData\docker\runDockerDaemon.cmd.bak | %{$_ -replace '^dockerd -G docker -H npipe:// -H 0.0.0.0:2375$','dockerd -G docker -H npipe:// -H 0.0.0.0:2375 --insecure-registry registry:5000'} | Set-Content C:\ProgramData\docker\runDockerDaemon.cmd

Write-Host "Restarting docker"
Restart-Service docker
