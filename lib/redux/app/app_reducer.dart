import 'package:tourism_demo/redux/app/app_state.dart';
import 'package:tourism_demo/redux/destinations/destinations_reducer.dart';

AppState appReducer(AppState state, dynamic action) {
  return new AppState(
    destinationsState: destinationsReducer(state.destinationsState, action),
  );
}
