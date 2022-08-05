$localPath = "C:\Users\Cheech\Documents\TCC\sensorIrSharp\sample 4-30\filtered\"

$files = Get-ChildItem -Name $localPath

for ($i = 0; $i -lt $files.Length; $i++) {
    $content = Get-Content ($localPath + "trat" + ($i + 4) + ".txt")
    $avg = 0
    $std = 0
    for ($j = 0; $j -lt $content.Length; $j++) {
        $avg += $content[$j].ToInt16($aux)
    }
    $avg = $avg / $content.Length
    for ($j = 0; $j -lt $content.Length; $j++) {
        $std += [Math]::Pow(($content[$j].ToDecimal($aux) - $avg), 2)
    }
    $std = [Math]::Sqrt($std / $content.Length)
    ("$($i + 4)" + "`t" + "$avg" + "`t" + "$std") >> stat.txt
}