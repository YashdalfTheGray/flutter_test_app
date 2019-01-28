import 'package:flutter/material.dart';

class DeleteAlert extends StatelessWidget {
  final Function _onCancel;
  final Function _onDelete;

  DeleteAlert(Function onCancel, Function onDelete)
      : _onCancel = onCancel,
        _onDelete = onDelete;

  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      title: new Text('Delete suggestions?'),
      content: new Text(
          'This will clear the list of saved suggestions. You will not be able to get these suggestions back once you confirm.'),
      actions: <Widget>[
        new FlatButton(
          child: new Text('Cancel'),
          onPressed: _onCancel,
        ),
        new FlatButton(
          child: new Text('Delete'),
          onPressed: _onDelete,
        )
      ],
    );
  }
}
