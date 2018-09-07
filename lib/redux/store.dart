import 'dart:async';

import 'package:redux/redux.dart';
import 'package:tourism_demo/networking/server_api.dart';
import 'package:tourism_demo/redux/app/app_state.dart';
import 'package:tourism_demo/redux/app/app_reducer.dart';
import 'package:tourism_demo/redux/destinations/destinations_middleware.dart';

Future<Store<AppState>> createStore() async {
  var serverApi = ServerAPI();

  return Store(
    appReducer,
    initialState: AppState.initial(),
    distinct: true,
    middleware: [
      DestinationsMiddleware(serverApi),
    ],
  );
}
