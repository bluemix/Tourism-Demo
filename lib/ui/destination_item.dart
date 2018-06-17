import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iraqiairways_demo/app_colors.dart';
import 'package:iraqiairways_demo/app_styles.dart';
import 'package:iraqiairways_demo/clippers.dart';
import 'package:iraqiairways_demo/models/models.dart';

class DestinationItem extends StatelessWidget {
  DestinationItem({
    Key key,
    Animation<double> animation,
    @required this.destination,
    @required this.onTapped,
  }) : super(key: key);

  final Destination destination;
  final VoidCallback onTapped;

  final double itemHeight = 175.0;

  Widget _buildImage() {
    return new ClipPath(
        clipper: NotchedClipper(topLeft: false, topRight: false),
        child: new Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0),
          child: new Container(
            height: itemHeight,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new ExactAssetImage(destination.photo),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ));
  }

  Widget _buildTripDate() {
    return new Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('6 Days',
              style: new TextStyle(
                color: AppColors.tertiaryTextColor,
                fontSize: 22.0,
              )),
          Text('June 21-27',
              style: new TextStyle(
                color: AppColors.tertiaryTextColor,
                fontSize: 14.0,
              )),
          // new ShaderMask(
          //   shaderCallback: (Rect bounds) {
          //     return new RadialGradient(
          //       center: Alignment.topLeft,
          //       radius: 1.0,
          //       colors: <Color>[Colors.yellow, Colors.deepOrange.shade900],
          //       tileMode: TileMode.repeated,
          //     ).createShader(bounds);
          //   },
          //   child: const Text('I’m burning the memories'),
          // )
        ],
      ),
    );
  }



  Widget _buildTextualInfo() {
    return new ClipPath(
      clipper: NotchedClipper(bottomLeft: false, bottomRight: false),
      child: new Stack(
        children: <Widget>[
          new Container(
            decoration: cardGradientBackground(),
            child: new Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(destination.title,
                      style: new TextStyle(
                        color: AppColors.primaryTextColor,
                        fontSize: 26.0,
                      )),
                  _buildTripDate()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDestinationItem() {
    return new GestureDetector(
        onTap: onTapped,
        child: new Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
          child: new Container(
            child: new Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  _buildImage(),
                  _buildTextualInfo(),
                ],
              ),
            decoration: new BoxDecoration(boxShadow: [
              new BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10.0,
                  offset: const Offset(0.0, 7.5)),
            ]),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    // final Animation<double> animation = listenable;
    // return rotateBy(animation.value);
    return SingleChildScrollView(
      child: _buildDestinationItem(),
    );
  }
}

class DestinationCard extends StatefulWidget {
  final int initialDelay;
  final Destination destination;
  final VoidCallback onTapped;

  const DestinationCard(
      {Key key, this.initialDelay, this.destination, this.onTapped})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _CardState();
  }
}

class _CardState extends State<DestinationCard>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  Timer _timer;

  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);

    var curvedAnimation =
        new CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

    animation =
        new Tween<double>(begin: 90.0, end: 180.0).animate(curvedAnimation);

    _timer = new Timer(Duration(milliseconds: widget.initialDelay), () {
      controller.forward();
    });
  }

  Widget build(BuildContext context) {
    return new DestinationItem(
      animation: animation,
      destination: widget.destination,
      onTapped: widget.onTapped,
    );
  }

  dispose() {
    controller.dispose();
    _timer.cancel();
    super.dispose();
  }
}
