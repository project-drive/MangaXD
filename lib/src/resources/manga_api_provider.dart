import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/item_model.dart';

class MangaApiProvider {
  Client client = Client();
  
  Future<ItemModel> fetchMangaList() async {
    print("entered");
    final response = await client
        .get("https://www.mangaeden.com/api/list/0/");
    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}