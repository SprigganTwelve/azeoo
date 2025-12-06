
import 'package:example/presentation/page/profile_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: ProfilePage(
          updateUserCallback: (setUserId) => setUserId(2),
        ),
      ),
    );
  }
}