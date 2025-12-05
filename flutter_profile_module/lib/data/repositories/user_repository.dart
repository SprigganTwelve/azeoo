import 'dart:convert';

import 'package:flutter_profile_module/core/api_client.dart';
import 'package:flutter_profile_module/core/cache_management.dart';
import 'package:flutter_profile_module/data/models/user_model.dart';




class UserRepository {

  // get a specific user from the api
  Future<UserModel> findUserById(int id) async{
    try {
        final UserModel? savedUser = await CacheManager.retreiveExistingUser(id);
        
        //check if the user is not saved yet
        if( savedUser != null){
          return savedUser; 
        }
        
        //call api
        final String responseData = await FetchUserDataApi.findUserById(id);
        final user = jsonDecode(responseData);
        CacheManager.saveUserToCache(user);
        return UserModel.fromJSON(user);
    }
    catch (e) {
      print("Something went wrong");
      throw Exception("Something went wrong while getting the user");
    }
  }

}
