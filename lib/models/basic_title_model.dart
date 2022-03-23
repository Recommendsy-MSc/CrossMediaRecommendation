import 'BaseModel.dart';

class BasicTitleModel implements BaseModel{
  String? id;
  String? title;
  String? poster_path;
  int? title_type;
  int? user_rating;

  BasicTitleModel({this.id, this.title_type});

  BasicTitleModel.fromJson(jsonMap){
    try{
      id = jsonMap['id'] != null ? jsonMap['id'].toString() : "-1";
      title = jsonMap['title'] != null ? jsonMap['title'].toString() : "";
      poster_path = jsonMap['poster_path'] ?? '';
      title_type = jsonMap['title_type'] ?? '0';
      user_rating = jsonMap['user_rating'] ?? 0;
    }catch(e){
      // printe.toString());
      // CustomTrace(StackTrace.current, message: e.toString());
    }
  }

  @override
  Map<String, dynamic> toMap(){
    var m = <String, dynamic>{};
    m['id'] = int.parse(id!);
    m['title'] = title!;
    m['poster_path'] = poster_path!;
    m['title_type'] = title_type;
    return m;
  }
}