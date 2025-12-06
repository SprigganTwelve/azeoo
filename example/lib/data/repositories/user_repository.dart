import 'dart:convert';

import 'package:example/core/api_client.dart';
import 'package:example/core/cache_management.dart';
import 'package:example/data/models/user_model.dart';

class UserRepository {

  // get a specific user from the api
  Future<UserModel> findUserById(int id) async{
    try {
      print("USER ID: $id");
      final UserModel? savedUser = await CacheManager.retreiveExistingUser(id);
        
      //check if the user is not saved yet
      if( savedUser != null){
        return savedUser; 
      }
      
      //call api
      final String responseData = await FetchUserDataApi.findUserById(id);
      final user = Map<String, dynamic>.from(jsonDecode(responseData));

      var userModel = UserModel.fromJSON(user);

      await CacheManager.saveUserToCache(userModel);
      return UserModel.fromJSON(user);
    }
    catch (e) {
      print("Something went wrong while using the user_repository: $e");
      throw Exception("Something went wrong while getting the user: $e");
    }
  }

}
