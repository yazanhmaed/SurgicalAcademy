class UserModel {
  String? uId;
  String? name;
  String? email;
  String? password;
  
  UserModel({
 this.uId,
    this.name,
    this.email,
    this.password,
   
  });

  UserModel.fromJson(Map<String, dynamic> json) {
   uId = json['uId'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
  
  }

  Map<String, dynamic> toMap() {
    return {
      'uId':uId,
      'name': name,
      'email': email,
      'password': password,
     
    };
  }
}
