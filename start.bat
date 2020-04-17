@echo off
mode 35,10
color 1F
powershell -command "&{$h=Get-Host;$w=$h.UI.RawUI;$s=$w.BufferSize;$s.height=3000;$w.BufferSize=$s;}"
powershell -ExecutionPolicy RemoteSigned .\clipboard-monitor.ps1
