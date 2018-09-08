import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:tourism_demo/i18n/translations.dart';
import 'package:tourism_demo/i18n/translations_delegate.dart';
import 'package:tourism_demo/redux/app/app_state.dart';
import 'package:tourism_demo/redux/store.dart';
import 'package:tourism_demo/routes.dart';
import 'package:tourism_demo/styles/app_theme.dart';
import 'package:tourism_demo/ui/destination_info/destination_info_page.dart';
import 'package:tourism_demo/ui/main_page.dart';

Future<Null> main() async {
  // ignore: deprecated_member_use
  MaterialPageRoute.debugEnableFadingRoutes = true;

  var store = await createStore();
  runApp(TourismApp(store));
}

class TourismApp extends StatefulWidget {
  TourismApp(this.store);

  final Store<AppState> store;

  @override
  _TourismAppState createState() => _TourismAppState();
}

class _TourismAppState extends State<TourismApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.black, //or set color with: Color(0xFF0000FF)
    ));

    return StoreProvider<AppState>(
      store: widget.store,
      child: MaterialApp(
        onGenerateTitle: (BuildContext context) =>
            Translations.of(context).title,
        theme: AppTheme.theme,
        localizationsDelegates: [
          const TranslationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        locale: widget.store.state.appLocale,
        supportedLocales: widget.store.state.supportedLocales,
//        routes: {
//          AppRoutes.destinations: (context) {
//            return StoreBuilder<AppState>(
//              // onInit: (store) => store.dispatch(LoadTodosAction()),
//              builder: (context, store) {
//                return Center();
//              },
//            );
//          },
//          AppRoutes.destinationInfo: (context) {
//            return StoreBuilder<AppState>(
//              // onInit: (store) => store.dispatch(LoadTodosAction()),
//              builder: (context, store) {
//                return DestinationInfoPage();
//              },
//            );
//          },
//        },
        home: const MainPage(),
      ),
    );
  }
}
