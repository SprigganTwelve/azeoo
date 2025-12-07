

import 'dart:convert';

import 'package:example/core/errors/cache_errors.dart';

import '../data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';



class CacheManager{

  static Future<UserModel?> retreiveExistingUser(int userId) async {
    try{
      final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      final userCache = sharedPreferences.getString("userCache") ?? "{}";
      final Map<String, dynamic> cachedMap = json.decode(userCache);
      final userJson = cachedMap[userId.toString()];

      if (userJson == null) return null;

      final userMap = userJson;

      return UserModel.fromJSON(userMap);
    }
    catch(e){
      throw CheckUserInCacheException("CACHEMANAGER TARGET AN EXCEPTION WHILE  EXECUTING retreiveExistingUser");
    }
  }


  static Future<void> saveUserToCache(UserModel user) async {
    try{
      final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      final String userCache = sharedPreferences.getString("userCache") ?? "{}";
      final Map<String, dynamic> cachedMap = jsonDecode(userCache);

      cachedMap[user.id.toString()] = {
        "id": user.id,
        "email": user.email,
        "first_name": user.firstName,
        "last_name": user.lastName,
        "picture": user.imageUrl
      };

      await sharedPreferences.setString("userCache", jsonEncode(cachedMap));
    }
    catch(e){
      throw SaveUserInToCacheException("CACHEMANAGER TARGET AN EXCEPTION WHILE  EXECUTING saveUserToCache");
    }
  }


  static Future<void> clearCache() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove("userCache"); 
  }

}