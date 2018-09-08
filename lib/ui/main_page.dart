import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tourism_demo/app_styles.dart';
import 'package:tourism_demo/i18n/translations.dart';
import 'package:tourism_demo/redux/app/app_state.dart';
import 'package:tourism_demo/styles/app_colors.dart';
import 'package:tourism_demo/ui/destinations/destinations_page.dart';

class MainPage extends StatefulWidget {
  const MainPage();

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  static final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>();

  AnimationController _controller;
  var prevLocale;

  @override
  void initState() {
    _controller = new AnimationController(
      duration: const Duration(milliseconds: 600),
      debugLabel: 'preview banner',
      vsync: this,
    );

    _controller.forward();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _appBody(Widget body) {
    var locale = StoreProvider.of<AppState>(context).state.appLocale;
    bool isAr = StoreProvider.of<AppState>(context).state.isAr;

    if (prevLocale != locale) {
      prevLocale = locale;
      _controller.reset();

      return new FadeTransition(
        opacity: new CurvedAnimation(
          parent: _controller
            // ..reset()
            ..forward(),
          curve: const Interval(0.5, 1.0, curve: Curves.ease),
        ),
        child: new SlideTransition(
          child: bodyScrollView(body),
          position: new Tween<Offset>(
            begin: isAr ? const Offset(0.25, 0.0) : const Offset(-0.25, 0.0),
            end: Offset.zero,
          ).animate(new CurvedAnimation(
            parent: _controller,
            curve: Curves.decelerate,
          )),
        ),
      );
    } else {
      return bodyScrollView(body);
    }
  }

  Widget bodyScrollView(Widget body) {
    VoidCallback changeLanguage =
        StoreProvider.of<AppState>(context).state.changeLanguage;

    return CustomScrollView(
      // physics: new PageScrollPhysics(),

      slivers: <Widget>[
        new SliverAppBar(
//          floating: true,
//          pinned: false,
//          snap: true,
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
                changeLanguage();
              },
            ),
          ],
        ),

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
