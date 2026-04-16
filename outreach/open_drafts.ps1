Add-Type -AssemblyName 'Microsoft.Office.Interop.Outlook'
$outlook = New-Object -ComObject Outlook.Application

$from = 'leadsource@bp-shops.com'

$mails = @(
    @{
        to = 'bertram.wildenauer@meisterwerk.app'
        subject = '5 Handwerksbetriebe für MEISTERWERK – kostenlos'
        body = @"
Hallo Herr Wildenauer,

kurz und direkt: Wir sind eine junge B2B-Agentur für Lead-Generierung und suchen erste Kunden, die uns testen.

Ich habe mir MEISTERWERK angeschaut – Sie digitalisieren Handwerksbetriebe mit Auftragsabwicklung, Zeiterfassung und Rechnungsstellung. Genau die richtige Zielgruppe für uns: SHK-Betriebe, Elektriker, Bauunternehmer – davon gibt es zehntausende in Deutschland, und die meisten suchen aktiv nach genau so einer Lösung.

Unser Angebot: Wir liefern Ihnen 5 Handwerksbetriebe mit Entscheider-Kontakt, geprüfter E-Mail und fertigem Anschreiben. Komplett kostenlos. Kein Vertrag. Wenn die Qualität stimmt, reden wir über mehr. Wenn nicht – kein Problem.

Soll ich loslegen?

Philip Babuda
BP:LeadSource
leadsource@bp-shops.com
leadsource.bp-shops.com
"@
    },
    @{
        to = 'dominik.fuenkner@proliance.ai'
        subject = '5 KMUs die NIS2 umsetzen müssen – für Proliance'
        body = @"
Hallo Herr Fünkner,

kurz und direkt: Wir sind eine junge B2B-Agentur für Lead-Generierung und suchen erste Kunden, die uns testen.

NIS2 tritt in Kraft, und tausende Mittelständler müssen jetzt handeln – aber wissen noch nicht mit wem. Proliance bietet genau dafür die Lösung: DSGVO, NIS2, ISO27001 – alles in einer Plattform. Das Problem ist nicht Ihr Produkt, sondern dass die richtigen Firmen Sie noch nicht kennen.

Unser Angebot: Wir recherchieren 5 KMUs (50-500 Mitarbeiter), die unter NIS2 fallen und noch keine Compliance-Software haben. Mit Geschäftsführer-Kontakt, geprüfter E-Mail und fertigem Anschreiben. Komplett kostenlos. Kein Vertrag.

Interesse?

Philip Babuda
BP:LeadSource
leadsource@bp-shops.com
leadsource.bp-shops.com
"@
    },
    @{
        to = 'uli@apaleo.com'
        subject = '5 Hotels die ein modernes PMS suchen – für Apaleo'
        body = @"
Hallo Herr Pillau,

kurz und direkt: Wir sind eine junge B2B-Agentur für Lead-Generierung und suchen erste Kunden, die uns testen.

Apaleo hat das modernste API-basierte Hotel PMS am Markt. Aber Hotels wechseln ihr PMS nur, wenn jemand sie aktiv anspricht – die suchen nicht selbst. Genau da kommen wir ins Spiel.

Unser Angebot: Wir finden 5 Hotels oder Serviced-Apartment-Betreiber in der DACH-Region, die aktuell ein veraltetes PMS nutzen. Mit Entscheider-Kontakt, geprüfter E-Mail und fertigem Anschreiben. Komplett kostenlos. Kein Vertrag.

Darf ich loslegen?

Philip Babuda
BP:LeadSource
leadsource@bp-shops.com
leadsource.bp-shops.com
"@
    },
    @{
        to = 'david@ordio.com'
        subject = '5 Gastro-Ketten die Schichtplanung brauchen – für Ordio'
        body = @"
Hallo Herr Keuenhof,

kurz und direkt: Wir sind eine junge B2B-Agentur für Lead-Generierung und suchen erste Kunden, die uns testen.

Ordio löst ein Problem, das jeder Gastronom kennt: Schichtplanung per WhatsApp und Excel. Sie haben die Lösung – aber Restaurants, Bäckerei-Ketten und Retailer müssen erstmal davon erfahren.

Unser Angebot: Wir finden 5 Gastro-Ketten oder Filialisten mit 3+ Standorten, die noch keine digitale Schichtplanung haben. Mit Inhaber-Kontakt, geprüfter E-Mail und fertigem Anschreiben. Komplett kostenlos. Kein Vertrag.

Soll ich starten?

Philip Babuda
BP:LeadSource
leadsource@bp-shops.com
leadsource.bp-shops.com
"@
    },
    @{
        to = 'dirk.frank@ianeo.de'
        subject = '5 Online-Händler die PIM brauchen – für IANEO'
        body = @"
Hallo Herr Frank,

kurz und direkt: Wir sind eine junge B2B-Agentur für Lead-Generierung und suchen erste Kunden, die uns testen.

Jeder Online-Händler mit 500+ Produkten hat das gleiche Problem: Produktdaten in Excel, verschiedene Versionen für Amazon, Shopify und den eigenen Shop. IANEO löst das – aber die Händler müssen erstmal wissen, dass es eine bessere Lösung gibt.

Unser Angebot: Wir finden 5 E-Commerce-Unternehmen oder Multichannel-Händler, die noch kein PIM-System haben. Mit Geschäftsführer-Kontakt, geprüfter E-Mail und fertigem Anschreiben. Komplett kostenlos. Kein Vertrag.

Interesse?

Philip Babuda
BP:LeadSource
leadsource@bp-shops.com
leadsource.bp-shops.com
"@
    },
    @{
        to = 'david@kenjo.io'
        subject = '5 Mittelständler die HR digitalisieren wollen – für Kenjo'
        body = @"
Hallo Herr Padilla,

kurz und direkt: Wir sind eine junge B2B-Agentur für Lead-Generierung und suchen erste Kunden, die uns testen.

Kenjo macht HR-Management einfach: Abwesenheiten, Onboarding, Performance Reviews – alles in einer Plattform. Genau das, was jeder Mittelständler mit 50-500 Mitarbeitern braucht, der noch mit Excel-Listen arbeitet.

Unser Angebot: Wir finden 5 wachsende Mittelständler, die noch keine HR-Software haben. Mit HR-Leiter oder Geschäftsführer-Kontakt, geprüfter E-Mail und fertigem Anschreiben. Komplett kostenlos. Kein Vertrag.

Darf ich loslegen?

Philip Babuda
BP:LeadSource
leadsource@bp-shops.com
leadsource.bp-shops.com
"@
    },
    @{
        to = 'saupe@hrmony.de'
        subject = '5 Unternehmen die Mitarbeiter-Benefits einführen wollen – für Hrmony'
        body = @"
Hallo Herr Saupe,

kurz und direkt: Wir sind eine junge B2B-Agentur für Lead-Generierung und suchen erste Kunden, die uns testen.

Fachkräftemangel ist überall – und Unternehmen suchen nach Wegen, Mitarbeiter zu halten. Hrmony bietet steuerfreie Benefits, Sachbezüge und Essenszuschüsse. Das Problem: Viele HR-Abteilungen wissen nicht, wie einfach das sein kann.

Unser Angebot: Wir finden 5 Unternehmen mit 100-1000 Mitarbeitern, die noch kein Benefits-System haben. Mit HR-Leiter-Kontakt, geprüfter E-Mail und fertigem Anschreiben. Komplett kostenlos. Kein Vertrag.

Soll ich starten?

Philip Babuda
BP:LeadSource
leadsource@bp-shops.com
leadsource.bp-shops.com
"@
    },
    @{
        to = 'bjoern.broehl@scompler.com'
        subject = '5 Marketing-Teams die Content-Strategie brauchen – für Scompler'
        body = @"
Hallo Herr Bröhl,

kurz und direkt: Wir sind eine junge B2B-Agentur für Lead-Generierung und suchen erste Kunden, die uns testen.

Scompler ist die führende Content-Marketing-Plattform im DACH-Raum. Jedes Unternehmen mit einem Marketing-Team kennt das Problem: Content-Planung in Excel, keine Strategie, kein Überblick. Scompler löst das – aber Marketing-Leiter müssen erstmal davon erfahren.

Unser Angebot: Wir finden 5 Unternehmen mit einem Marketing-Team (ab 3 Personen), die noch keine Content-Plattform nutzen. Mit CMO oder Marketing-Leiter-Kontakt, geprüfter E-Mail und fertigem Anschreiben. Komplett kostenlos. Kein Vertrag.

Interesse?

Philip Babuda
BP:LeadSource
leadsource@bp-shops.com
leadsource.bp-shops.com
"@
    },
    @{
        to = 'boris.gierszewski@aku.eu'
        subject = '5 Produktionsbetriebe die Machine Vision brauchen – für aku'
        body = @"
Hallo Herr Gierszewski,

kurz und direkt: Wir sind eine junge B2B-Agentur für Lead-Generierung und suchen erste Kunden, die uns testen.

aku.automation bietet Machine Vision für industrielle Qualitätskontrolle und Automatisierung. Jeder Produktionsbetrieb, der noch manuell prüft, verliert Zeit und Geld. Aber die wenigsten wissen, wie zugänglich Machine Vision inzwischen geworden ist.

Unser Angebot: Wir finden 5 Produktionsbetriebe (Automotive, Elektronik, Lebensmittel), die noch keine automatische Qualitätskontrolle haben. Mit Produktionsleiter oder Geschäftsführer-Kontakt, geprüfter E-Mail und fertigem Anschreiben. Komplett kostenlos. Kein Vertrag.

Darf ich loslegen?

Philip Babuda
BP:LeadSource
leadsource@bp-shops.com
leadsource.bp-shops.com
"@
    },
    @{
        to = 'rainer.svojanovsky@medidok.de'
        subject = '5 Arztpraxen die ein digitales Archiv brauchen – für mediDOK'
        body = @"
Hallo Herr Svojanovsky,

kurz und direkt: Wir sind eine junge B2B-Agentur für Lead-Generierung und suchen erste Kunden, die uns testen.

mediDOK digitalisiert Patientenakten und Praxisdokumente – ein Thema, das jede Arztpraxis betrifft. Gerade MVZ und Gemeinschaftspraxen mit mehreren Ärzten brauchen eine zentrale Dokumentenverwaltung, haben aber oft keine Zeit sich darum zu kümmern.

Unser Angebot: Wir recherchieren 5 MVZ oder Gemeinschaftspraxen in Ihrer Zielregion, die noch kein digitales Archiv haben. Mit Praxisinhaber-Kontakt und geprüften Kontaktdaten. Komplett kostenlos. Kein Vertrag.

Soll ich starten?

Philip Babuda
BP:LeadSource
leadsource@bp-shops.com
leadsource.bp-shops.com
"@
    },
    @{
        to = 'stephan.siehl@kms.de'
        subject = '5 Fuhrparkbetreiber die Fleet-Software brauchen – für KMS'
        body = @"
Hallo Herr Siehl,

kurz und direkt: Wir sind eine junge B2B-Agentur für Lead-Generierung und suchen erste Kunden, die uns testen.

KMS bietet Fleet Management und Car Sharing-Plattformen. Autovermieter, Fuhrparkmanager und Mobility-Anbieter – die brauchen alle digitale Lösungen, aber werden selten aktiv angesprochen.

Unser Angebot: Wir finden 5 Autovermieter oder Unternehmen mit eigenem Fuhrpark (50+ Fahrzeuge), die noch keine Fleet-Software nutzen. Mit Fuhrparkleiter oder Geschäftsführer-Kontakt, geprüfter E-Mail und fertigem Anschreiben. Komplett kostenlos. Kein Vertrag.

Interesse?

Philip Babuda
BP:LeadSource
leadsource@bp-shops.com
leadsource.bp-shops.com
"@
    },
    @{
        to = 'robin.friedlein@legalhero.de'
        subject = '5 Kanzleien die bessere Software brauchen – für Legalhero'
        body = @"
Hallo Herr Friedlein,

kurz und direkt: Wir sind eine junge B2B-Agentur für Lead-Generierung und suchen erste Kunden, die uns testen.

Legalhero modernisiert die Kanzleiarbeit – Mandatsverwaltung, Abrechnung, Dokumentenmanagement. Gerade kleinere Kanzleien mit 2-15 Anwälten arbeiten oft noch mit veralteten Systemen und suchen nach einer modernen Alternative.

Unser Angebot: Wir recherchieren 5 Kanzleien in der DACH-Region, die zu Ihrem Profil passen. Mit Kanzleipartner-Kontakt und geprüften Kontaktdaten. Komplett kostenlos. Kein Vertrag.

Darf ich loslegen?

Philip Babuda
BP:LeadSource
leadsource@bp-shops.com
leadsource.bp-shops.com
"@
    },
    @{
        to = 'hendrik.rennert@edtelligent.de'
        subject = '5 Bildungsträger die Verwaltung digitalisieren wollen – für Edtelligent'
        body = @"
Hallo Herr Rennert,

kurz und direkt: Wir sind eine junge B2B-Agentur für Lead-Generierung und suchen erste Kunden, die uns testen.

Edtelligent digitalisiert Bildungsträger – Teilnehmerverwaltung, Kursplanung, Abrechnung. Gerade private Bildungsträger und Akademien kämpfen mit veralteten Prozessen und suchen nach Lösungen, die ihnen den Alltag erleichtern.

Unser Angebot: Wir finden 5 private Bildungsträger oder Akademien, die noch keine moderne Verwaltungssoftware haben. Mit Geschäftsführer-Kontakt, geprüfter E-Mail und fertigem Anschreiben. Komplett kostenlos. Kein Vertrag.

Soll ich starten?

Philip Babuda
BP:LeadSource
leadsource@bp-shops.com
leadsource.bp-shops.com
"@
    },
    @{
        to = 'faath@conntac.net'
        subject = '5 Stadtwerke die Kundenservice automatisieren wollen – für Conntac'
        body = @"
Hallo Herr Faath,

kurz und direkt: Wir sind eine junge B2B-Agentur für Lead-Generierung und suchen erste Kunden, die uns testen.

Conntac hilft Internet-Providern und Stadtwerken, ihren Kundenservice zu automatisieren. Gerade regionale Versorger und kleinere Provider haben das Problem: zu viele Support-Anfragen, zu wenig Personal. Conntac löst das – aber die richtigen Ansprechpartner müssen erstmal davon erfahren.

Unser Angebot: Wir recherchieren 5 regionale Stadtwerke oder Internet-Provider mit eigenem Kundenstamm, die zu Ihrem Profil passen. Mit Geschäftsführer- oder IT-Leiter-Kontakt und geprüften Kontaktdaten. Komplett kostenlos. Kein Vertrag.

Interesse?

Philip Babuda
BP:LeadSource
leadsource@bp-shops.com
leadsource.bp-shops.com
"@
    }
)

$count = 0
foreach ($m in $mails) {
    try {
        $mail = $outlook.CreateItem(0)
        $mail.To = $m.to
        $mail.Subject = $m.subject
        $mail.Body = $m.body

        # Set sender account to leadsource@bp-shops.com
        $accounts = $outlook.Session.Accounts
        foreach ($account in $accounts) {
            if ($account.SmtpAddress -eq 'leadsource@bp-shops.com') {
                $mail.SendUsingAccount = $account
                break
            }
        }

        $mail.Save()
        $count++
        Write-Host "[$count/14] Entwurf erstellt: $($m.to) - $($m.subject)"
    } catch {
        Write-Host "FEHLER bei $($m.to): $($_.Exception.Message)"
    }
}

Write-Host "`n=== $count von 14 Entwürfen erstellt ==="
Write-Host "Alle im Outlook Entwürfe-Ordner von leadsource@bp-shops.com"
