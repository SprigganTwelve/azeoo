

import 'dart:convert';

import 'package:flutter_profile_module/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheManager{

  static Future<UserModel?> retreiveExistingUser(int userId)async{

    final sharedPreferences = await SharedPreferences.getInstance();
    final userCahce = sharedPreferences.getString("userCache") ?? "{}";
    final Map<String, dynamic> cachedMap = json.decode(userCahce);
    final userJson = cachedMap[userId.toString()];

    if(userJson) return null;
    return UserModel.fromJSON(Map<String, dynamic>.from(userJson));
  }


  static Future<void> saveUserToCache(UserModel user) async {
      final sharedPreferences = await SharedPreferences.getInstance();
      final userCahce = sharedPreferences.getString("userCache") ?? "{}";
      final Map<String, dynamic> cachedMap = json.decode(userCahce);

      cachedMap[user.id.toString()] = jsonEncode(user);
      await sharedPreferences.setString("userCache", json.encode(cachedMap));
  }

}