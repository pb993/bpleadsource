[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$outlook = New-Object -ComObject Outlook.Application
$ns = $outlook.GetNamespace('MAPI')

$drafts = $ns.GetDefaultFolder(16)
$items = $drafts.Items
$items.Sort('[LastModificationTime]', $true)

Write-Host "Letzte 3 Entwürfe:"
for ($i = 1; $i -le 3; $i++) {
    $item = $items.Item($i)
    Write-Host "---"
    Write-Host "An: $($item.To)"
    Write-Host "Betreff: $($item.Subject)"
    $bodyPreview = $item.Body.Substring(0, [Math]::Min(150, $item.Body.Length))
    Write-Host "Body: $bodyPreview"
}
