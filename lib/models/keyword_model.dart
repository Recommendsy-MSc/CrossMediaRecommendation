class KeywordModel{
  String? id;
  String? name;

  KeywordModel.fromJson(jsonMap){
    try{
      id = jsonMap['id'] != null ? jsonMap['id'].toString() : "-1";
      name = jsonMap['name'] != null ? jsonMap['name'].toString() : "";
    }catch(e){
      print("Keywrods: " + e.toString());
    }
  }

  Map toMap(){
    var m = <String, dynamic>{};

    m['id'] = int.parse(id!);
    m['name'] = name!;

    return m;
  }
}