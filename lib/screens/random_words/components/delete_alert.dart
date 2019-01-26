import 'package:flutter/material.dart';

class DeleteAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      title: new Text('Delete suggestions?'),
      content: new Text(
          'This will clear the list of saved suggestions. You will not be able to get these suggestions back once you confirm.'),
      actions: <Widget>[
        new FlatButton(
          child: new Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        new FlatButton(
          child: new Text('Delete'),
          textColor: Theme.of(context).primaryColor,
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
