#!/usr/bin/env node
/**
 * BP:LeadSource Duplicate-Check Tool
 *
 * Prüft VORHER ob Leads bereits in der Datenbank existieren
 * Verwendung: node check_duplicates.js <firmenname1> <firmenname2> ...
 *
 * Exit Codes:
 *   0 = Alle Leads sind NEU (keine Duplicates)
 *   1 = DUPLICATE(S) gefunden! (Liste wird ausgegeben)
 *   2 = Fehler (Datenbank nicht gefunden, etc.)
 */

const XLSX = require('xlsx');
const path = require('path');
const fs = require('fs');

// Konfiguration
const DB_PATH = path.join(__dirname, 'BP_LeadSource_Datenbank.xlsx');
const SHEET_NAME = 'Leads'; // Annahme: Sheet heißt "Leads", kann angepasst werden

/**
 * Normalisiert Firmennamen für Vergleich
 * - Lowercase
 * - Entfernt GmbH, AG, Ltd, etc.
 * - Entfernt Sonderzeichen
 */
function normalizeName(name) {
  if (!name) return '';

  return name
    .toLowerCase()
    .trim()
    // Entferne Rechtsformen
    .replace(/\s+(gmbh|ag|ltd|inc|llc|ug|kg|ohg|eg|ev|gbr|se|sarl|sas)\.?$/gi, '')
    // Entferne "(haftungsbeschränkt)"
    .replace(/\s*\(.*?\)/g, '')
    // Entferne Sonderzeichen
    .replace(/[^a-z0-9äöüß\s]/g, '')
    // Entferne mehrfache Leerzeichen
    .replace(/\s+/g, ' ')
    .trim();
}

/**
 * Prüft ob Firmenname in der Datenbank existiert
 */
function checkDuplicates(companiesToCheck) {
  // 1. Prüfe ob Datenbank existiert
  if (!fs.existsSync(DB_PATH)) {
    console.error(`❌ FEHLER: Datenbank nicht gefunden: ${DB_PATH}`);
    process.exit(2);
  }

  // 2. Lade Excel-Datenbank
  let workbook;
  try {
    workbook = XLSX.readFile(DB_PATH);
  } catch (error) {
    console.error(`❌ FEHLER beim Laden der Datenbank: ${error.message}`);
    process.exit(2);
  }

  // 3. Finde das richtige Sheet
  let sheetName = SHEET_NAME;
  if (!workbook.Sheets[sheetName]) {
    // Fallback: Nutze erstes Sheet
    sheetName = workbook.SheetNames[0];
    console.log(`ℹ️  Hinweis: Sheet "Leads" nicht gefunden, verwende "${sheetName}"`);
  }

  const sheet = workbook.Sheets[sheetName];

  // 4. Konvertiere zu JSON
  // Hinweis: BP_LeadSource_Datenbank.xlsx hat 2 Header-Zeilen vor den Daten
  // Zeile 0: Titel, Zeile 1: Untertitel, Zeile 2: Header, ab Zeile 3: Daten
  const data = XLSX.utils.sheet_to_json(sheet, { range: 2 }); // Starte bei Zeile 2 (0-basiert)

  if (data.length === 0) {
    console.log('ℹ️  Datenbank ist leer - alle Leads sind neu');
    return { duplicates: [], newLeads: companiesToCheck };
  }

  // 5. Extrahiere alle existierenden Firmennamen
  // Versuche verschiedene mögliche Spaltennamen
  const possibleColumns = ['Firma', 'Firmenname', 'Company', 'Unternehmen', 'Name'];
  let companyColumn = null;

  for (const col of possibleColumns) {
    if (data[0].hasOwnProperty(col)) {
      companyColumn = col;
      break;
    }
  }

  if (!companyColumn) {
    console.error('❌ FEHLER: Keine Firmennamen-Spalte gefunden in der Datenbank');
    console.error('   Verfügbare Spalten:', Object.keys(data[0]).join(', '));
    process.exit(2);
  }

  console.log(`📊 Datenbank geladen: ${data.length} existierende Leads (Spalte: "${companyColumn}")`);

  // 6. Erstelle Set mit normalisierten Namen
  const existingCompanies = new Set(
    data
      .map(row => normalizeName(row[companyColumn]))
      .filter(name => name) // Entferne leere Namen
  );

  // 7. Prüfe jede zu checkende Firma
  const duplicates = [];
  const newLeads = [];

  for (const company of companiesToCheck) {
    const normalized = normalizeName(company);

    if (existingCompanies.has(normalized)) {
      duplicates.push(company);
    } else {
      newLeads.push(company);
    }
  }

  return { duplicates, newLeads, totalExisting: data.length };
}

/**
 * Main Function
 */
function main() {
  const args = process.argv.slice(2);

  if (args.length === 0) {
    console.log('BP:LeadSource Duplicate-Check Tool');
    console.log('');
    console.log('Verwendung:');
    console.log('  node check_duplicates.js <firmenname1> [<firmenname2> ...]');
    console.log('');
    console.log('Beispiel:');
    console.log('  node check_duplicates.js "Personio GmbH" "HubSpot Germany"');
    console.log('');
    console.log('Exit Codes:');
    console.log('  0 = Alle Leads NEU (keine Duplicates)');
    console.log('  1 = DUPLICATE(S) gefunden');
    console.log('  2 = Fehler');
    process.exit(0);
  }

  console.log('🔍 Duplicate-Check gestartet...');
  console.log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
  console.log(`📋 Zu prüfende Firmen: ${args.length}`);
  console.log('');

  const result = checkDuplicates(args);

  // Ausgabe: Neue Leads
  if (result.newLeads.length > 0) {
    console.log(`✅ NEUE LEADS (${result.newLeads.length}):`);
    result.newLeads.forEach((company, i) => {
      console.log(`   ${i + 1}. ${company}`);
    });
    console.log('');
  }

  // Ausgabe: Duplicates
  if (result.duplicates.length > 0) {
    console.log(`❌ DUPLICATES GEFUNDEN (${result.duplicates.length}):`);
    result.duplicates.forEach((company, i) => {
      console.log(`   ${i + 1}. ${company}`);
    });
    console.log('');
    console.log('⚠️  WARNUNG: Diese Leads existieren bereits in der Datenbank!');
    console.log('   → Bitte alternative Leads recherchieren');
    console.log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
    process.exit(1);
  }

  // Erfolg: Alle Leads sind neu
  console.log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
  console.log(`✅ Alle ${result.newLeads.length} Leads sind NEU - Research kann starten!`);
  process.exit(0);
}

// Script ausführen
main();
