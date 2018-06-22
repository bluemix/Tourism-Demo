
import 'package:flutter/widgets.dart';

class Translations {
  Translations(this.locale);

  final Locale locale;

  static Translations of(BuildContext context) {
    return Localizations.of<Translations>(context, Translations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'title': 'Tourism Demo',
      'language': 'عربي',
      'june': 'June',
      'days': 'Days',
      'hotels': 'hotels',
      'star': 'star',
    },
    'ar': {
      'title': 'تطبيق سياحة',
      'language': 'English',
      'june': 'حزيران',
      'days': 'أيام',
      'star': 'نجوم',
      'hotels': 'فنادق',
    },
  };

  Map get _vocabularies => _localizedValues[locale.languageCode];

  String get title {
    return _vocabularies['title'];
  }

  String get language {
    return _vocabularies['language'];
  }

  String get june {
    return _vocabularies['june'];
  }

  String get days {
    return _vocabularies['days'];
  }

  String get hotels {
    return _vocabularies['hotels'];
  }

  String get star {
    return _vocabularies['star'];
  }
}
