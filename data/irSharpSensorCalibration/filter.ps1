$localPath = "C:\Users\Cheech\Documents\TCC\sensorIrSharp\sample 4-30\source"
$destlPath = "C:\Users\Cheech\Documents\TCC\sensorIrSharp\sample 4-30\filtered"

$files = Get-ChildItem -Name $localPath

for ($i = 0; $i -lt $files.Length; $i++) {

    $content = Get-Content ($localPath + "\" + $files[$i])
    $content[10..($content.Length - 1)] >> ($destlPath + "\" + "trat" + $files[$i])

}


