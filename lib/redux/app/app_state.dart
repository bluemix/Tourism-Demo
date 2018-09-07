
import 'package:flutter/material.dart';

import 'package:meta/meta.dart';
import 'package:tourism_demo/redux/destinations/destinations_state.dart';

@immutable
class AppState {
  AppState({
    @required this.destinationsState,
  });

  static const Locale arLocale = Locale('ar');
  static const Locale enLocale = Locale('en');

  Locale _appLocale = arLocale;
  // Locale _appLocale = enLocale;
  Locale get appLocale => _appLocale ?? arLocale;
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
  }

  final DestinationsState destinationsState;


  factory AppState.initial() {
    return AppState(
      destinationsState: DestinationsState.initial(),

    );
  }

  AppState copyWith({
    DestinationsState destinationsState,
  }) {
    return AppState(
      destinationsState: destinationsState ?? this.destinationsState,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          destinationsState == other.destinationsState;

  @override
  int get hashCode =>
      destinationsState.hashCode;
}
