import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:tourism_demo/redux/destination_info/destination_info_state.dart';
import 'package:tourism_demo/redux/destinations/destinations_state.dart';
import 'package:tourism_demo/ui/destinations/destination_list_tile.dart';

@immutable
class AppState {
  AppState({@required this.destinationsState, this.destinationInfoState});

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

  void changeLanguage() {
    if (_appLocale == arLocale) {
      _appLocale = enLocale;
    } else {
      _appLocale = arLocale;
    }
  }

  final DestinationsState destinationsState;
  final DestinationInfoState destinationInfoState;

  factory AppState.initial() {
    return AppState(
        destinationsState: DestinationsState.initial(),
        destinationInfoState: DestinationInfoState.initial());
  }

  AppState copyWith({
    DestinationsState destinationsState,
    DestinationInfoState destinationInfoState,
  }) {
    return AppState(
      destinationsState: destinationsState ?? this.destinationsState,
      destinationInfoState: destinationInfoState ?? this.destinationInfoState,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          destinationsState == other.destinationsState &&
          destinationInfoState == other.destinationInfoState;

  @override
  int get hashCode => destinationsState.hashCode ^ destinationInfoState.hashCode;
}
