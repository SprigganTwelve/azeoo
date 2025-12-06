

import 'dart:convert';

import 'package:example/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheManager{

  static Future<UserModel?> retreiveExistingUser(int userId) async {
    
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final userCache = sharedPreferences.getString("userCache") ?? "{}";
    final Map<String, dynamic> cachedMap = json.decode(userCache);
    final userJson = cachedMap[userId.toString()];

    if (userJson == null) return null;

    final userMap = userJson;

    return UserModel.fromJSON(userMap);

  }


  static Future<void> saveUserToCache(UserModel user) async {

    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final String userCache = sharedPreferences.getString("userCache") ?? "{}";
    final Map<String, dynamic> cachedMap = jsonDecode(userCache);

    cachedMap[user.id.toString()] = {
      "id": user.id,
      "first_name": user.firstName,
      "last_name": user.lastName,
      "email": user.email,
      "picture": [{"url": user.imageUrl}]
    };

    await sharedPreferences.setString("userCache", jsonEncode(cachedMap));
  }

}