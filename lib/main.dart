import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:tourism_demo/app_colors.dart';
import 'package:tourism_demo/app_styles.dart';
import 'package:tourism_demo/data.dart';
import 'package:tourism_demo/internationalizations/translations.dart';
import 'package:tourism_demo/internationalizations/translations_delegate.dart';
import 'package:tourism_demo/models/models.dart';
import 'package:tourism_demo/scale_route.dart';
import 'package:tourism_demo/scoped_model_wrapper.dart';
import 'package:tourism_demo/ui/destination_info.dart';
import 'package:tourism_demo/ui/destination_item.dart';
import 'package:tourism_demo/utils.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(new ScopeModelWrapper());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppModel>(
        builder: (context, child, model) => new MaterialApp(
              onGenerateTitle: (BuildContext context) =>
                  Translations.of(context).title,
              localizationsDelegates: [
                const TranslationsDelegate(),
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              locale: model.appLocal,
              supportedLocales: model.supportedLocales,
              theme: appTheme(),
              home: new MyHomePage(title: 'Flutter Demo Home Page'),
            ));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  var destinations = getDestinations();
  AnimationController _controller;
  var prevLocale = AppModel().appLocal;
  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      duration: const Duration(milliseconds: 600),
      debugLabel: 'preview banner',
      vsync: this,
    );

    _controller.addStatusListener((status) {
      debugPrint('status: $status');
      // if (status == AnimationStatus.completed) {
      //   _controller.reverse();
      // }
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _openDestinationDetails(BuildContext context, Destination destination) {
    debugPrint('will _openDestinationDetails... ');
    Navigator.push(
      context,
      new FadeRoute(
          widget: new DestinationInfoPage(
        destinationWidget: DestinationCard(
          initialDelay: 0,
          destination: destination,
        ),
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      alignment: Alignment.bottomCenter,
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
            body: ScopedModelDescendant<AppModel>(
                builder: (_context, child, model) {
              if (prevLocale != model.appLocal) {
                prevLocale = model.appLocal;
                _controller.reset();

                return new FadeTransition(
                  opacity: new CurvedAnimation(
                    parent: _controller
                      // ..reset()
                      ..forward(),
                    curve: const Interval(0.5, 1.0, curve: Curves.ease),
                  ),
                  child: new SlideTransition(
                    child: bodyScrollView(model),
                    position: new Tween<Offset>(
                      begin: model.isAr
                          ? const Offset(0.25, 0.0)
                          : const Offset(-0.25, 0.0),
                      end: Offset.zero,
                    ).animate(new CurvedAnimation(
                      parent: _controller,
                      curve: Curves.decelerate,
                    )),
                  ),
                );
              } else {
                return ScopedModelDescendant<AppModel>(
                builder: (_context, child, model) => (
                  bodyScrollView(model)
                ));
              }
            }))
      ],
    );
  }

  Widget bodyScrollView(AppModel model) {
    return CustomScrollView(
      // physics: new PageScrollPhysics(),
      slivers: <Widget>[
        new SliverAppBar(
          floating: true,
          pinned: false,
          snap: true,
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: true,
          title: new Text(
            Translations.of(context).title,
            style: TextStyle(fontWeight: FontWeight.normal),
          ),
          // title: new Text('isAr: ${model.isAr}'),
          centerTitle: true,
          actions: <Widget>[
            new FlatButton(
              child: new Text(Translations.of(context).language,
                  style: TextStyle(
                      color: AppColors.accentColor,
                      fontSize: 18.0,
                      fontFamily: 'BJ Bold')),
              onPressed: () {
                model.chagneLanguge();
              },
            ),
          ],
        ),
        new SliverPadding(
          padding: const EdgeInsets.all(3.0),
          sliver: new SliverList(
            delegate: new SliverChildListDelegate([
              new Column(
                  children: destinations
                      .map((d) => (new Hero(
                            tag: d.photo,
                            child: DestinationCard(
                              initialDelay: 500,
                              destination: d,
                              onTapped: () =>
                                  _openDestinationDetails(context, d),
                            ),
                          )))
                      .toList()),
            ]),
          ),
        )
      ],
    );
  }
}
