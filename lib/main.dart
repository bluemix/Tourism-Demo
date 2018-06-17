import 'package:flutter/material.dart';
import 'package:iraqiairways_demo/app_styles.dart';
import 'package:iraqiairways_demo/data.dart';
import 'package:iraqiairways_demo/models/models.dart';
import 'package:iraqiairways_demo/scale_route.dart';
import 'package:iraqiairways_demo/ui/destination_info.dart';
import 'package:iraqiairways_demo/ui/destination_item.dart';

void main() => runApp(new MyApp());

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

  void _openEventDetails(BuildContext context, Destination destination) {
    debugPrint('will _openEventDetails... ');
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
      home: new Scaffold(
          body: new Container(
        decoration: gradientBackDecoration(),
        child: new ListView(
            children: destinations
                .map((d) => (new Hero(
                      tag: d.photo,
                      child: new Material(
                        elevation: 0.0,
                        color: Colors.transparent,
                        child: DestinationCard(
                          initialDelay: 500,
                          destination: d,
                          onTapped: () => _openEventDetails(context, d),
                        ),
                      ),
                    )))
                .toList()),
      )),
    );
  }
}

//
// NotchedClipper(radius: 15.0,
//                topLeft: false,
//                bottomLeft: true,
//                bottomRight: true,
//                topRight: false,
//                ),
