import 'package:redux/redux.dart';
import 'package:tourism_demo/models/loading_status.dart';
import 'package:tourism_demo/redux/destinations/destinations_actions.dart';
import 'package:tourism_demo/redux/destinations/destinations_state.dart';

final destinationsReducer = combineReducers<DestinationsState>([
  TypedReducer<DestinationsState, FetchDestinationsAction>(_fetchingDestinations),
  TypedReducer<DestinationsState, ReceivedDestinationsAction>(_receivedDestinations),
  TypedReducer<DestinationsState, ErrorLoadingDestinationsAction>(_errorLoadingDestinations),
]);

DestinationsState _fetchingDestinations(DestinationsState destinationsState, FetchDestinationsAction action) {
  return destinationsState.copyWith(loadingStatus: LoadingStatus.loading);
}

DestinationsState _receivedDestinations(
    DestinationsState destinationsState, ReceivedDestinationsAction action) {
  return destinationsState.copyWith(
      loadingStatus: LoadingStatus.success, destinations: action.destinations);
}

DestinationsState _errorLoadingDestinations(
    DestinationsState destinationsState, ErrorLoadingDestinationsAction action) {
  return destinationsState.copyWith(
      loadingStatus: LoadingStatus.error, errorMessage: action.errorStr);
}
