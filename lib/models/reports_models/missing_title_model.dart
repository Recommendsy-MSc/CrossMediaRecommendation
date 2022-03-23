import 'package:cross_media_recommendation/models/BaseModel.dart';

class MissingTitleModel implements BaseModel{
  String? id;
  String? title;
  String? created_date;
  String? user;
  int? title_type;
  bool? active;
  String? added;

  MissingTitleModel.fromJson(jsonMap){
    try{
      id = jsonMap['id'] != null ? jsonMap['id'].toString() : '';
      title = jsonMap['title'] ?? "";
      created_date = jsonMap['created_date'] != null ? jsonMap['created_date'].toString() : '';
      // printcreated_date);
      user = jsonMap['user'] != null ? jsonMap['user'].toString() : '';
      title_type = jsonMap['title_type'] ?? '0';
      active = jsonMap['active'] ?? false;
      added = jsonMap['added'] ?? '';
    }
    catch(e){
      // printe);
    }
  }

  @override
  Map<String, dynamic> toMap(){
    var m = <String, dynamic>{};
    return m;
  }
}