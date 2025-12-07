

// User Profile : Shape user profile data

import 'dart:convert';

import 'package:flutter_app/core/errors/models/user_model_errors.dart';

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
  factory UserModel.fromJSON(Map<String, dynamic> json) {
    try{
        //handle if or not the piture is available
        String imageUrl = '';
        if (json["picture"] != null && json["picture"] is List && (json["picture"] as List).isNotEmpty) {
          final firstPicture = (json["picture"] as List).first;
          if (firstPicture is Map && firstPicture.containsKey("url")) {
            imageUrl = firstPicture["url"];
          }
        }

        return UserModel(
          id: json['id'] ?? 0,
          firstName: json['first_name'] ?? '',
          lastName: json['last_name'] ?? '',
          email: json['email'] ?? '',
          imageUrl: imageUrl,
        );
    }
    catch(e){
      throw UserModelCovertIntoFactoryException("FAILED TO CONVERT USER INTO FACTORY");
    }
  }



  //Check if an user could be create from a string 
  static bool validateJSONModel(String stringResponse){
    try {
      final Map<String, dynamic> json = jsonDecode(stringResponse);
      if(!json.containsKey("id")) return false;
      if(!json.containsKey("last_name")) return false;
      if(!json.containsKey("first_name")) return false;

      if(json['id'] is! int ) return false;
      if(json['last_name']  is! String) return false;
      if(json['first_name'] is! String) return false;
      return true;
    }
    catch (e) {
      return false; //invalid  
    }
  }


  //Determine how the user name should be represented
  String getFullName(){
    return "$firstName $lastName";
  }
}