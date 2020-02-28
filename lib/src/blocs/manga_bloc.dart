import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/item_model.dart';

class MangaBloc {
  final _repository = Repository();
  final _mangaFetcher = PublishSubject<ItemModel>();

  Stream<ItemModel> get allManga => _mangaFetcher.stream;

  fetchAllManga() async {
    ItemModel itemModel = await _repository.fetchAllManga();
    _mangaFetcher.sink.add(itemModel);
  }

  dispose() {
    _mangaFetcher.close();
  }
}

final bloc = MangaBloc();
