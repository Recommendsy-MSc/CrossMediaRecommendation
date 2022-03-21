import 'BaseModel.dart';

class CastModel implements BaseModel{
  String? id;
  String? name;
  String? profile_path;
  String? popularity;

  CastModel.fromJson(jsonMap){
    try{
      id = jsonMap['id'] ?? '-1';
      name = jsonMap['name'] ?? '';
      profile_path = jsonMap['profile_path'];
      popularity = jsonMap['popularity'] != null ? jsonMap['popularity'].toString() : '';
    }catch(e){
      print("Cast: " + e.toString());
    }
  }

  @override
  Map<String, dynamic> toMap(){
    var m = <String, dynamic>{};
    return m;
  }
}