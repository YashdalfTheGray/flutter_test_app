import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class SavedList extends StatelessWidget {
  final _biggerFont = TextStyle(fontSize: 18.0);

  final Set<WordPair> _saved;

  SavedList(saved) : _saved = saved;

  @override
  Widget build(BuildContext context) {
    final tiles = _saved.map((WordPair pair) {
      return new ListTile(
          title: new Text(pair.asPascalCase, style: _biggerFont));
    });

    final divided =
        ListTile.divideTiles(context: context, tiles: tiles).toList();

    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Saved Suggestions'),
      ),
      body: new ListView(
        children: divided,
      ),
    );
  }
}
