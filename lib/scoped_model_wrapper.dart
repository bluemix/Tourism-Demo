import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:tourism_demo/main.dart';

class ScopeModelWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<AppModel>(model: AppModel(), child: MyApp());
  }
}

class AppModel extends Model {
  static const Locale arLocale = Locale('ar');
  static const Locale enLocale = Locale('en');

  Locale _appLocale = arLocale;
  Locale get appLocal => _appLocale ?? arLocale;
  bool get isAr => arLocale == _appLocale;

  List<Locale> get supportedLocales => [
                enLocale,
                arLocale,
              ];

  void chagneLanguge() {
    if (_appLocale == arLocale) {
      _appLocale = enLocale;
    } else {
      _appLocale = arLocale;
    }
    notifyListeners();
  }
}
