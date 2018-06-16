import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:iraqiairways_demo/app_colors.dart';
import 'package:iraqiairways_demo/clippers.dart';
import 'package:iraqiairways_demo/ui/destination_item.dart';
import 'package:iraqiairways_demo/utils.dart';
import 'package:meta/meta.dart';

class DestinationInfoPage extends StatefulWidget {
  final DestinationCard destinationWidget;

  DestinationInfoPage({@required this.destinationWidget});

  @override
  State<StatefulWidget> createState() {
    return new _DestinationInfoState(destinationCard: destinationWidget);
  }
}

class _DestinationInfoState extends State<DestinationInfoPage>
    with TickerProviderStateMixin {
  _DestinationInfoState({
    @required this.destinationCard,
  });

  final DestinationCard destinationCard;
  AnimationController animationController;
  AnimationController animationController2;
  Animation<double> animation;
  Animation<double> animation2;
  bool _isExpanded = false;
  Timer _timer;

  @override
  initState() {
    super.initState();
    animationController = new AnimationController(
        duration: const Duration(milliseconds: 650), vsync: this);

    animationController2 = new AnimationController(
        duration: const Duration(milliseconds: 400), vsync: this);

    var curvedAnimation = new CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn);
    var curvedAnimation2 = new CurvedAnimation(
        parent: animationController2, curve: Curves.fastOutSlowIn);

    animation =
        new Tween<double>(begin: 45.0, end: 180.0).animate(curvedAnimation)
          ..addListener(() {
            setState(() {
              // the state that has changed here is the animation object’s value
            });
          });

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController2.forward();
      }
    });
    animation2 =
        new Tween<double>(begin: 270.0, end: 180.0).animate(curvedAnimation2)
          ..addListener(() {
            setState(() {
              // the state that has changed here is the animation object’s value
            });
          });

    animationController.forward();
  }

  Widget buildInfoColumn(String icon, String info) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(info,
              style: new TextStyle(
                color: AppColors.tertiaryTextColor,
                fontSize: 13.0,
                fontFamily: 'GE SS Light',
              )),
        )
      ],
    );
  }

  Widget _emojiDesc(IconData icon, String desc) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Icon(
          icon,
          color: Colors.deepOrangeAccent,
        ),
        new Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
          child: Text(desc,
              style: new TextStyle(
                color: AppColors.secondaryTextColor,
                fontFamily: 'GE SS Light',
                fontSize: 14.0,
              )),
        ),
      ],
    );
  }

  Widget _buildServicesInfo(double degrees, AlignmentGeometry alignment) {
    return new Transform(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: new ClipPath(
            clipper: NotchedClipper(
                bottomLeft: true,
                bottomRight: true,
                topLeft: false,
                topRight: false),
//      clipper: BottomWaveClipper(),
            child: Container(
              color: Colors.grey[300],
//        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: new Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 5.0, vertical: 5.0),
                  child: Row(
                    children: <Widget>[
                      _emojiDesc(Icons.airplanemode_active,
                          destinationCard.destination.airlines),
                      _emojiDesc(Icons.star,
                          destinationCard.destination.hotelStars.toString()),
                    ],
                  )),
            ),
          ),
        ),
        alignment: alignment,
        transform: perspective.scaled(1.0, 1.0, 1.0)
          ..rotateX(math.pi - degrees * math.pi / 180)
          ..rotateY(0.0)
          ..rotateZ(0.0));
  }

  Widget buildInfo() {
    final double _height = MediaQuery.of(context).size.height;

    return new Container(
      child: Hero(
        tag: destinationCard.destination.photo,
        child: destinationCard,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        backgroundColor: AppColors.primaryBackgroundColor,
        appBar: new AppBar(
          backgroundColor: AppColors.primaryBackgroundColor,
          leading: new InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back,
              color: AppColors.primaryTextColor,
            ),
          ),
          automaticallyImplyLeading: true,
          elevation: .0,
        ),
        body: new ListView(
          children: <Widget>[
            buildInfo(),
            _buildServicesInfo(animation.value, FractionalOffset.topCenter),
            _buildServicesInfo(animation2.value, FractionalOffset.topCenter),
          ],
        ),
      ),
    );
  }

  dispose() {
    animationController.dispose();
    super.dispose();
  }
}
