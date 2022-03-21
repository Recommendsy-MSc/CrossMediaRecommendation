import 'BaseModel.dart';

class GenreModel implements BaseModel{
  String? id;
  String? name;

  GenreModel.fromJson(jsonMap){
    try{
      id = jsonMap['id'] != null ? jsonMap['id'].toString() : "-1";
      name = jsonMap['name'] != null ? jsonMap['name'].toString() : "";
    }catch(e){
      print("Genre:" + e.toString());
    }
  }

  @override
  Map<String, dynamic> toMap(){
    var m = <String, dynamic>{};

    m['id'] = int.parse(id!);
    m['name'] = name!;

    return m;
  }
}