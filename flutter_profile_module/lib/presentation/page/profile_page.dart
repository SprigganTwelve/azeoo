

import 'package:flutter/material.dart';
import 'package:flutter_profile_module/data/models/user_model.dart';
import 'package:flutter_profile_module/data/repositories/user_repository.dart';
import 'package:flutter_profile_module/domain/get_user_profile.dart';
import 'package:flutter_profile_module/presentation/state/user_state_riverprod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';




class ProfileFrame extends ConsumerStatefulWidget{

  final void Function(void Function(int userd) setUserId) updateUserCallback;
  final userProfileUseCase = GetUserProfileUseCase(userRepository: UserRepository());

  ProfileFrame({
    super.key,
    required this.updateUserCallback
  });
  @override
  ConsumerState<ProfileFrame> createState() => _ProfileFrameState();
}



class _ProfileFrameState extends ConsumerState<ProfileFrame> {
  
  @override
  void initState() {
    super.initState();
    void setUserId(int newUserId){
      if (ref.read(trackedUserId.notifier).state != newUserId) {
        ref.read(trackedUserId.notifier).state = newUserId;
      }
    }
    // callback for change the userId from other application/module
    widget.updateUserCallback(setUserId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.userProfileUseCase.fetchUserId(ref.watch(trackedUserId)),
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

