class BasicTitleModel{
  String? id;
  String? title;

  BasicTitleModel.fromJson(jsonMap){
    try{
      id = jsonMap['id'] != null ? jsonMap['id'].toString() : "-1";
      title = jsonMap['title'] != null ? jsonMap['title'].toString() : "";
    }catch(e){
      print(e.toString());
      // CustomTrace(StackTrace.current, message: e.toString());
    }
  }
}