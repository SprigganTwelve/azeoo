


// Provider d'état



import 'package:example/data/models/user_model.dart';
import 'package:example/data/repositories/user_repository.dart';
import 'package:example/domain/get_user_profile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final trackedUserId = StateProvider<int>((_) => 14);


final trackedUserIdProvider = FutureProvider.family<UserModel, int>((ref, userId) async {
    if(userId <= 0){
          throw Exception("Invalid userId");
    }
    final repository = UserRepository();
    final useCase = GetUserProfileUseCase(userRepository: repository);
    return await useCase.fetchUserId(userId);
});
