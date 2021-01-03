// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Einkaufsliste`
  String get appName {
    return Intl.message(
      'Einkaufsliste',
      name: 'appName',
      desc: 'app name',
      args: [],
    );
  }

  /// `Montag`
  String get dayNameMonday {
    return Intl.message(
      'Montag',
      name: 'dayNameMonday',
      desc: '',
      args: [],
    );
  }

  /// `Dienstag`
  String get dayNameTuesday {
    return Intl.message(
      'Dienstag',
      name: 'dayNameTuesday',
      desc: '',
      args: [],
    );
  }

  /// `Mittwoch`
  String get dayNameWednesday {
    return Intl.message(
      'Mittwoch',
      name: 'dayNameWednesday',
      desc: '',
      args: [],
    );
  }

  /// `Donnerstag`
  String get dayNameThursday {
    return Intl.message(
      'Donnerstag',
      name: 'dayNameThursday',
      desc: '',
      args: [],
    );
  }

  /// `Freitag`
  String get dayNameFriday {
    return Intl.message(
      'Freitag',
      name: 'dayNameFriday',
      desc: '',
      args: [],
    );
  }

  /// `Samstag`
  String get dayNameSaturday {
    return Intl.message(
      'Samstag',
      name: 'dayNameSaturday',
      desc: '',
      args: [],
    );
  }

  /// `Sontag`
  String get dayNameSunday {
    return Intl.message(
      'Sontag',
      name: 'dayNameSunday',
      desc: '',
      args: [],
    );
  }

  /// `Einkaufsplan`
  String get navigationTabShoppingListTitle {
    return Intl.message(
      'Einkaufsplan',
      name: 'navigationTabShoppingListTitle',
      desc: '',
      args: [],
    );
  }

  /// `Essensplan`
  String get navigationTabMenuListTitle {
    return Intl.message(
      'Essensplan',
      name: 'navigationTabMenuListTitle',
      desc: '',
      args: [],
    );
  }

  /// `Einstellungen`
  String get navigationTabSettingsTitle {
    return Intl.message(
      'Einstellungen',
      name: 'navigationTabSettingsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Einkaufsliste`
  String get shoppingListTitle {
    return Intl.message(
      'Einkaufsliste',
      name: 'shoppingListTitle',
      desc: '',
      args: [],
    );
  }

  /// `Du kannst den Namen sowie die Kategorie ändern`
  String get shoppingItemDetailsHeadline {
    return Intl.message(
      'Du kannst den Namen sowie die Kategorie ändern',
      name: 'shoppingItemDetailsHeadline',
      desc: '',
      args: [],
    );
  }

  /// `Artikelname`
  String get shoppingItemDetailsItemInputHint {
    return Intl.message(
      'Artikelname',
      name: 'shoppingItemDetailsItemInputHint',
      desc: '',
      args: [],
    );
  }

  /// `Speichern`
  String get shoppingItemDetailsButtonSave {
    return Intl.message(
      'Speichern',
      name: 'shoppingItemDetailsButtonSave',
      desc: '',
      args: [],
    );
  }

  /// `Löschen`
  String get shoppingItemDetailsButtonDelete {
    return Intl.message(
      'Löschen',
      name: 'shoppingItemDetailsButtonDelete',
      desc: '',
      args: [],
    );
  }

  /// `Kategorien bearbeiten`
  String get shoppingItemDetailsButtonEditCategories {
    return Intl.message(
      'Kategorien bearbeiten',
      name: 'shoppingItemDetailsButtonEditCategories',
      desc: '',
      args: [],
    );
  }

  /// `Essensplan`
  String get menuListTitle {
    return Intl.message(
      'Essensplan',
      name: 'menuListTitle',
      desc: '',
      args: [],
    );
  }

  /// `Menu hinzufügen`
  String get menuListFabTooltip {
    return Intl.message(
      'Menu hinzufügen',
      name: 'menuListFabTooltip',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get menuDetailsTitle {
    return Intl.message(
      'Details',
      name: 'menuDetailsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Wähle Tag und Gericht`
  String get menuDetailsHeadline {
    return Intl.message(
      'Wähle Tag und Gericht',
      name: 'menuDetailsHeadline',
      desc: '',
      args: [],
    );
  }

  /// `Speichern`
  String get menuDetailsButtonSave {
    return Intl.message(
      'Speichern',
      name: 'menuDetailsButtonSave',
      desc: '',
      args: [],
    );
  }

  /// `Löschen`
  String get menuDetailsButtonDelete {
    return Intl.message(
      'Löschen',
      name: 'menuDetailsButtonDelete',
      desc: '',
      args: [],
    );
  }

  /// `Was möchtest du essen?`
  String get menuDetailsInputHint {
    return Intl.message(
      'Was möchtest du essen?',
      name: 'menuDetailsInputHint',
      desc: '',
      args: [],
    );
  }

  /// `Einstellungen`
  String get settingsTitle {
    return Intl.message(
      'Einstellungen',
      name: 'settingsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Allgemein`
  String get settingsSectionGeneralTitle {
    return Intl.message(
      'Allgemein',
      name: 'settingsSectionGeneralTitle',
      desc: '',
      args: [],
    );
  }

  /// `Kategorien`
  String get settingsSectionGeneralCategoryTitle {
    return Intl.message(
      'Kategorien',
      name: 'settingsSectionGeneralCategoryTitle',
      desc: '',
      args: [],
    );
  }

  /// `Kategorien bearbeiten`
  String get settingsSectionGeneralCategorySubtitle {
    return Intl.message(
      'Kategorien bearbeiten',
      name: 'settingsSectionGeneralCategorySubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Artikel`
  String get settingsSectionGeneralAllItemsTitle {
    return Intl.message(
      'Artikel',
      name: 'settingsSectionGeneralAllItemsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Artikel bearbeiten`
  String get settingsSectionGeneralAllItemsSubtitle {
    return Intl.message(
      'Artikel bearbeiten',
      name: 'settingsSectionGeneralAllItemsSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Kategorien`
  String get categoriesTitle {
    return Intl.message(
      'Kategorien',
      name: 'categoriesTitle',
      desc: '',
      args: [],
    );
  }

  /// `Kategorie hinzufügen`
  String get categoriesFabTooltip {
    return Intl.message(
      'Kategorie hinzufügen',
      name: 'categoriesFabTooltip',
      desc: '',
      args: [],
    );
  }

  /// `Kategoriename`
  String get categoriesAddDialogTitle {
    return Intl.message(
      'Kategoriename',
      name: 'categoriesAddDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `Abbrechen`
  String get categoriesAddDialogButtonCancel {
    return Intl.message(
      'Abbrechen',
      name: 'categoriesAddDialogButtonCancel',
      desc: '',
      args: [],
    );
  }

  /// `Speichern`
  String get categoriesAddDialogButtonSave {
    return Intl.message(
      'Speichern',
      name: 'categoriesAddDialogButtonSave',
      desc: '',
      args: [],
    );
  }

  /// `Möchtest du diese Kategorie wirklich löschen?`
  String get categoriesDeleteDialogTitle {
    return Intl.message(
      'Möchtest du diese Kategorie wirklich löschen?',
      name: 'categoriesDeleteDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `Abbrechen`
  String get categoriesDeleteDialogButtonCancel {
    return Intl.message(
      'Abbrechen',
      name: 'categoriesDeleteDialogButtonCancel',
      desc: '',
      args: [],
    );
  }

  /// `Löschen`
  String get categoriesDeleteDialogButtonDelete {
    return Intl.message(
      'Löschen',
      name: 'categoriesDeleteDialogButtonDelete',
      desc: '',
      args: [],
    );
  }

  /// `Alle Artikel`
  String get shoppingItemsTitle {
    return Intl.message(
      'Alle Artikel',
      name: 'shoppingItemsTitle',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}