import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_test_app/screens/saved_list/index.dart';
import 'package:flutter_test_app/util/file_store.dart';

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = TextStyle(fontSize: 18.0);

  var _saved = Set<String>();

  Widget _buildRow(WordPair pair, BuildContext context) {
    final alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Theme.of(context).accentColor : null,
      ),
      onTap: () async {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair.asPascalCase);
          } else {
            _saved.add(pair.asPascalCase);
          }
        });

        FileStore.writeSuggestions(_saved);
      },
    );
  }

  Widget _buildSuggestions(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();

          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index], context);
        });
  }

  void _pushSaved() {
    Navigator.of(context).push(new MaterialPageRoute(
        builder: (BuildContext context) => new SavedList(_saved)));
  }

  @override
  void initState() async {
    super.initState();

    _saved = await FileStore.readSuggestions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
        actions: <Widget>[
          new IconButton(
            icon: const Icon(Icons.list),
            onPressed: _pushSaved,
          )
        ],
      ),
      body: _buildSuggestions(context),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}
