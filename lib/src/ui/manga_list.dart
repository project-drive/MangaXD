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
    return ListView.builder(
        itemCount: snapshot.data.results.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(snapshot, index);
        });
  }
}


SizedBox makeCard(snapshot, index) {
  String t = snapshot.data.results[index].title;
  String imgPath = snapshot.data.results[index].posterPath;
  const cardPadding = 5.0;
  const titleSize = 20.0;
  if (index % 2 == 0) {
    return SizedBox(
      width: 200,
      height: 200,
      child: Padding(
        padding: const EdgeInsets.all(cardPadding),
        child: Card(
          color: Colors.red,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  child: getImage(imgPath),
                  padding: EdgeInsets.all(10),
                ),
              ),
              Expanded(
                child: Text(
                  t,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: titleSize),
                ),
              )
            ],
          ),
        ),
      ),
    );
  } else {
    return SizedBox(
      width: 200,
      height: 200,
      child: Padding(
        padding: const EdgeInsets.all(cardPadding),
        child: Card(
          color: Colors.blue,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  t,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: titleSize),
                ),
              ),
              Expanded(
                child: Padding(
                  child: getImage(imgPath),
                  padding: EdgeInsets.all(10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Image getImage(path) {
  // Given a path, returns image
  if (path == null) {
    return Image.asset(
      'assets/images/cnf.jpg',
      fit: BoxFit.fill,
    );
  } else {
    return Image.network(
      'http://cdn.mangaeden.com/mangasimg/${path}',
      fit: BoxFit.fill,
    );
  }
}

