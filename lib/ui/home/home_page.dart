import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tourism_demo/app_keys.dart';
import 'package:tourism_demo/app_styles.dart';
import 'package:tourism_demo/redux/app/app_state.dart';
import 'package:tourism_demo/ui/home/home_view.dart';
import 'package:tourism_demo/ui/home/home_view_model.dart';

class HomePage extends StatelessWidget {
  HomePage() : super(key: AppKeys.homePage);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, HomeViewModel>(
      distinct: true,
      converter: (store) => HomeViewModel.fromStore(store),
      builder: (_, viewModel) => HomePageContent(viewModel),
    );
  }
}

class HomePageContent extends StatelessWidget {
  HomePageContent(this.viewModel);

  final HomeViewModel viewModel;

  buildBackground() {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Center(),
            ),
          ],
        )
      ],
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
            body: HomeView(
              homeViewModel: viewModel,
            )),
      ],
    );
  }
}
