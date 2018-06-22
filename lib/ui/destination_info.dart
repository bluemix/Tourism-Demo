import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:tourism_demo/app_colors.dart';
import 'package:tourism_demo/app_styles.dart';
import 'package:tourism_demo/clippers.dart';
import 'package:tourism_demo/internationalizations/translations.dart';
import 'package:tourism_demo/scoped_model_wrapper.dart';
import 'package:tourism_demo/ui/destination_item.dart';
import 'package:tourism_demo/utils.dart';

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
  bool _reversedAnimations = false;

  @override
  initState() {
    super.initState();
    animationController = new AnimationController(
        duration: const Duration(milliseconds: 400), vsync: this);

    animationController2 = new AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);

    var curvedAnimation = new CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn);
    var curvedAnimation2 = new CurvedAnimation(
        parent: animationController2, curve: Curves.fastOutSlowIn);

    animation =
        new Tween<double>(begin: 90.0, end: 180.0).animate(curvedAnimation)
          ..addListener(() {
            setState(() {
              // the state that has changed here is the animation object’s value
            });
          });

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController2.forward();
      } else if (status == AnimationStatus.dismissed) {
        Navigator.pop(context);
      }
    });
    animation2 =
        new Tween<double>(begin: 270.0, end: 180.0).animate(curvedAnimation2)
          ..addListener(() {
            setState(() {
              // the state that has changed here is the animation object’s value
            });
          });
    animation2.addStatusListener((status) {
      debugPrint('status: $status');
      if (status == AnimationStatus.dismissed) {
        animationController.reverse();
      }
    });

    animationController.forward();
  }

  _collapseAnimations() {
    _reversedAnimations = true;
    // animationController.duration = const Duration(microseconds: 300);
    // animationController2.duration = const Duration(microseconds: 400);

    animationController2.reverse();
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

  Widget _imageAndDesc(String image, String desc) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Padding(
          padding: const EdgeInsets.all(5.0),
          child: new Container(
            height: 32.0,
            width: 32.0,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new ExactAssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        new Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
          child: Text(desc,
              style: new TextStyle(
                color: AppColors.tertiaryTextColor,
                fontSize: 17.0,
              )),
        ),
      ],
    );
  }

  Widget _buildServicesInfo(double degrees, AlignmentGeometry alignment) {
    return new Transform(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: new ClipPath(
            clipper: NotchedClipper(),
//      clipper: BottomWaveClipper(),
            child: Container(
              decoration: cardGradientBackground(),
//        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: new Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 5.0),
                  child: ScopedModelDescendant<AppModel>(
                      builder: (context, child, model) => Column(
                            children: <Widget>[
                              _imageAndDesc(
                                  'images/icons/airplane(1).png',
                                  model.isAr
                                      ? destinationCard.destination.airlinesAr
                                      : destinationCard.destination.airlines),
                              _imageAndDesc(
                                  'images/icons/food.png',
                                  model.isAr
                                      ? destinationCard.destination.foodAr
                                      : destinationCard.destination.food),
                              _imageAndDesc(
                                  'images/icons/hotel.png',
                                  model.isAr
                                      ? '${Translations.of(context).hotels} ${destinationCard.destination.hotelStars}' +
                                          ' ${Translations.of(context).star}'
                                      : '${destinationCard.destination.hotelStars}-${Translations.of(context).star}' +
                                          '${Translations.of(context).hotels}'),
                            ],
                          ))),
            ),
          ),
        ),
        alignment: alignment,
        transform: perspective.scaled(1.0, 1.0, 1.0)
          ..rotateX(math.pi - degrees * math.pi / 180)
          ..rotateY(0.0)
          ..rotateZ(0.0));
  }

  Widget _buildLocations() {
    if (destinationCard.destination.cityActivities.length > 0 &&
        destinationCard.destination.cityActivities.first.photos.length > 0) {
      return new SizedBox(
        height: 120.0,
        child: new ListView(
            scrollDirection: Axis.horizontal,
            children: destinationCard.destination.cityActivities
                .map((d) => (Column(
                      children: <Widget>[
                        new Container(
                          width: 75.0,
                          height: 75.0,
                          margin: const EdgeInsets.all(8.0),
                          decoration: new BoxDecoration(
                            borderRadius:
                                new BorderRadius.all(new Radius.circular(75.0)),
                            image: new DecorationImage(
                              image: new AssetImage(d.photos.first),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        ScopedModelDescendant<AppModel>(
                            builder: (context, child, model) =>
                                Text(model.isAr ? d.cityNameAr : d.cityName,
                                    style: new TextStyle(
                                      color: AppColors.tertiaryTextColor,
                                      fontSize: 15.0,
                                    )))
                      ],
                      // onTapped: () => _openEventDetails(context, d),
                    )))
                .toList()),
      );
    } else {
      return Container();
    }
  }

  Widget _buildLocationsInfo(double degrees, AlignmentGeometry alignment) {
    return new Transform(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: new ClipPath(
            clipper: NotchedClipper(
                bottomLeft: false,
                bottomRight: false,
                topLeft: true,
                topRight: true),
//      clipper: BottomWaveClipper(),
            child: Container(
              decoration: cardGradientBackground(),
//        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: new Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 0.0, vertical: 15.0),
                  child: _buildLocations()),
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
      child:
          Hero(tag: destinationCard.destination.photo, child: destinationCard),
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
          ),
          new Scaffold(
              backgroundColor: Colors.transparent,
              body: new Container(
                decoration: new BoxDecoration(boxShadow: [
                  new BoxShadow(
                      color: Colors.black12,
                      blurRadius: 30.0,
                      offset: const Offset(0.0, 75.0)),
                ]),
                child: infoInScrollView(),
              ))
        ]);
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
            onTap: () => _collapseAnimations(),
            child: Icon(
              Icons.arrow_back,
              color: AppColors.accentColor,
            ),
          ),
        ),
        new SliverPadding(
          padding: const EdgeInsets.all(10.0),
          sliver: new SliverList(
            delegate: new SliverChildListDelegate([
              buildInfo(),
              _buildServicesInfo(animation.value, FractionalOffset.topCenter),
              _buildLocationsInfo(animation2.value, FractionalOffset.topCenter),
            ]),
          ),
        )
      ],
    );
  }

  dispose() {
    animationController.dispose();
    super.dispose();
  }
}
