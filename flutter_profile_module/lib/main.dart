import 'package:flutter/material.dart';
import 'package:flutter_profile_module/presentation/page/profile_page.dart';

void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ProfileFrame(
          updateUserCallback: (setUserId) => setUserId(42),
        ),
      ),
    );
  }
}