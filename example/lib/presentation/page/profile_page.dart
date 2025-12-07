import 'package:flutter/material.dart';
import '../state/user_state_riverprod.dart';
import '../../data/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class ProfileFrame extends ConsumerWidget {
  const ProfileFrame({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.watch(trackedUserId);
    final userAsync = ref.watch(trackedUserIdProvider(userId));

    return userAsync.when(
      data: (user) => _buildProfile(user),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) {
        print("ERROR STATE: $err");
        return Center(
          child: Text(
            "Something went wrong",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        );
      }
    );
  }

  Widget _buildProfile(UserModel user) {
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
