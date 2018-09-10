

import 'dart:ui';

import 'package:meta/meta.dart';
import 'package:redux/redux.dart';
import 'package:tourism_demo/models/loading_status.dart';
import 'package:tourism_demo/redux/app/app_state.dart';
import 'package:tourism_demo/redux/destinations/destinations_actions.dart';
import 'package:tourism_demo/redux/destinations/destinations_state.dart';

class DestinationsViewModel {
  DestinationsViewModel({
    @required this.status,
    @required this.destinationsState,
    @required this.refreshDestinations,
    this.locale,
    this.changeLanguage
  });

  final LoadingStatus status;
  final DestinationsState destinationsState;
  final Function refreshDestinations;

  final Locale locale;
  final Function changeLanguage;

  static DestinationsViewModel fromStore(Store<AppState> store) {
    return DestinationsViewModel(
      status: store.state.destinationsState.loadingStatus,
      destinationsState: store.state.destinationsState,
      refreshDestinations: () => store.dispatch(RefreshDestinationsAction()),
      locale: store.state.appLocale,
//      changeLanguage: () => store.state.changeLanguage()
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DestinationsViewModel &&
          runtimeType == other.runtimeType &&
          status == other.status &&
          refreshDestinations == other.refreshDestinations &&
          destinationsState == other.destinationsState;

  @override
  int get hashCode =>
      status.hashCode ^
      refreshDestinations.hashCode ^
      destinationsState.hashCode;
}
