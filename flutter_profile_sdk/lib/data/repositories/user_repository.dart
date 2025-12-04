
//
import 'package:flutter_profile_sdk/data/models/user_model.dart';



class UserRepository {

  // get a specific user from the api
  Future<UserModel> fetchUserId(String id) {
    //....
    return Future.value(
      UserModel.fromJSON({
        "email": "mark@outlook.com",
        "age": 12,
        "name": "Mark robin"
      }),
    );
  }

}
