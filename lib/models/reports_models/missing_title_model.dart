class MissingTitleModel{
  String? id;
  String? title;
  String? created_date;
  String? user;
  int? title_type;

  MissingTitleModel.fromJson(jsonMap){
    try{
      id = jsonMap['id'] != null ? jsonMap['id'].toString() : '';
      title = jsonMap['title'] ?? "";
      created_date = jsonMap['created_date'] != null ? jsonMap['created_date'].toString() : '';
      print(created_date);
      user = jsonMap['user'] != null ? jsonMap['user'].toString() : '';
      title_type = jsonMap['title_type'] ?? '0';
    }
    catch(e){
      print(e);
    }
  }
}