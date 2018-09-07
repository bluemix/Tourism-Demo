import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:tourism_demo/i18n/translations.dart';

class TranslationsDelegate
    extends LocalizationsDelegate<Translations> {
  const TranslationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ar'].contains(locale.languageCode);

  @override
  Future<Translations> load(Locale locale) {
    return new SynchronousFuture<Translations>(
        new Translations(locale));
  }

  @override
  bool shouldReload(TranslationsDelegate old) => false;
}