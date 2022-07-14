class lyrics {
  lyrics();
  List<Result> _results = [];

  lyrics.fromJson(Map<String, dynamic> parsedJson) {
    List<Result> temp = [];

    Result result = Result(parsedJson['message']['body']['lyrics']);
    temp.add(result);

    _results = temp;
  }

  List<Result> get results => _results;
}

class Result {
  late String lyrics_body;

  Result(result) {
    lyrics_body = result['lyrics_body'];
  }
}
