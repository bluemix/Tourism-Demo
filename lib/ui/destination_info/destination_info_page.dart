
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tourism_demo/i18n/translations.dart';
import 'package:tourism_demo/models/destination.dart';
import 'package:tourism_demo/redux/app/app_state.dart';
import 'package:tourism_demo/redux/destinations/destinations_actions.dart';
import 'package:tourism_demo/ui/destination_info/destination_info_view.dart';
import 'package:tourism_demo/ui/destinations/destinations_view_model.dart';
import 'package:tourism_demo/ui/destinations/destinations_view.dart';

class DestinationInfoPage extends StatelessWidget {
  const DestinationInfoPage();

  @override
  Widget build(BuildContext context) {
    return DestinationInfoView();
  }
}
