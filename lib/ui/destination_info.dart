import 'package:flutter/material.dart';
import 'package:iraqiairways_demo/app_colors.dart';
import 'package:iraqiairways_demo/models/models.dart';
import 'package:iraqiairways_demo/ui/destination_item.dart';
import 'package:meta/meta.dart';

class DesitnationInfoPage extends StatefulWidget {
  final DestinationCard destinationWidget;

  DesitnationInfoPage({@required this.destinationWidget});
  @override
  State<StatefulWidget> createState() {
    return new _DestinationInfoState(destinationCard: destinationWidget);
  }
}

class _DestinationInfoState extends State<DesitnationInfoPage>
    with SingleTickerProviderStateMixin {
  _DestinationInfoState({
    @required this.destinationCard,
  });

  final DestinationCard destinationCard;
  AnimationController animationController;
  bool _isExpanded = false;

  @override
  initState() {
    animationController = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);
    return super.initState();
  }

  static BoxDecoration _buildDecorations() {
    return const BoxDecoration(
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: const <Color>[
          const Color(0xffffffff),
          const Color(0xddeeeeee),
          const Color(0xdddfdfdf),
          const Color(0xddeeeeee),
          const Color(0xffffffff),
        ],
      ),
    );
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

  void _toggleExpandedState() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  Widget _buildContent() {
    var style = new TextStyle(
      color: AppColors.tertiaryTextColor,
      fontFamily: 'GE SS Light',
      fontSize: 16.0,
    );
    return new Padding(
      padding: const EdgeInsets.only(right: 20.0, top: 5.0, left: 20.0),
      child: new AnimatedCrossFade(
        firstChild: new Text(
          destinationCard.destination.shortDescription,
          style: style,
          maxLines: 3,
          overflow: TextOverflow.fade,
        ),
        secondChild: new Text(destinationCard.destination.shortDescription,
            style: style),
        crossFadeState:
            _isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        duration: kThemeAnimationDuration,
      ),
    );
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
    return new Scaffold(
      backgroundColor: AppColors.primaryBackgroundColor,
      appBar: new AppBar(
        backgroundColor: AppColors.primaryBackgroundColor,
        // leading: new InkWell(
        //   onTap: () => Navigator.pop(context),
        //   child: Icon(
        //     Icons.arrow_back,
        //     color: AppColors.primaryTextColor,
        //   ),
        // ),
        automaticallyImplyLeading: true,
        elevation: .0,
      ),
      body: buildInfo(),
    );
  }
}
