import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:tourism_demo/utils/widget_utils.dart';

class ErrorView extends InfoMessageView {
  static const Key tryAgainButtonKey = Key('tryAgainButton');

  const ErrorView({
    String title,
    String description,
    @required VoidCallback onRetry,
  }) : super(
          actionButtonKey: tryAgainButtonKey,
          title: title ?? 'Error',
          icon: Icons.error_outline,
          description:
              description ?? 'Check your data!',
          onActionButtonTapped: onRetry,
        );
}

class InfoMessageView extends StatelessWidget {
  const InfoMessageView({
    Key key,
    @required this.title,
    @required this.description,
    this.actionButtonKey,
    this.onActionButtonTapped,
    this.icon = Icons.info_outline
  }) : super(key: key);

  final Key actionButtonKey;
  final String title;
  final String description;
  final VoidCallback onActionButtonTapped;
  final IconData icon;

  Widget _buildActionButton(BuildContext context) {
    if (onActionButtonTapped == null) {
      return null;
    }

    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: FlatButton(
        key: actionButtonKey,
        onPressed: onActionButtonTapped,
        child: Text(
          'TRY AGAIN',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var content = <Widget>[
      CircleAvatar(
        child: Icon(
          icon,
          color: Colors.black54,
          size: 52.0,
        ),
        backgroundColor: Colors.black12,
        radius: 42.0,
      ),
      const SizedBox(height: 16.0),
      Text(
        title,
        style: const TextStyle(fontSize: 24.0),
      ),
      const SizedBox(height: 8.0),
      Text(
        description,
        textAlign: TextAlign.center,
      ),
    ];

    addIfNonNull(_buildActionButton(context), content);

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: content,
          ),
        ),
      ),
    );
  }
}
