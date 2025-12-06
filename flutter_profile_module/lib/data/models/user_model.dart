

// User Profile : Shape user profile data

class UserModel{
  final int id;
  final String email;
  final String lastName;
  final String firstName;
  final String imageUrl;

  UserModel({
    required this.id,
    required this.email,
    required this.imageUrl,
    required this.lastName,
    required this.firstName,
  });

  //converting user data (from api) into user model
  factory UserModel.fromJSON(Map<String, dynamic> json){
    print("USER Model  $json");
    return UserModel(
      id:         json['id'],
      firstName:  json['first_name'],
      lastName:   json['last_name'],
      email:      json['email'],
      imageUrl:   json["picture"][0]["url"]
    );
  }

  //Determine how the user name should be represented
  String getFullName(){
    return "$firstName $lastName";
  }
}