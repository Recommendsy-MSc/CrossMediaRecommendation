class BasicTvModel{
  String? id;
  String? title;
  String? poster_path;

  BasicTvModel.fromJson(jsonMap){
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
    var m = <String, dynamic>{};
    m['id'] = int.parse(id!);
    m['title'] = title!;
    m['poster_path'] = poster_path!;

    return m;
  }
}