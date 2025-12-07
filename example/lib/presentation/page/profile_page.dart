import 'package:flutter/material.dart';
import '../state/user_state_riverprod.dart';
import '../../data/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class ProfileFrame extends ConsumerStatefulWidget {
  const ProfileFrame({super.key});
  static void Function(int id)? updateUserId;

  @override
  ConsumerState<ProfileFrame> createState() => _ProfileFrameState(); 
}



class _ProfileFrameState extends ConsumerState<ProfileFrame>{

  static bool isHandlerRegistered = false;

  @override
  void initState() {
    super.initState();

    if (!isHandlerRegistered) {
      isHandlerRegistered = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ProfileFrame.updateUserId = (id){
            // desactivate the default cache on provider
            ref.invalidate(trackedUserIdProvider(id));
            ref.read(trackedUserId.notifier).state = id; // updatie id
        };
      });
    }
  }


  @override
  Widget build(BuildContext context){
    final currentUserId = ref.watch(trackedUserId);
    final profile = ref.watch(trackedUserIdProvider(currentUserId));

    return profile.when(
      data: (user)=> ProfilePage(user: user),
      loading: () => CircularProgressIndicator(),
      error: (err, _) => Text(err.toString())
    );
  } 
}



class ProfilePage extends StatelessWidget {
  const ProfilePage({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(height: 170),
          CircleAvatar(
            radius: 60,
            backgroundImage: user.imageUrl.isNotEmpty
              ? NetworkImage(user.imageUrl)
              : const AssetImage("assets/images/images.png") as ImageProvider,
          ),
          Text(
            user.getFullName(),
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
