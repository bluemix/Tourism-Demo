import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';
import 'package:tourism_demo/redux/app/app_state.dart';

class HomeViewModel {
  HomeViewModel({this.locale, this.changeLanguage});

  final Locale locale;
  final Function changeLanguage;

  static HomeViewModel fromStore(Store<AppState> store) {
    return HomeViewModel(
        locale: store.state.appLocale,
        changeLanguage: () => store.state.changeLanguage());
  }


  bool isAr() {
    return locale == AppState.arLocale;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeViewModel &&
          runtimeType == other.runtimeType &&
          locale == other.locale;

  @override
  int get hashCode => locale.hashCode;
}
