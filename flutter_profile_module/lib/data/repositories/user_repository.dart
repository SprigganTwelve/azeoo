import 'dart:convert';

import '../../core/api_client.dart';
import '../../core/cache_management.dart';
import '../models/user_model.dart';


class UserRepository {

  // get a specific user from the api
  Future<UserModel> findUserById(int id) async{
    try{
      print("USER ID: $id");
      // CacheManager.clearCache();
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
      return userModel;
    }
    catch(e){
        print("USER REPOSITORY FAILED: $e");
        rethrow;
    }
  }
}
