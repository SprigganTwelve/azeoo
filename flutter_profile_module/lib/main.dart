import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_profile_module/presentation/page/profile_page.dart';
import 'package:go_router/go_router.dart';





void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}




class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final _router = GoRouter(
      initialLocation: "/profile",
      routes: [
        GoRoute(
          path: "/profile",
          builder: (context, state) => Scaffold(
            body: const ProfileFrame(),
            backgroundColor: Colors.white,
          ),
        ),
      ],
    );

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}
