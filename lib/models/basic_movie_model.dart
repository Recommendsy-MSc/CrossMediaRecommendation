class BasicMovieModel{
  String? id;
  String? title;
  String? poster_path;

  BasicMovieModel.fromJson(jsonMap){
    try{
      id = jsonMap['id'] != null ? jsonMap['id'].toString() : "-1";
      title = jsonMap['title'] != null ? jsonMap['title'].toString() : "";
      poster_path = jsonMap['poster_path'] ?? '';
    }catch(e){
      print(e.toString());
      // CustomTrace(StackTrace.current, message: e.toString());
    }
  }

  Map toMap(){
    var m = Map<String, dynamic>();
    m['id'] = int.parse(id!);
    m['title'] = title!;
    m['poster_path'] = poster_path!;

    return m;
  }
}