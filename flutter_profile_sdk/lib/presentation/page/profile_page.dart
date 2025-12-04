

import 'package:flutter/material.dart';
import 'package:flutter_profile_sdk/data/models/user_model.dart';
import 'package:flutter_profile_sdk/data/repositories/user_repository.dart';
import 'package:flutter_profile_sdk/domain/get_user_profile.dart';

class UserProfilePage extends StatelessWidget {
  UserProfilePage({super.key});
  final userProfileUseCase = GetUserProfileUseCase(userRepository: UserRepository());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: userProfileUseCase.fetchUserId(),
      builder: (context, snapshot){
        if(!snapshot.hasData){
          return Center(child: CircularProgressIndicator());
        }

        final UserModel user = snapshot.data!;

        return Padding(
          padding: EdgeInsets.only(top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      user.imageUrl,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    user.getFullName(),
                    style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500
                  ))
            ],
          ),
        );
      } 
    );
  }
}

