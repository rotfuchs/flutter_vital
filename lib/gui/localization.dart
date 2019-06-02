import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;

class GuiLocalizations {
  GuiLocalizations(this.locale);

  final Locale locale;

  static GuiLocalizations of(BuildContext context) {
    return Localizations.of<GuiLocalizations>(context, GuiLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'title': 'Hello World',
      'dashboard': 'Dashboard',
      'dashboard_title': 'Last 7 days',
      'blood_pressure_values': 'Blood pressure values',
      'please_enter_numeric_value': 'Please enter a numeric value',
      'edit_entries': 'Edit Entries',
      'add_entry': 'Add entry',
      'settings': 'Settings',
      'from': 'From',
      'about': 'About',
      'save': 'Save',
      'saved_values_successfull': 'Saved values successfull!',
      'deleted_values_successfull': 'Deleted values successfull!',
      'dark_purple_name': 'Dark purple theme',
      'dark_blue_name': 'Dark blue theme',
      'dark_red_name': 'Dark red theme',
      'bright_blue_name': 'Bright blue theme',
      'switch_theme': 'Switch theme',
      'developer': 'Developer',
      'license': 'License',
      'source_code': 'Source Code',
      'contact': 'Contact',
      'range_values': 'Range values',
      'diastolic': 'Diastolic',
      'systolic': 'Systolic',
      'pulse': 'Pulse',
      'reset_range_values': 'Reset range values',
      'no_data_available': 'No data available',
      'average_value': 'average value',
      'ascending_trend': 'ascending trend',
      'descending_trend': 'descending trend'
    },
    'de': {
      'title': 'Hola Mundo',
      'dashboard': 'Dashboard',
      'dashboard_title': 'Die letzten 7 Tage',
      'blood_pressure_values': 'Blutdruckwerte',
      'please_enter_numeric_value': 'Bitte einen nummerischen Wert eingeben',
      'edit_entries': 'Einträge bearbeiten',
      'add_entry': 'Eintrag hinzufügen',
      'settings': 'Einstellungen',
      'from': 'Von',
      'about': 'Info',
      'save': 'Speichern',
      'saved_values_successfull': 'Die Werte wurden erfolgreich gespeichert!',
      'deleted_values_successfull': 'Die Werte wurden erfolgreich gelöscht',
      'dark_purple_name': 'schwarz/lila',
      'dark_blue_name': 'schwarz/blau',
      'dark_red_name': 'schwarz/rot',
      'bright_blue_name': 'weiß/blau',
      'switch_theme': 'Theme wechseln',
      'developer': 'Entwickler',
      'license': 'Lizenz',
      'source_code': 'Quellcode',
      'contact': 'Kontakt',
      'range_values': 'Wertbereiche',
      'diastolic': 'Diastolisch',
      'systolic': 'Systolisch',
      'pulse': 'Puls',
      'reset_range_values': 'Wertebereiche zurücksetzen',
      'no_data_available': 'Keine Werte verfügbar',
      'average_value': 'Durchschnittswert',
      'ascending_trend': 'Tendenz steigend',
      'descending_trend': 'Tendenz fallend'
    },
  };

  String trans(String phrase) {
    if(_localizedValues[locale.languageCode][phrase] == null)
      return phrase;

    return _localizedValues[locale.languageCode][phrase];
  }
}

class GuiLocalizationsDelegate extends LocalizationsDelegate<GuiLocalizations> {
  const GuiLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'de'].contains(locale.languageCode);

  @override
  Future<GuiLocalizations> load(Locale locale) {
    return SynchronousFuture<GuiLocalizations>(GuiLocalizations(locale));
  }

  @override
  bool shouldReload(GuiLocalizationsDelegate old) => false;
}