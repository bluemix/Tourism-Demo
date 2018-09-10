import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tourism_demo/clippers.dart';
import 'package:tourism_demo/i18n/translations.dart';
import 'package:tourism_demo/models/destination.dart';
import 'package:tourism_demo/networking/server_api.dart';
import 'package:tourism_demo/redux/app/app_state.dart';
import 'package:tourism_demo/styles/app_colors.dart';

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
        clipper: NotchedClipper(bottomLeft: false, bottomRight: false),
        child: new Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0),
          child: new Container(
            height: itemHeight,
            child: FadeInImage.assetNetwork(
                placeholder: 'images/placeholder.png',
                fit: BoxFit.fill,
                image: destination.photo.replaceAll('~', ServerAPI.host)),
//            decoration: new BoxDecoration(
//              image: new DecorationImage(
//                image: new NetworkImage(destination.photo.replaceAll('~', ServerAPI.host)),
//                fit: BoxFit.cover,
//              ),
//            ),
          ),
        ));
  }

  Widget _buildTripDate(BuildContext context) {
    DateTime dateFrom = DateTime.parse(destination.dateFrom);
    DateTime dateTo = DateTime.parse(destination.dateTo);

    int dateDayFrom = dateFrom.day;
    int dateDayTo = dateTo.day;

    bool isAr = StoreProvider.of<AppState>(context).state.isAr;

    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('${destination.numDays} ${Translations.of(context).days}',
              style: new TextStyle(
                color: AppColors.tertiaryTextColor,
                fontSize: 22.0,
              )),
          Text(
              isAr
                  ? '$dateDayFrom-$dateDayTo ${Translations.of(context).june} '
                  : '${Translations.of(context).june} $dateDayFrom-$dateDayTo',
              style: new TextStyle(
                color: AppColors.tertiaryTextColor,
                decoration: ui.TextDecoration.overline,
                fontSize: 14.0,
              )),
        ],
      ),
    );
  }

  Widget _buildTextualInfo(BuildContext context) {
    bool isAr = StoreProvider.of<AppState>(context).state.isAr;

    return new Material(
      textStyle: new TextStyle(fontFamily: 'BJ Regular'),
      // to overcome the issue above (text glitches in Hero)
      color: Colors.transparent,
      elevation: 1.0,
      shadowColor: Colors.transparent,
      child: new ClipPath(
        clipper: NotchedClipper(topLeft: false, topRight: false),
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
                    Text((isAr ? destination.titleAr : destination.title),
                        style: new TextStyle(
                          color: AppColors.primaryTextColor,
                          fontFamily: 'BJ Bold',
                          fontSize: 26.0,
                        )),
                    _buildTripDate(context)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
    // wrapped in Material to avoid
    // hero text glitch (https://github.com/flutter/flutter/issues/12463)
  }

  Widget _buildDestinationItem(BuildContext context) {
    return new GestureDetector(
        onTap: onTapped,
        child: new Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: new Container(
            child: new Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildImage(),
                _buildTextualInfo(context),
              ],
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    // final Animation<double> animation = listenable;
    // return rotateBy(animation.value);
    return SingleChildScrollView(
      child: _buildDestinationItem(context),
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
