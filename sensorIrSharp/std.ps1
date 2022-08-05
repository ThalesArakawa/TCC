$localPath = "C:\Users\Cheech\Documents\TCC\sensorIrSharp\sample 4-30\filtered\"
$avgPath = "C:\Users\Cheech\Documents\TCC\sensorIrSharp\avg.txt"

$files = Get-ChildItem -Name $localPath
$avg = Get-Content -Path $avgPath

for ($i = 0; $i -lt $files.Length; $i++) {
    #Write-Host ($localPath + "trat" + ($i + 4))
    $content = Get-Content ($localPath + "trat" + ($i + 4) + ".txt")
    $sum = 0
    for ($j = 0; $j -lt $content.Length; $j++) {
        $sum += [Math]::Pow(($content[$j].ToDecimal($aux) - $avg[$i].ToDecimal($aux1)), 2)
    }
    [Math]::Sqrt(($sum / $content.Length)) >> std.txt

}