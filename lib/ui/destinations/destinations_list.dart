import 'package:flutter/material.dart';
import 'package:tourism_demo/models/destination.dart';
import 'package:tourism_demo/ui/common/info_message_view.dart';
import 'package:tourism_demo/ui/destinations/destination_list_tile.dart';

class DestinationsList extends StatelessWidget {
  static const Key emptyViewKey = Key('emptyView');
  static const Key contentKey = Key('content');

  DestinationsList(this.destinations);

  final List<Destination> destinations;

  @override
  Widget build(BuildContext context) {
    if (destinations.isEmpty) {
      return const InfoMessageView(
        key: emptyViewKey,
        title: 'All empty!',
        description:
            'Didn\'t find any movies\nabout to start for today. ¯\\_(ツ)_/¯',
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView.builder(
        padding: const EdgeInsets.only(bottom: 8.0),
        itemCount: destinations.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              DestinationCard(
                destination: destinations[index],
                initialDelay: 500,
                onTapped: () => {},
              ),
            ],
          );
        },
      ),
    );
  }
}
