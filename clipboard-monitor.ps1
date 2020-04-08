# set window title
(Get-Host).UI.RawUI.WindowTitle = $MyInvocation.MyCommand

# get clipboard text
Add-Type -AssemblyName System.Windows.Forms
$clipText = [Windows.Forms.Clipboard]::GetText()
$dateFormat = Get-Date -Format "yyyyMMdd"

#Write-Host $clipText

Write-Host ""
Write-Host " Å°Å°Å°Å°Å°Å°Å°Å°Å°Å°Å°Å°"
Write-Host " Å°"
Write-Host " Å° CLIP BOARD START!"
Write-Host " Å°"
Write-Host " Å°Å°Å°Å°Å°Å°Å°Å°Å°Å°Å°Å°"
Write-Host ""

while ($true) {
  # check the data, whether it do change or not.
  $latestClipText = [Windows.Forms.Clipboard]::GetText()
  if ($latestClipText -ne $clipText) {
    # if changed, update data.
    $clipText = $latestClipText

    # output console.
    Write-Host "- - -"
    Write-Host $clipText
        
    # write data to history file.
    $baseClipText = ${clipText}
    $baseClipText = ${baseClipText} -replace "&", "&amp;"
    $baseClipText = ${baseClipText} -replace "'", "&#x27;"
    $baseClipText = ${baseClipText} -replace "``", "&#x60;"
    $baseClipText = ${baseClipText} -replace '"', "&quot;"
    $baseClipText = ${baseClipText} -replace "<", "&lt;"
    $baseClipText = ${baseClipText} -replace ">", "&gt;"
    $baseClipText = ${baseClipText} -replace "\r\n", "<br/>"
    $baseClipText = ${baseClipText} -replace "\n", "<br/>"
    $time = Get-Date -Format "yyyy/MM/dd HH:mm:ss"
    $fileOutput = "<tr class='cb-tr-clip'><td><span>${time}</span></td><td>${baseClipText}</td></tr>"
    Write-Output ${fileOutput} | Add-Content "clipboard.html" -Encoding UTF8
  }
  # 1ïbÉXÉäÅ[Év
  Start-Sleep -Seconds 1
}