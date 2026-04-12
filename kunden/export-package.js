#!/usr/bin/env node

/**
 * BP:LeadSource Kundenpaket Export & PDF Generator
 *
 * Verwendung:
 *   node export-package.js <kundenname> <final-package.md> <leads.md> <emails.md>
 *
 * Erstellt:
 * - Lokalen Ordner: C:\Users\phili\bpleadsource\kunden\[kundenname]-[datum]\
 * - Kopiert die drei Markdown-Dateien
 * - Generiert professionelles PDF mit BP:LeadSource Branding
 */

const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');

// Argumente validieren
if (process.argv.length < 6) {
  console.error('Verwendung: node export-package.js <kundenname> <final-package.md> <leads.md> <emails.md>');
  process.exit(1);
}

const kundenname = process.argv[2];
const finalPackagePath = process.argv[3];
const leadsPath = process.argv[4];
const emailsPath = process.argv[5];

// Validiere dass alle Dateien existieren
const files = [
  { path: finalPackagePath, name: 'final-package.md' },
  { path: leadsPath, name: 'leads.md' },
  { path: emailsPath, name: 'emails.md' }
];

for (const file of files) {
  if (!fs.existsSync(file.path)) {
    console.error(`❌ Datei nicht gefunden: ${file.path}`);
    process.exit(1);
  }
}

// Datum formatieren: YYYY-MM-DD
const heute = new Date().toISOString().split('T')[0];

// Zielordner erstellen
const baseDir = 'C:\\Users\\phili\\bpleadsource\\kunden';
const targetDir = path.join(baseDir, `${kundenname}-${heute}`);

if (!fs.existsSync(targetDir)) {
  fs.mkdirSync(targetDir, { recursive: true });
  console.log(`✅ Ordner erstellt: ${targetDir}`);
} else {
  console.log(`📁 Ordner existiert bereits: ${targetDir}`);
}

// Markdown-Dateien kopieren
for (const file of files) {
  const targetPath = path.join(targetDir, file.name);
  fs.copyFileSync(file.path, targetPath);
  console.log(`✅ Kopiert: ${file.name}`);
}

// PDF erstellen mit markdown-pdf
const pdfName = `${kundenname}-leads-${heute}.pdf`;
const pdfPath = path.join(targetDir, pdfName);

console.log('\n📄 Erstelle PDF...');

// CSS für BP:LeadSource Branding
const cssContent = `
body {
  font-family: 'Arial', 'Helvetica', sans-serif;
  background-color: #F7F4EF;
  color: #1E1E1E;
  line-height: 1.6;
  padding: 40px;
  max-width: 800px;
  margin: 0 auto;
}

h1, h2, h3 {
  color: #B8973D;
  font-weight: 600;
}

h1 {
  font-size: 28px;
  border-bottom: 3px solid #B8973D;
  padding-bottom: 10px;
  margin-bottom: 30px;
}

h2 {
  font-size: 22px;
  margin-top: 30px;
  margin-bottom: 15px;
}

h3 {
  font-size: 18px;
  margin-top: 20px;
  margin-bottom: 10px;
}

p {
  margin-bottom: 15px;
}

ul, ol {
  margin-left: 20px;
  margin-bottom: 15px;
}

li {
  margin-bottom: 8px;
}

code {
  background-color: #E8E5DF;
  padding: 2px 6px;
  border-radius: 3px;
  font-family: 'Courier New', monospace;
}

pre {
  background-color: #E8E5DF;
  padding: 15px;
  border-radius: 5px;
  overflow-x: auto;
  border-left: 4px solid #B8973D;
}

table {
  width: 100%;
  border-collapse: collapse;
  margin-bottom: 20px;
}

th, td {
  padding: 10px;
  text-align: left;
  border-bottom: 1px solid #D0CCC5;
}

th {
  background-color: #B8973D;
  color: #F7F4EF;
  font-weight: 600;
}

a {
  color: #B8973D;
  text-decoration: none;
}

a:hover {
  text-decoration: underline;
}

blockquote {
  border-left: 4px solid #B8973D;
  padding-left: 20px;
  margin-left: 0;
  font-style: italic;
  color: #4A4A4A;
}

.header {
  text-align: center;
  margin-bottom: 40px;
  padding-bottom: 20px;
  border-bottom: 2px solid #B8973D;
}

.header h1 {
  color: #B8973D;
  font-size: 32px;
  margin-bottom: 5px;
  border: none;
}

.header p {
  color: #1E1E1E;
  font-size: 14px;
}

.footer {
  text-align: center;
  margin-top: 40px;
  padding-top: 20px;
  border-top: 2px solid #B8973D;
  font-size: 12px;
  color: #6A6A6A;
}
`;

