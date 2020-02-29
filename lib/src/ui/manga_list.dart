import 'package:flutter/material.dart';
import '../models/item_model.dart';
import '../blocs/manga_bloc.dart';

class MangaList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bloc.fetchAllManga();
    return Scaffold(
      appBar: AppBar(
        title: Text('MangaXD'),
      ),
      body: StreamBuilder(
        stream: bloc.allManga,
        builder: (context, AsyncSnapshot<ItemModel> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<ItemModel> snapshot) {
    return GridView.builder(
        itemCount: snapshot.data.results.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return snapshot.data.results[index].posterPath == null
              ? Image.asset('assets/images/cnf.jpg')
              : Image.network(
                  'https://cdn.mangaeden.com/mangasimg/${snapshot.data.results[index].posterPath}',
                  fit: BoxFit.cover,
                );
        });
  }
}
