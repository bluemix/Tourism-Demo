import 'dart:ui';

import 'package:redux/redux.dart';
import 'package:tourism_demo/redux/common/common_actions.dart';

final changeLocaleReducer = combineReducers<Locale>([
  TypedReducer<Locale, ChangeLanguageAction>(_changeLanguageReducer),
]);

Locale _changeLanguageReducer(Locale locale, ChangeLanguageAction action) {

  return action.locale;
}
