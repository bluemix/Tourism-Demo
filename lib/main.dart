import 'package:flutter/material.dart';
import 'package:iraqiairways_demo/data.dart';
import 'package:iraqiairways_demo/models/models.dart';
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
    Navigator.push(
      context,
      new MaterialPageRoute(
          builder: (_) => new DestinationInfoPage(
                destinationWidget: DestinationCard(
                  initialDelay: 0,
                  destination: destination,
                ),
              )),
    );
  }

  BoxDecoration _buildDecorations() {
    return const BoxDecoration(
      boxShadow: <BoxShadow>[
        const BoxShadow(
          offset: const Offset(1.0, 3.0),
          spreadRadius: 2.0,
          blurRadius: 2.0,
          color: const Color(
              0x55458BA3), // <color name="boston_blue">#458BA3</color>
        ),
      ],
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: const <Color>[
          Color(0xffF55B9A), // <color name="fantasy">#FAF5EF</color>
          Color(0xffF9B16E), // <color name="white_linen">#FBF3EA</color>
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
          body: new Container(
        decoration: _buildDecorations(),
        child: new ListView(
            children: destinations
                .map((d) => (new Hero(
                      tag: d.photo,
                      child: DestinationCard(
                        initialDelay: 500,
                        destination: d,
                        onTapped: () => _openEventDetails(context, d),
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
