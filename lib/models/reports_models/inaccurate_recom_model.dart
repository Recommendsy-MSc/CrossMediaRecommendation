import 'package:cross_media_recommendation/models/BaseModel.dart';

class InaccurateRecomModel implements BaseModel{
  String? id;
  String? title;
  String? recommendedTitle;
  String? createdDate;
  String? name;
  String? recommendedName;
  int? type;
  int? recommendedType;
  int? count;
  bool? active;

  InaccurateRecomModel.fromJson(jsonMap){
    try{
      id = jsonMap['id'] != null ? jsonMap['id'].toString() : '-1';
      title = jsonMap['title'] ?? '';
      recommendedName = jsonMap['recommended_name'] ?? '';
      recommendedTitle = jsonMap['recommended_title'] ?? '';
      createdDate = jsonMap['created_date'].toString();
      type = jsonMap['type'] ?? '-1';
      recommendedType = jsonMap['recommended_type'] ?? '-1';
      count = jsonMap['count'] ?? '-1';
      name = jsonMap['name'] ?? '';
      active = jsonMap['active'] ?? false;
    }catch(e){
      print("Error:" + e.toString());
    }
  }

  @override
  Map<String, dynamic> toMap(){
    var m = <String, dynamic>{};
    return m;
  }
}