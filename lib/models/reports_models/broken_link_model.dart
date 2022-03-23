import 'package:cross_media_recommendation/models/BaseModel.dart';

class BrokenLinkModel implements BaseModel{
  String? id;
  String? title;
  String? createdDate;
  String? name;
  int? type;
  int? count;
  bool? active;

  BrokenLinkModel.fromJson(jsonMap){
    try{
      id = jsonMap['id'] != null ? jsonMap['id'].toString() : "-1";
      title = jsonMap['title'] != null ? jsonMap['title'].toString() : '-1';
      createdDate = jsonMap['created_date'].toString();
      type = jsonMap['type'] ?? '-1';
      name = jsonMap['name'] ?? '';
      count = jsonMap['count'] ?? '-1';
      active = jsonMap['active'] ?? false;
    }catch(e){
      // print"Error:" + e.toString());
    }
  }

  @override
  Map<String, dynamic> toMap(){
    var m = <String, dynamic>{};
    return m;
  }
}