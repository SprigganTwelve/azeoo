




import 'package:example/data/models/user_model.dart';
import 'package:example/data/repositories/user_repository.dart';

class GetUserProfileUseCase {
  final UserRepository userRepository;

  GetUserProfileUseCase({required this.userRepository});

  // get the user info by id without meddling with how it work
  Future<UserModel> fetchUserId(int id) {
    return userRepository.findUserById(id);
  }

}