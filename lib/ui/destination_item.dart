import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iraqiairways_demo/app_colors.dart';
import 'package:iraqiairways_demo/models/models.dart';
import 'dart:math' as math;

import 'package:iraqiairways_demo/utils.dart';

class DestinationItem extends AnimatedWidget {
  // RAnimatedCard(
  //     {Key key,
  //     Animation<double> animation,
  //     this.coverImage,
  //     this.iconImage,
  //     this.title,
  //     this.description})
  //     : super(key: key, listenable: animation);
  DestinationItem({
    Key key,
    Animation<double> animation,
    @required this.destination,
    @required this.onTapped,
  }) : super(key: key, listenable: animation);

  final Destination destination;
  final VoidCallback onTapped;

  final double itemHeight = 175.0;

  static BoxDecoration _buildDecorations() {
    return const BoxDecoration(
      gradient: const LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: const <Color>[
          const Color(0xFFffffff),
          const Color(0x22ffffff),
          const Color(0x00000000),
        ],
      ),
    );
  }

  Widget rotateBy(double degrees) {
    return new Transform(
        child: _buildCarItem(),
        alignment: FractionalOffset.topCenter,
        transform: perspective.scaled(1.0, 1.0, 1.0)
          ..rotateX(math.pi - degrees * math.pi / 180)
        // ..rotateY(math.pi - degrees * math.pi / 180)
        // ..rotateZ(math.pi - degrees * math.pi / 180)
        );
  }

  Widget _buildImage() {
    return new Padding(
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
    );
  }

  Widget _buildTextualInfo() {
    return new Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(destination.title,
                style: new TextStyle(
                  color: AppColors.tuftsBlueColor,
                  fontSize: 26.0,
                )),
            new Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(destination.title,
                  style: new TextStyle(
                    color: AppColors.tertiaryTextColor,
                    fontFamily: 'GE SS Light',
                    fontSize: 14.0,
                  )),
            ),
          ],
        ));
  }

  Widget _buildCarItem() {
    return InkWell(
      onTap: onTapped,
      child: new Container(
        child: new Padding(
            padding: const EdgeInsets.only(bottom: 0.0),
            child: new Stack(
              children: <Widget>[
                _buildImage(),
                new Container(
                  height: itemHeight,
                  decoration: _buildDecorations(),
                ),
                new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new Container(
                      height: itemHeight/1.6,
                    ),
                    new FittedBox(
                      fit: BoxFit.cover,
                      child: _buildTextualInfo(),
                    )
                    
                  ],
                )
              ],
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return rotateBy(animation.value);
  }
}

class DestinationCard extends StatefulWidget {
  final int initialDelay;
  final Destination destination;
  final VoidCallback onTapped;

  const DestinationCard({Key key, this.initialDelay, this.destination, this.onTapped})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _CardState();
  }
}

class _CardState extends State<DestinationCard> with SingleTickerProviderStateMixin {
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
