import 'package:flutter/material.dart';
import 'package:tourism_demo/app_colors.dart';
import 'package:tourism_demo/app_styles.dart';
import 'package:tourism_demo/data.dart';
import 'package:tourism_demo/models/models.dart';
import 'package:tourism_demo/scale_route.dart';
import 'package:tourism_demo/scoped_model_wrapper.dart';
import 'package:tourism_demo/ui/destination_info.dart';
import 'package:tourism_demo/ui/destination_item.dart';
import 'package:tourism_demo/utils.dart';

void main() => runApp(new ScopeModelWrapper());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var destinations = getDestinations();

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
    return new MaterialApp(
      theme: appTheme(),
      home: new Stack(
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
            body: infoInScrollView(),
          )
        ],
      ),
    );
  }

  CustomScrollView infoInScrollView() {
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
          leading: new InkWell(
            onTap: () => debugPrint(''),
            child: Icon(
              Icons.arrow_back,
              color: AppColors.whiteColor,
            ),
          ),
          title: new Text('Tourism Demo'),
          centerTitle: true,
          actions: <Widget>[
            new FlatButton(
              child: new Text('إضافة',
                  style:
                      TextStyle(color: AppColors.whiteColor, fontSize: 18.0, fontFamily: 'BJ Bold')),
              onPressed: () {
                debugPrint('');
              },
            ),
          ],
        ),
        new SliverPadding(
          padding: const EdgeInsets.all(10.0),
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
