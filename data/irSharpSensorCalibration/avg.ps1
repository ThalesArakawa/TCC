$localPath = "C:\Users\Cheech\Documents\TCC\sensorIrSharp\sample 4-30\filtered\"

$files = Get-ChildItem -Name $localPath

for ($i = 0; $i -lt $files.Length; $i++) {
    #Write-Host ($localPath + "trat" + ($i + 4))
    $content = Get-Content ($localPath + "trat" + ($i + 4) + ".txt")
    $sum = 0
    for ($j = 0; $j -lt $content.Length; $j++) {
        $sum += $content[$j].ToInt16($aux)
    }
    ("$($i + 4)" + "`t" + "$($sum / $content.Length)") >> avg.txt
}