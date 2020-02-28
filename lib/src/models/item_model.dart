class ItemModel {
  int _totalResults;
  List<_Result> _results = [];

  ItemModel.fromJson(Map<String, dynamic> parsedJson) {
    print(parsedJson['manga'].length);
    _totalResults = parsedJson['total'];
    List<_Result> temp = [];
    for (int i = 0; i < parsedJson['manga'].length; i++) {
      _Result result = _Result(parsedJson['manga'][i]);
      temp.add(result);
    }
    _results = temp;
  }
}

class _Result{
  String _id;
  String _title;
  String _posterPath;
  List<String> _category;
  String _artist;
  
}
