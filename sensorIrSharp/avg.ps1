$localPath = "C:\Users\Cheech\Documents\TCC\sensorIrSharp\sample 4-30\filtered\"

$files = Get-ChildItem -Name $localPath

for ($i = 0; $i -lt $files.Length; $i++) {
    $content = Get-Content ($localPath + $files[$i])
    $sum = 0
    for ($j = 0; $j -lt $content.Length; $j++) {
        $sum += $content[$j].ToInt16($aux)
    }
    ($sum / $content.Length) >> avg.txt
}