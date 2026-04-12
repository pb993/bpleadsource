# BP:LeadSource – Kundenpaket Export & PDF Generator

## Übersicht

Automatisierter Workflow zum Exportieren finaler Kundenpakete als strukturierte Markdown-Dateien und professionell gebrandetes PDF.

---

## Verzeichnisstruktur

```
C:\Users\phili\bpleadsource\kunden\
├── export-package.js          # Haupt-Export-Script
├── package.json               # Node.js Abhängigkeiten
├── README.md                  # Diese Dokumentation
├── test-data/                 # Beispieldaten für Tests
│   ├── final-package.md
│   ├── leads.md
│   └── emails.md
└── [kundenname]-[datum]/      # Exportierte Kundenpakete
    ├── final-package.md
    ├── leads.md
    ├── emails.md
    └── [kundenname]-leads-[datum].pdf
```

---

## Installation

```bash
cd C:\Users\phili\bpleadsource\kunden
npm install
```

**Abhängigkeiten:**
- `markdown-pdf` (v11.0.0) – PDF-Generierung aus Markdown
- Node.js >= 14.0.0

---

## Verwendung

### Grundlegender Export

```bash
node export-package.js <kundenname> <final-package.md> <leads.md> <emails.md>
```

**Parameter:**
1. `kundenname` – Name des Kunden (wird für Ordner- und PDF-Namen verwendet)
2. `final-package.md` – Pfad zur vollständigen Paket-Datei
3. `leads.md` – Pfad zur Lead-Liste
4. `emails.md` – Pfad zu E-Mail-Templates

### Beispiel

```bash
node export-package.js TechVision test-data/final-package.md test-data/leads.md test-data/emails.md
```

**Output:**
```
✅ Ordner erstellt: C:\Users\phili\bpleadsource\kunden\TechVision-2026-04-11
✅ Kopiert: final-package.md
✅ Kopiert: leads.md
✅ Kopiert: emails.md
📄 Erstelle PDF...
✅ PDF erstellt: C:\Users\phili\bpleadsource\kunden\TechVision-2026-04-11\TechVision-leads-2026-04-11.pdf

✨ Export abgeschlossen!

📦 Finales Paket:
   C:\Users\phili\bpleadsource\kunden\TechVision-2026-04-11

📄 PDF:
   C:\Users\phili\bpleadsource\kunden\TechVision-2026-04-11\TechVision-leads-2026-04-11.pdf
```

---

## PDF-Branding

Das generierte PDF enthält automatisch:

### Design
- **Hintergrund:** #F7F4EF (BP:LeadSource Sand)
- **Text:** #1E1E1E (Dunkelgrau)
- **Akzente:** #B8973D (Gold)

### Header
```
BP:LeadSource
B2B Lead Generation Partner für den DACH-Raum
```

### Footer
```
Kontakt: leadsource@bp-shops.com
Generiert am [Datum]
```

### Layout
- **Format:** A4
- **Orientierung:** Hochformat
- **Ränder:** 2cm
- **Schriftart:** Arial, Helvetica, sans-serif

---

## Workflow-Integration

### 1. Report fertigstellen
Nach Abschluss eines Kunden-Reports solltest du drei Markdown-Dateien haben:
- `final-package.md` – Vollständiges Paket
- `leads.md` – Lead-Liste
- `emails.md` – E-Mail-Templates

### 2. Export ausführen
```bash
node export-package.js [Kundenname] [pfad/zu/final-package.md] [pfad/zu/leads.md] [pfad/zu/emails.md]
```

### 3. Ergebnis überprüfen
Der Export erstellt:
- Einen Ordner: `C:\Users\phili\bpleadsource\kunden\[kundenname]-[datum]\`
- Drei Markdown-Dateien im Ordner
- Ein professionelles PDF: `[kundenname]-leads-[datum].pdf`

### 4. Übergabe an Jonas Weber
Teile den vollständigen Pfad zum Kundenpaket:
```
C:\Users\phili\bpleadsource\kunden\[kundenname]-[datum]\
```

---

## Troubleshooting

### Problem: "markdown-pdf not found"

**Lösung:**
```bash
cd C:\Users\phili\bpleadsource\kunden
npm install
```

### Problem: PDF-Generierung schlägt fehl

**Fallback-Option:** Das Script versucht automatisch `pandoc` als Fallback.

**Pandoc installieren (optional):**
```bash
# Windows (via Chocolatey)
choco install pandoc wkhtmltopdf

# Oder Download von:
# https://pandoc.org/installing.html
# https://wkhtmltopdf.org/downloads.html
```

### Problem: Datei nicht gefunden

**Überprüfe:**
1. Sind alle drei Markdown-Dateien vorhanden?
2. Sind die Pfade korrekt?
3. Verwende absolute Pfade wenn relative nicht funktionieren:
   ```bash
   node export-package.js KundenName \
     C:/vollständiger/pfad/zu/final-package.md \
     C:/vollständiger/pfad/zu/leads.md \
     C:/vollständiger/pfad/zu/emails.md
   ```

---

## Testen

### Schnelltest mit Beispieldaten
```bash
npm test
```

oder

```bash
node export-package.js test-kunde test-data/final-package.md test-data/leads.md test-data/emails.md
```

---

## Nächste Schritte für Jonas Weber

Nach dem Export:

1. ✅ **Ordner überprüfen**
   - Öffne `C:\Users\phili\bpleadsource\kunden\[kundenname]-[datum]\`
   - Prüfe alle drei Markdown-Dateien
   - Öffne das PDF und überprüfe Layout/Branding

2. 📧 **Kundenübergabe**
   - PDF per E-Mail an Kunden senden
   - Optional: Markdown-Dateien für internen Gebrauch behalten

3. 📊 **Follow-Up planen**
   - Nächste Schritte mit Kunden abstimmen
   - Tracking-Dashboard einrichten

---

## Technische Details

### Dependencies
```json
{
  "markdown-pdf": "^11.0.0"
}
```

### Node.js Version
- Minimum: Node.js 14.0.0
- Empfohlen: Node.js 18.x oder höher

### Unterstützte Plattformen
- ✅ Windows 10/11
- ✅ macOS (mit angepassten Pfaden)
- ✅ Linux (mit angepassten Pfaden)

---

## Support

Bei Fragen oder Problemen:
- **E-Mail:** leadsource@bp-shops.com
- **Dokumentation:** Diese README.md

---

**Version:** 1.0.0
**Letztes Update:** 2026-04-11
**Autor:** BP:LeadSource Reporting Agent
