

import 'package:example/data/repositories/user_repository.dart';
import 'package:example/domain/get_user_profile.dart';
import 'package:example/presentation/state/user_state_riverprod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required this.updateUserCallback});

  final void Function(void Function(int newUserId)) updateUserCallback;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: ProfileFrame(updateUserCallback: updateUserCallback),
    );
  }
}


class ProfileFrame extends ConsumerStatefulWidget {
  final void Function(void Function(int)) updateUserCallback;
  final userProfileUseCase = GetUserProfileUseCase(userRepository: UserRepository());

  ProfileFrame({super.key, required this.updateUserCallback});

  @override
  ConsumerState<ProfileFrame> createState() => _ProfileFrameState();
}


class _ProfileFrameState extends ConsumerState<ProfileFrame> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      void setUserId(int newUserId){
        if (ref.read(trackedUserId.notifier).state != newUserId) {
          ref.read(trackedUserId.notifier).state = newUserId;
        }
      }
      widget.updateUserCallback(setUserId);
    });
  }


  @override
  Widget build(BuildContext context) {

    final userId = ref.watch(trackedUserId);

    return FutureBuilder(
      future: widget.userProfileUseCase.fetchUserId(userId),
      builder: (context, snapshot) {

        if(snapshot.error != null){
          return const Center(child: Text("Something went wrong", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),));
        }

        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final user = snapshot.data!;

        return Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 170,),
              ClipRRect(
                borderRadius: BorderRadius.circular(150),
                child: Image.network(
                  user.imageUrl,
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                user.getFullName(),
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
