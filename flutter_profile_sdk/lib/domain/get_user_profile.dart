

import 'package:flutter_profile_sdk/data/models/user_model.dart';
import 'package:flutter_profile_sdk/data/repositories/user_repository.dart';

class GetUserProfileUseCase {
  final UserRepository userRepository;

  GetUserProfileUseCase({required this.userRepository});

  // get the user info by id without meddling with how it work
  Future<UserModel> fetchUserId() async {
    return UserModel.fromJSON({
      "email": "mark@outlook.com",
      "age": 12,
      "name": "Mark robin",
      "imageUrl": "..."
    });
  }

}