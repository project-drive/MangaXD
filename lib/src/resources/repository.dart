import 'dart:async';
import 'manga_api_provider.dart';
import '../models/item_model.dart';

class Repository {
  final mangaApiProvider = MangaApiProvider();
  Future<ItemModel> fetchAllManga() => mangaApiProvider.fetchMangaList();
}