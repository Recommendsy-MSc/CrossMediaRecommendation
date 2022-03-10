class UserModel{
  String? id;
  String? name;
  String? email;
  String? birth_year;
  String? image_url;
  String? token;
  String? username;

  UserModel.fromJson(jsonMap, {token}){
    try{
      id = jsonMap['id'] != null ? jsonMap['id'].toString() : '-1';
      name = jsonMap['name'] ?? '';
      email = jsonMap['email'] ?? '';
      birth_year = jsonMap['birth_year'] ?? '';
      image_url = jsonMap['image_url'] ?? '';
      this.token = token;
      username = jsonMap['username'] ?? '';
    }catch(e){

    }
  }
}