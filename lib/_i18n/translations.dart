
import 'package:flutter/widgets.dart';

class Translations {
  Translations(this.locale);

  final Locale locale;

  static Translations of(BuildContext context) {
    return Localizations.of<Translations>(context, Translations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'title': 'i18n Demo',
      'message': 'Hello World',
      'change_language': 'تبديل اللغة',
    },
    'ar': {
      'title': 'مثال i18n',
      'message': 'مرحباً',
      'change_language': 'Change language',
    },
  };

  String get title {
    return _localizedValues[locale.languageCode]['title'];
  }

  String get message {
    return _localizedValues[locale.languageCode]['message'];
  }

  String get changeLanguage {
    return _localizedValues[locale.languageCode]['change_language'];
  }
}
