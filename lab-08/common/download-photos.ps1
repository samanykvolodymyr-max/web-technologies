# Запусти этот скрипт в PowerShell (Правой кнопкой -> Выполнить с помощью PowerShell),
# если хочешь сохранить все 11 реальных фото локально в папку common/img/
$imgDir = Join-Path $PSScriptRoot "img"
New-Item -ItemType Directory -Force -Path $imgDir | Out-Null

$photos = @{
  "1.jpg"  = "https://picsum.photos/seed/coast-bay-101/800/600"
  "2.jpg"  = "https://picsum.photos/seed/alpine-river-202/800/600"
  "3.jpg"  = "https://picsum.photos/seed/forest-trail-303/1000/750"
  "4.jpg"  = "https://picsum.photos/seed/lagoon-cliffs-404/800/600"
  "5.jpg"  = "https://picsum.photos/seed/harbour-flowers-505/800/600"
  "6.jpg"  = "https://picsum.photos/seed/ocean-sunset-606/1400/500"
  "7.jpg"  = "https://picsum.photos/seed/street-market-707/800/600"
  "8.jpg"  = "https://picsum.photos/seed/island-boats-808/800/600"
  "9.jpg"  = "https://picsum.photos/seed/garden-house-909/800/600"
  "10.jpg" = "https://picsum.photos/seed/morning-coffee-1010/800/600"
  "11.jpg" = "https://picsum.photos/seed/sunny-beach-1111/800/600"
}

foreach ($item in $photos.GetEnumerator()) {
  $dest = Join-Path $imgDir $item.Key
  Invoke-WebRequest -Uri $item.Value -OutFile $dest
  Write-Host "Скачано: $($item.Key)"
}
Write-Host "Готово! Все реальные фото сохранены в common/img/"
