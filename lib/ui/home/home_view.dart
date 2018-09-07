import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tourism_demo/i18n/translations.dart';
import 'package:tourism_demo/styles/app_colors.dart';
import 'package:tourism_demo/ui/home/home_view_model.dart';

class HomeView extends StatefulWidget {
  HomeView({@required this.homeViewModel});

  final HomeViewModel homeViewModel;

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  AnimationController _controller;
  var prevLocale;

  @override
  void initState() {
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

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _appBody() {
    if (prevLocale != widget.homeViewModel.locale) {
      prevLocale = widget.homeViewModel.locale;
      _controller.reset();

      return new FadeTransition(
        opacity: new CurvedAnimation(
          parent: _controller
            // ..reset()
            ..forward(),
          curve: const Interval(0.5, 1.0, curve: Curves.ease),
        ),
        child: new SlideTransition(
          child: bodyScrollView(),
          position: new Tween<Offset>(
            begin: widget.homeViewModel.isAr()
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
      return bodyScrollView();
    }
  }

  Widget bodyScrollView() {
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
                widget.homeViewModel.changeLanguage();
              },
            ),
          ],
        ),
        new SliverPadding(
          padding: const EdgeInsets.all(3.0),
          sliver: new SliverList(
            delegate: new SliverChildListDelegate([
              new Center(child: Text('Home')),
            ]),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _appBody();
  }
}
