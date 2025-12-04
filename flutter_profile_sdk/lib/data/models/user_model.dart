

// User Profile : Shape user profile data

class UserModel{
  final int age;
  final String name;
  final String email;
  final String imageUrl;

  UserModel({ 
    required this.name,
    required this.email,
    required this.age,
    required this.imageUrl,
  });

  //converting user data (from api) into user model
  factory UserModel.fromJSON(Map<String, dynamic> json){
    return UserModel(name: json['name'], email: json['email'], age:json['age'], imageUrl: json["imageUrl"]);
  }

  //Determine how the user name should be represented
  String getFullName(){
    return name;
  }
}