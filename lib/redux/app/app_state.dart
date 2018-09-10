import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:tourism_demo/redux/destination_info/destination_info_state.dart';
import 'package:tourism_demo/redux/destinations/destinations_state.dart';

@immutable
class AppState {
  AppState(
      {@required this.destinationsState,
      this.destinationInfoState,
      this.appLocale});

  static const Locale arLocale = Locale('ar');
  static const Locale enLocale = Locale('en');

  // Locale _appLocale = enLocale;
//  Locale get appLocale => _appLocale ?? arLocale;
//
//  set appLocale(l) {
//    _appLocale = l;
//  }

  bool get isAr => arLocale == appLocale;

  List<Locale> get supportedLocales => [
        enLocale,
        arLocale,
      ];


  final DestinationsState destinationsState;
  final DestinationInfoState destinationInfoState;
  final Locale appLocale;

  factory AppState.initial() {
    return AppState(
        destinationsState: DestinationsState.initial(),
        destinationInfoState: DestinationInfoState.initial(),
        appLocale: arLocale);
  }

  AppState copyWith({
    DestinationsState destinationsState,
    DestinationInfoState destinationInfoState,
    Locale appLocale,
  }) {
    return AppState(
      destinationsState: destinationsState ?? this.destinationsState,
      destinationInfoState: destinationInfoState ?? this.destinationInfoState,
      appLocale: appLocale ?? this.appLocale,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          appLocale == other.appLocale &&
          destinationsState == other.destinationsState &&
          destinationInfoState == other.destinationInfoState;

  @override
  int get hashCode =>
      destinationsState.hashCode ^
      destinationInfoState.hashCode ^
      appLocale.hashCode;
}
