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
  List<_Result> get results => _results;
  int get totalResults => _totalResults;
}

class _Result {
  String _id;
  String _title;
  String _posterPath;
  List<String> _category;

  _Result(_result) {
    _id = _result['i'];
    _title = _result['t'];
    _posterPath = _result['im'];
    _category = _result['c'];
  }

  String get id => _id;
  String get title => _title;
  String get posterPath => _posterPath;
  List<String> get category => _category;
}
