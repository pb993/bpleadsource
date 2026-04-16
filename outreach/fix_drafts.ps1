# Delete old broken drafts and recreate with correct encoding
$outlook = New-Object -ComObject Outlook.Application
$ns = $outlook.GetNamespace('MAPI')

# Delete the 14 broken drafts
$drafts = $ns.GetDefaultFolder(16)
$items = $drafts.Items
$items.Sort('[LastModificationTime]', $true)

$deleted = 0
$toDelete = @()
for ($i = 1; $i -le $items.Count; $i++) {
    $item = $items.Item($i)
    if ($item.Subject -match "MEISTERWERK|Proliance|Apaleo|Ordio|IANEO|Kenjo|Hrmony|Scompler|aku|mediDOK|KMS|Legalhero|Edtelligent|Conntac") {
        $toDelete += $item
    }
}
foreach ($item in $toDelete) {
    $item.Delete()
    $deleted++
}
Write-Host "$deleted alte Entwuerfe geloescht"

# Now read the mail data from a JSON file (no encoding issues)
$jsonPath = "C:\Users\phili\bpleadsource\outreach\mails_data.json"
$json = [System.IO.File]::ReadAllText($jsonPath, [System.Text.Encoding]::UTF8)
$mails = $json | ConvertFrom-Json

$count = 0
$accounts = $outlook.Session.Accounts
$sendAccount = $null
foreach ($account in $accounts) {
    if ($account.SmtpAddress -eq 'leadsource@bp-shops.com') {
        $sendAccount = $account
        break
    }
}

foreach ($m in $mails) {
    $mail = $outlook.CreateItem(0)
    $mail.To = $m.to
    $mail.Subject = $m.subject
    $mail.Body = $m.body
    if ($sendAccount) {
        $mail.SendUsingAccount = $sendAccount
    }
    $mail.Save()
    $count++
    Write-Host "[$count/14] OK: $($m.to)"
}

Write-Host "`n=== $count Entwuerfe erstellt (mit korrekten Umlauten) ==="
