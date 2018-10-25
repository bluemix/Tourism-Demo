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
import 'package:tourism_demo/styles/app_theme.dart';
import 'package:tourism_demo/ui/main_page.dart';

Future<Null> main() async {
  // ignore: deprecated_member_use
//  MaterialPageRoute.debugEnableFadingRoutes = true;

  var store = await createStore();
  runApp(TourismApp(store));
}

class TourismApp extends StatefulWidget {
  TourismApp(this.store);

  final Store<AppState> store;

  @override
  _TourismAppState createState() => _TourismAppState();
}

class _TourismAppState extends State<TourismApp> with SingleTickerProviderStateMixin {
  Locale prevLocale;

  AnimationController fadeController;

  @override
  void initState() {
    fadeController = new AnimationController(
      duration: const Duration(milliseconds: 1000),
      debugLabel: 'preview banner',
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return StoreProvider<AppState>(
        store: widget.store,
        child: new StoreConnector<AppState, AppState>(
          converter: (store) => store.state,
          ignoreChange: (store) => prevLocale == store.appLocale,
          builder: (context, appState) {
            if (prevLocale == null) {
              prevLocale = appState.appLocale;
            }
//
            bool shouldFade = prevLocale != appState.appLocale;
            if (shouldFade) {
              prevLocale = appState.appLocale;
            }

            return Container(
              color: Theme.of(context).backgroundColor,
              child: FadeTransition(
                  child: MaterialApp(
                    onGenerateTitle: (BuildContext context) => Translations.of(context).title,
                    theme: AppTheme.theme,
                    localizationsDelegates: [
                      const TranslationsDelegate(),
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                    ],
                    locale: appState.appLocale,
                    supportedLocales: widget.store.state.supportedLocales,
                    home: const MainPage(),
                  ),
                  opacity: new CurvedAnimation(
                    parent: fadeController
                      ..reset()
                      ..forward(),
                    curve: const Interval(0.0, 1.0, curve: Curves.ease),
                  )),
            );

          },
        ));
  }
}
