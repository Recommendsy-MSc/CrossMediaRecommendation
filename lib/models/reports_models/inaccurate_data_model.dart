class InaccurateDataModel{
  String? id;
  String? title;
  String? createdDate;
  String? name;
  int? type;
  String? note;
  String? user;
  bool? active;

  InaccurateDataModel.fromJson(jsonMap){
    try{
      id = jsonMap['id'] != null ? jsonMap['id'].toString() : '-1';
      title = jsonMap['title'] ?? '';
      createdDate = jsonMap['created_date'].toString();
      type = jsonMap['type'] ?? '-1';
      name = jsonMap['name'] ?? '';
      user = jsonMap['user'] != null ? jsonMap['user'].toString() : '';
      note = jsonMap['note'] ?? '';
      active = jsonMap['active'] ?? false;

    }catch(e){
      print("Error:" + e.toString());
    }
  }
}