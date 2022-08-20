$localPath = "C:\Users\Cheech\Documents\TCC\DadosSensorIrSharp\sample 4-30\filtered\"

$files = Get-ChildItem -Name $localPath

for ($i = 0; $i -lt $files.Length; $i++) {
    $content = Get-Content ($localPath + "trat" + ($i + 4) + ".txt")
    $avg = 0
    $avg2 = 0
    for ($j = 0; $j -lt $content.Length; $j++) {
        $avg += $content[$j].ToInt16($aux)
	$avg2 += [Math]::Pow($content[$j].ToInt16($aux), 2)
    }
    $avg = $avg / $content.Length
    $avg2 = $avg2 / $content.Length
    $std = [Math]::Sqrt($avg2 -[Math]::Pow($avg, 2))
    ("$($i + 4)" + "`t" + "$avg" + "`t" + "$std") >> stat2.txt
}