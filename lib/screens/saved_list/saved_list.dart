import 'package:flutter/material.dart';
import 'package:flutter_test_app/screens/saved_list/components/delete_alert.dart';
import 'package:flutter_test_app/util/file_store.dart';

class SavedListDeleteAction extends StatelessWidget {
  final Set<String> _saved;

  SavedListDeleteAction(saved) : _saved = saved;

  void _showSnackbarWith(String message, BuildContext context) {
    final snackbar = new SnackBar(
      content: Text(message),
    );
    Scaffold.of(context).showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return new IconButton(
      icon: const Icon(Icons.delete_forever),
      onPressed: () async {
        if (_saved.length == 0) {
          _showSnackbarWith('Nothing to delete', context);
          return;
        }

        showDialog(
            context: context,
            builder: (BuildContext context) => new DeleteAlert());

        // final result = await FileStore.clearSuggestions();
        // final message = result
        //     ? 'Saved suggestions cleared'
        //     : 'There was an error clearing the saved suggestions';
        // final snackbar = new SnackBar(
        //   content: Text(message),
        // );

        // Scaffold.of(context).showSnackBar(snackbar);
      },
    );
  }
}

class SavedList extends StatelessWidget {
  final _biggerFont = TextStyle(fontSize: 18.0);

  final Set<String> _saved;

  SavedList(saved) : _saved = saved;

  @override
  Widget build(BuildContext context) {
    final tiles = _saved.map((String pair) {
      return new ListTile(title: new Text(pair, style: _biggerFont));
    });

    final divided =
        ListTile.divideTiles(context: context, tiles: tiles).toList();

    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Saved Suggestions'),
        actions: <Widget>[new SavedListDeleteAction(_saved)],
      ),
      body: new ListView(
        children: divided,
      ),
    );
  }
}
