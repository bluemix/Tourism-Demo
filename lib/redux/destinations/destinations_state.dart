import 'package:collection/collection.dart';
import 'package:meta/meta.dart';
import 'package:tourism_demo/models/destination.dart';
import 'package:tourism_demo/models/loading_status.dart';

@immutable
class DestinationsState {
  DestinationsState({
    @required this.loadingStatus,
    @required this.destinations,
    this.errorMessage
  });

  final LoadingStatus loadingStatus;
  final List<Destination> destinations;
  final String errorMessage;

  factory DestinationsState.initial() {
    return DestinationsState(
      loadingStatus: LoadingStatus.loading,
      destinations: <Destination>[],
      errorMessage: null,
    );
  }

  DestinationsState copyWith(
      {LoadingStatus loadingStatus,
      List<Destination> destinations,
      String errorMessage
      }) {
    return DestinationsState(
      loadingStatus: loadingStatus ?? this.loadingStatus,
      destinations: destinations ?? this.destinations,
      errorMessage: errorMessage ?? this.errorMessage
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DestinationsState &&
          runtimeType == other.runtimeType &&
          loadingStatus == other.loadingStatus &&
          errorMessage == other.errorMessage &&
          const IterableEquality().equals(destinations, other.destinations);

  @override
  int get hashCode =>
      loadingStatus.hashCode ^
      errorMessage.hashCode ^
      destinations.hashCode;
}
