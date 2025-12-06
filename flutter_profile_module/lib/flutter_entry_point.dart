import 'package:flutter/material.dart';
import 'package:flutter_profile_module/presentation/page/profile_page.dart';

class FlutterProfileView extends StatelessWidget {
  final void Function(void Function(int)) updateUserCallback;

  const FlutterProfileView({super.key, required this.updateUserCallback});

  @override
  Widget build(BuildContext context) {
    return ProfileFrame(
      updateUserCallback: updateUserCallback,
    );
  }
}

// Entrypoint appelé par l'AAR
void showProfileFrame() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: FlutterProfileView(
      updateUserCallback: (userId) {
        print("Flutter received userId: $userId");
      },
    ),
  ));
}
