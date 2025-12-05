

// User Profile : Shape user profile data

class UserModel{
  final int id;
  final int age;
  final String email;
  final String lastName;
  final String firstName;
  final String imageUrl;

  UserModel({
    required this.id,
    required this.age,
    required this.email,
    required this.imageUrl,
    required this.lastName,
    required this.firstName,
  });

  //converting user data (from api) into user model
  factory UserModel.fromJSON(Map<String, dynamic> json){
    return UserModel(
      id:         json['id'],
      firstName:  json['first_name'],
      lastName:   json['last_name'],
      email:      json['email'],
      age:        json['age'],
      imageUrl:   json["picture"][0]["url"]
    );
  }

  //Determine how the user name should be represented
  String getFullName(){
    return "$firstName $lastName";
  }
}