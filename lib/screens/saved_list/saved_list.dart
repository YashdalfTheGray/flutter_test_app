import 'package:flutter/material.dart';
import 'package:flutter_test_app/util/file_store.dart';

class SavedList extends StatelessWidget {
  final _biggerFont = TextStyle(fontSize: 18.0);

  final Set<String> _saved;

  SavedList(saved) : _saved = saved;

  Function _clearSuggestions(BuildContext context) => () async {
        final result = await FileStore.clearSuggestions();
        final message = result
            ? 'Saved suggestions cleared'
            : 'There was an error clearing the saved suggestions';

        final snackbar = new SnackBar(
          content: Text(message),
        );

        Scaffold.of(context).showSnackBar(snackbar);
      };

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
        actions: <Widget>[
          new IconButton(
            icon: const Icon(Icons.delete_forever),
            onPressed: _clearSuggestions(context),
          )
        ],
      ),
      body: new ListView(
        children: divided,
      ),
    );
  }
}
