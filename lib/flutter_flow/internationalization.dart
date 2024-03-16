import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'es', 'zh_Hans', 'ar', 'th'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? esText = '',
    String? zh_HansText = '',
    String? arText = '',
    String? thText = '',
  }) =>
      [enText, esText, zh_HansText, arText, thText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    '48w6z87k': {
      'en': '',
      'ar': '',
      'es': '',
      'th': '',
      'zh_Hans': '',
    },
    'ae5t32es': {
      'en': 'Spanish',
      'ar': '',
      'es': '',
      'th': '',
      'zh_Hans': '',
    },
    'vwytv2ji': {
      'en': 'Mandarin',
      'ar': '',
      'es': '',
      'th': '',
      'zh_Hans': '',
    },
    'jimjfoh8': {
      'en': 'French',
      'ar': '',
      'es': '',
      'th': '',
      'zh_Hans': '',
    },
    'qwkvw44r': {
      'en': 'Arabic',
      'ar': '',
      'es': '',
      'th': '',
      'zh_Hans': '',
    },
    'fwt3bcth': {
      'en': 'Thai',
      'ar': '',
      'es': '',
      'th': '',
      'zh_Hans': '',
    },
    'z8tpfzge': {
      'en': 'Select Language',
      'ar': '',
      'es': '',
      'th': '',
      'zh_Hans': '',
    },
    'tosutiwk': {
      'en': 'Search for an item...',
      'ar': '',
      'es': '',
      'th': '',
      'zh_Hans': '',
    },
    'pqumyi2e': {
      'en':
          'what made you visit the office today? \n\nQu\'est-ce qui vous a amené à consulter aujourd\'hui ?',
      'ar': '',
      'es': '',
      'th': '',
      'zh_Hans': '',
    },
    'pt4zp0fj': {
      'en': 'Je ai mal au coeur.\n\nI feel nauseous.',
      'ar': '',
      'es': '',
      'th': '',
      'zh_Hans': '',
    },
    '7w9r7pls': {
      'en': 'Doctor',
      'ar': '',
      'es': '',
      'th': '',
      'zh_Hans': '',
    },
    'm41ranbt': {
      'en': 'Patient',
      'ar': '',
      'es': '',
      'th': '',
      'zh_Hans': '',
    },
    't52asf81': {
      'en': 'Download TXT file',
      'ar': '',
      'es': '',
      'th': '',
      'zh_Hans': '',
    },
    'h17t0253': {
      'en': 'docspeak 2024. All Rights Reserved.',
      'ar': '',
      'es': '',
      'th': '',
      'zh_Hans': '',
    },
    '0aukya3b': {
      'en': 'Home',
      'ar': '',
      'es': '',
      'th': '',
      'zh_Hans': '',
    },
  },
  // Miscellaneous
  {
    'ohi71ink': {
      'en': '',
      'ar': '',
      'es': '',
      'th': '',
      'zh_Hans': '',
    },
    'oxjw07pp': {
      'en': '',
      'ar': '',
      'es': '',
      'th': '',
      'zh_Hans': '',
    },
    'hmmkq75u': {
      'en': '',
      'ar': '',
      'es': '',
      'th': '',
      'zh_Hans': '',
    },
    'u2zp5cq4': {
      'en': '',
      'ar': '',
      'es': '',
      'th': '',
      'zh_Hans': '',
    },
    'qe2o5jgh': {
      'en': '',
      'ar': '',
      'es': '',
      'th': '',
      'zh_Hans': '',
    },
    'gey8vmr7': {
      'en': '',
      'ar': '',
      'es': '',
      'th': '',
      'zh_Hans': '',
    },
    'sh0a5qhf': {
      'en': '',
      'ar': '',
      'es': '',
      'th': '',
      'zh_Hans': '',
    },
    'ilvsaxxd': {
      'en': '',
      'ar': '',
      'es': '',
      'th': '',
      'zh_Hans': '',
    },
    'ceyl9r8v': {
      'en': '',
      'ar': '',
      'es': '',
      'th': '',
      'zh_Hans': '',
    },
    '4w702b1n': {
      'en': '',
      'ar': '',
      'es': '',
      'th': '',
      'zh_Hans': '',
    },
    'phpx8g7r': {
      'en': '',
      'ar': '',
      'es': '',
      'th': '',
      'zh_Hans': '',
    },
    '2nvm84fg': {
      'en': '',
      'ar': '',
      'es': '',
      'th': '',
      'zh_Hans': '',
    },
    'nj25svwu': {
      'en': '',
      'ar': '',
      'es': '',
      'th': '',
      'zh_Hans': '',
    },
    '0jabp8yi': {
      'en': '',
      'ar': '',
      'es': '',
      'th': '',
      'zh_Hans': '',
    },
    'dsh7uodn': {
      'en': '',
      'ar': '',
      'es': '',
      'th': '',
      'zh_Hans': '',
    },
    'nyqnhw4z': {
      'en': '',
      'ar': '',
      'es': '',
      'th': '',
      'zh_Hans': '',
    },
    'la9dld0p': {
      'en': '',
      'ar': '',
      'es': '',
      'th': '',
      'zh_Hans': '',
    },
    'ou9ktdsz': {
      'en': '',
      'ar': '',
      'es': '',
      'th': '',
      'zh_Hans': '',
    },
    'u9ijdzfm': {
      'en': '',
      'ar': '',
      'es': '',
      'th': '',
      'zh_Hans': '',
    },
    'mqu24amx': {
      'en': '',
      'ar': '',
      'es': '',
      'th': '',
      'zh_Hans': '',
    },
    'fnmmtlbx': {
      'en': '',
      'ar': '',
      'es': '',
      'th': '',
      'zh_Hans': '',
    },
    '5qsm7a28': {
      'en': '',
      'ar': '',
      'es': '',
      'th': '',
      'zh_Hans': '',
    },
    'e1zxqsa1': {
      'en': '',
      'ar': '',
      'es': '',
      'th': '',
      'zh_Hans': '',
    },
    '56dxqevq': {
      'en': '',
      'ar': '',
      'es': '',
      'th': '',
      'zh_Hans': '',
    },
    '6d7xy02f': {
      'en': '',
      'ar': '',
      'es': '',
      'th': '',
      'zh_Hans': '',
    },
  },
].reduce((a, b) => a..addAll(b));
