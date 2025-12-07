


// Provider d'état



import 'package:flutter_app/data/models/user_model.dart';
import 'package:flutter_app/data/repositories/user_repository.dart';
import 'package:flutter_app/domain/get_user_profile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



final trackedUserId = StateProvider<int>((_) => 14);


final trackedUserIdProvider = FutureProvider.family<UserModel, int>((ref, userId) async {
    if(userId <= 0){
          throw Exception("Invalid userId");
    }
    final repository = UserRepository();
    final useCase = GetUserProfileUseCase(userRepository: repository);
    return await useCase.fetchUserId(userId);
});
