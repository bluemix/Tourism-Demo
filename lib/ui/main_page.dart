import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tourism_demo/i18n/translations.dart';
import 'package:tourism_demo/redux/app/app_state.dart';
import 'package:tourism_demo/redux/common/common_actions.dart';
import 'package:tourism_demo/styles/app_colors.dart';
import 'package:tourism_demo/ui/destinations/destinations_page.dart';

class MainPage extends StatefulWidget {
  const MainPage();

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  static final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>();

  Widget _appBody(Widget body) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, state) {
        return bodyScrollView(body);
      },
    );
  }

  Widget bodyScrollView(Widget body) {
//    VoidCallback changeLanguage =
//        StoreProvider.of<AppState>(context).state.changeLanguage;

    return CustomScrollView(
      // physics: new PageScrollPhysics(),

      slivers: <Widget>[
        new SliverAppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          title: new Text(
            Translations.of(context).title,
            style: Theme.of(context).textTheme.display1,
          ),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size(double.infinity, 0.0),
            child: Divider(color: Colors.white, height: 1.0,),
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text(Translations.of(context).language,
                  style: Theme.of(context).textTheme.button),
              onPressed: () {
                var store = StoreProvider.of<AppState>(context);
                if (store.state.appLocale == AppState.arLocale) {
                  store.dispatch(ChangeLanguageAction(locale: AppState.enLocale));
                } else {
                  store.dispatch(ChangeLanguageAction(locale: AppState.arLocale));
                }
              },
            ),
          ],
        ),

//        SliverList(
//          delegate: new SliverChildBuilderDelegate((context, index) {
//            return body;
//          }, childCount: 1),
//        )

        new SliverFillRemaining(
          child: body,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.passthrough,
      alignment: Alignment.topCenter,
      children: <Widget>[
        new Container(
          decoration: gradientBackDecoration(),
          child: new Container(
            decoration: new BoxDecoration(boxShadow: [
              new BoxShadow(
                  color: Colors.black12,
                  blurRadius: 30.0,
                  offset: const Offset(0.0, 30.0)),
            ]),
          ),
        ),
        new Scaffold(
            backgroundColor: Colors.transparent,
            body: _appBody(DestinationsPage())),
      ],
    );
    ;
  }
}