const cssPath = path.join(targetDir, 'bp-style.css');
fs.writeFileSync(cssPath, cssContent);

// Markdown mit Header/Footer erweitern
const finalPackageContent = fs.readFileSync(finalPackagePath, 'utf-8');
const enhancedMarkdown = `
<div class="header">
  <h1>BP:LeadSource</h1>
  <p>B2B Lead Generation Partner für den DACH-Raum</p>
</div>

${finalPackageContent}

<div class="footer">
  <p>Kontakt: <a href="mailto:leadsource@bp-shops.com">leadsource@bp-shops.com</a></p>
  <p>Generiert am ${new Date().toLocaleDateString('de-DE', { day: '2-digit', month: '2-digit', year: 'numeric' })}</p>
</div>
`;

const enhancedMdPath = path.join(targetDir, 'enhanced-package.md');
fs.writeFileSync(enhancedMdPath, enhancedMarkdown);

// PDF generieren mit markdown-pdf
try {
  // markdown-pdf nutzt Puppeteer im Hintergrund
  const mdToPdf = require('markdown-pdf');

  const options = {
    cssPath: cssPath,
    paperFormat: 'A4',
    paperOrientation: 'portrait',
    paperBorder: '2cm',
    renderDelay: 1000,
    runningsPath: null
  };

  mdToPdf(options)
    .from(enhancedMdPath)
    .to(pdfPath, () => {
      console.log(`✅ PDF erstellt: ${pdfPath}`);

      // Aufräumen
      fs.unlinkSync(cssPath);
      fs.unlinkSync(enhancedMdPath);

      console.log('\n✨ Export abgeschlossen!');
      console.log(`\n📦 Finales Paket:\n   ${targetDir}`);
      console.log(`\n📄 PDF:\n   ${pdfPath}`);
    });

} catch (error) {
  console.error('❌ Fehler bei PDF-Generierung:', error.message);
  console.log('\n💡 Fallback: Verwende pandoc für PDF-Generierung...');

  // Fallback auf pandoc wenn markdown-pdf nicht verfügbar
  try {
    const pandocCmd = `pandoc "${enhancedMdPath}" -o "${pdfPath}" --pdf-engine=wkhtmltopdf -V geometry:margin=2cm -V papersize=a4 --css="${cssPath}"`;
    execSync(pandocCmd, { stdio: 'inherit' });

    console.log(`✅ PDF erstellt (via pandoc): ${pdfPath}`);

    // Aufräumen
    fs.unlinkSync(cssPath);
    fs.unlinkSync(enhancedMdPath);

    console.log('\n✨ Export abgeschlossen!');
    console.log(`\n📦 Finales Paket:\n   ${targetDir}`);
    console.log(`\n📄 PDF:\n   ${pdfPath}`);
  } catch (pandocError) {
    console.error('❌ Auch pandoc fehlgeschlagen:', pandocError.message);
    console.log('\n⚠️  Markdown-Dateien wurden erfolgreich exportiert.');
    console.log('📄 Für PDF-Generierung bitte markdown-pdf oder pandoc installieren.');
    process.exit(1);
  }
}
