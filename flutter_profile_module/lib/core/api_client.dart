

import 'package:flutter_profile_module/core/errors/api_errors.dart';
import 'package:flutter_profile_module/data/models/user_model.dart';
import 'package:http/http.dart' as http;



class FetchUserDataApi {

  static Future<String> findUserById(int id) async {
    try {
      final response = await http.get(
        Uri.parse("https://api.azeoo.dev/v1/users/me"),
        headers: {
          "X-User-Id": id.toString(),
          "Accept-Language": "fr-FR",
          "Authorization": "Bearer api_474758da8532e795f63bc4e5e6beca7298379993f65bb861f2e8e13c352cc4dcebcc3b10961a5c369edb05fbc0b0053cf63df1c53d9ddd7e4e5d680beb514d20"
        },
      ).timeout(const Duration(seconds: 4));

      if (response.statusCode != 200) {
        throw FetchAPIException("Failed to fetch user");
      }

      if(UserModel.validateJSONModel(response.body) != true){
        throw InvalidateAPIResponseException("Api response - Wrong format");
      }

      return response.body;

    } catch (e) {
      print("Something went wrong while retrieving user data: $e");
      throw Exception("Something went wrong");
    }
  }

}
